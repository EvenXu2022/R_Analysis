
#Deliverable 1: Linear Regression to Predict MPG

#install package
install.packages("dplyr")


#import csv file and read as dataframe
car_df<- read.csv("Resources/MechaCar_mpg.csv",check.names = F, stringsAsFactors = F)

head(car_df)

#create multiple linear regression model
lm(mpg~  vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = car_df)

#generate Summary
summary(lm(mpg~  vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = car_df))

# 2: Create Visualizations for the Trip Analysis

# read csv to DataFrame
coil_df <-read.csv("Resources/Suspension_Coil.csv")
head(coil_df)

#Generate Summary dataframe

total_summary <- coil_df %>% summarize(Mean = mean(PSI), Median =median(PSI), Variance = var(PSI), SD= sd(PSI),.groups="keep")

View(total_summary)

#generate summary for each lot
lot_summary<- coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median =median(PSI), Variance = var(PSI), SD= sd(PSI), .groups = "keep")

View(lot_summary)


#Deliverable 3: T-Tests on Suspension Coils

Mean = mean(coil_df$PSI)

t.test(coil_df$PSI, mu=1500)


t.test(subset(coil_df,Manufacturing_Lot=="Lot1")$PSI, mu = mean(coil_df$PSI))
t.test(subset(coil_df,Manufacturing_Lot=="Lot2")$PSI, mu = mean(coil_df$PSI))
t.test(subset(coil_df,Manufacturing_Lot=="Lot3")$PSI, mu = mean(coil_df$PSI))
