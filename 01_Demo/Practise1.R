install.packages("tidyverse")
install.packages("jsonlite")
install.packages("dplyr")
install.packages("ggplot2")

x<-3
x
numlist<- c(0,1,2,3,4,5,6,7,8,9)
numlist

demo_table<-read.csv(file='demo.csv',check.names=F,stringsAsFactors=F)
demo_table
demo_table2<-fromJSON(txt="demo.json")
demo_table2

demo_table$"Year"[2]
filter_table<-demo_table2[demo_table2$price>10000,]
filter_table

filter_table2<-subset(demo_table2,price>10000 & drive=="4wd" & "clean" %in% title_status)
filter_table2


sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)

num_rows<- 1:nrow(demo_table)
num_rows
sample_rows<-sample(num_rows,3)
sample_rows
demo_table[sample_rows,]

demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) #add columns to original data frame
demo_table
#summarize_demo<- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage = mean(odometer), .groups = "keep")
summarize_demo<- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), Maximum_Price = max(price), Num_Vehicles = n(), .groups = "keep")
summarize_demo2<- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), Maximum_Price = max(price), Num_Vehicles = n(), .groups = "drop")
summarize_demo3<- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), Maximum_Price = max(price), Num_Vehicles = n(), .groups = "rowwise")

demo_table3<- read.csv("demo2.csv", check.names = F, stringsAsFactors = F)
long_table <- gather (demo_table3, key = "Metric", value = "Score", buying_price:popularity)
long_table2 <- demo_table3 %>% gather (key = "Metric", value = "Score", buying_price:popularity)


wide_table <- long_table %>% spread(key = "Metric", value = "Score")
wide_table2 <- spread(long_table,key="Metric",value="Score")

all.equal(wide_table,long_table)

head(mpg)

plt<- ggplot(mpg,aes(x=class))
plt + geom_bar()

# column plot
mpg_summary<-mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count = n(), .groups = "keep")
plt <- ggplot(mpg_summary, aes(x=manufacturer, y=Vehicle_Count))
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles")
theme(axis.text.x=element_text(angle=45,hjust=1)) #rotate the x-axis label 45 degrees


# line plot
mpg_summary <-subset(mpg, manufacturer =="toyota") %>% group_by (cyl) %>% summarise(Mean_Hwy = mean(hwy))
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy))
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) #add line plot with labels

# point lot
plt <- ggplot(mpg, aes(x=displ, y=cty, color=class))
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color = "Vehicle Class")

# boxplot
plt<- ggplot(mpg, aes(x=manufacturer, y=hwy))
plt+geom_boxplot()+theme(axis.text.x = element_text(angle =45, hjust=1))

# heatmap
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy = mean(hwy), groups="keep")
plt <- ggplot(mpg_summary, aes(x=class, y=factor(year), fill = Mean_Hwy))
plt + geom_tile() + labs(x="Vehicle Class", y="Vehicle Year", fill= "Mean Hightway (MPG)")

# heatmap2
mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy = mean(hwy), groups="keep")
plt <- ggplot(mpg_summary, aes(x=model, y=factor(year), fill = Mean_Hwy))
plt + geom_tile() + labs(x="VModel", y="Vehicle Year", fill= "Mean Hightway (MPG)")


# boxplot
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy))
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) + geom_point()



#rnorm(200,mean=65,sd=5)

#set.seed(1234)
##  sex=factor(rep(c("F", "M"), each=200)),
#  weight=round(c(rnorm(200, mean=55, sd=5),
#                rnorm(200, mean=65, sd=5)))
#)

#mu <- ddply(df, "sex", summarise, grp.mean=mean(weight))

#df


#ggplot(df,aes(x=weight,color=sex))+geom_density()+geom_line(data=mu, aes(xintercept=grp.mean,color=sec),linetype="dashed")



ggplot(mtcars,aes(x=wt))+geom_density()
mtcars

shapiro.test(mtcars$wt)

sample(5)
sample_n(5)

population_table<- read.csv("used_car_data.csv",check.names=F,stringsAsFactors=F)
plt <- ggplot(population_table, aes(x=log10(Miles_Driven)))
plt + geom_density()


sample_table <- population_table %>% sample_n(50)
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven)))
plt + geom_density()

t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven)))

sample_table2 <- population_table %>% sample_n(50)

t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven))


mtcars_filt <- mtcars[,c("hp","cyl")]
mtcars_filt$cyl <- factor(mtcars_filt$cyl)

mtcars_filt$cyl

aov(hp ~ cyl, data=mtcars_filt)
summary(aov(hp~cyl,data=mtcars_filt))

head(mtcars)

plt<- ggplot(mtcars,aes(x=hp, y=qsec))
plt+geom_point()
cor(mtcars$hp,mtcars$qsec)

used_car<-read.csv("used_car_data.csv", stringsAsFactors = F)
head(used_car)
plt<-ggplot(used_car,aes(x=Miles_Driven,y=Selling_Price))
plt + geom_point()
cor(used_car$Miles_Driven,used_car$Selling_Price)


used_matrix<- as.matrix(used_car[,c("Selling_Price","Present_Price","Miles_Driven")])
cor(used_matrix)

lm(qsec~hp,mtcars)

model<-lm(qsec ~hp,mtcars)
yvals<-model$coefficients["hp"]*mtcars$hp + model$coefficients["(Intercept)"]

plt<-ggplot(mtcars,aes(x=hp,y=qsec))
plt+geom_point()+geom_line(aes(y=yvals),color = "red")

summary(lm(qsec~ mpg + disp+drat + wt+hp, data=mtcars))

mpg
table(mpg$class,mpg$year)
tbl<-table(mpg$class,mpg$year)

chisq.test(tbl)
mtcars
