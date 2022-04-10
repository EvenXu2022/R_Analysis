# R_Analysis

## Deliverable 1: Linear Regression to Predict MPG

- Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?

"vehicle_length", "ground_clearnance" are non-randam amounts of variance. Because they have a significant impact on miles per gallon oin this prototype since P-values are smaller than 0.05.

- Is the slope of the linear model considered to be zero? Why or why not?

Since the p-values of vehicle_length and ground_clearance are much less than 0.05, there is a significant linear relationship between the 2 independent variables and the dependent variable mpg; thus, the slope will not equal zero.

- Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
The linear model has an r-squared value of 0.7149 which means the around 71.5% of mpg predictions are likely accurate. This model does predict mpg; however, it's not good enough. I suggest to add more data in this model and conduct more tests on it.

<img src ="Images/delivery1.PNG">

## Deliverable 2:Create Visualizations for the Trip Analysis

### Total Summary

This summary is provided PSI Mean, Median, Variance and SD based on total population of suspension coil dataset

<img src ="Images/total_summary.PNG">

### Lot Summary

This summary is provided PSI Mean, Median, Variance and SD based on each manufacturing lot.

<img src ="Images/lot_summary.PNG">


## Deliverable 3: T-Tests on Suspension Coils

From the t-test results we can see that the true mean of the total population is 1498.78. The t-test result with the mean of 1500 indicates a p-value which is less than 0.05. This is higher than the common significance level; this, there is NOT enough evident to reject the null hypothesis. 

For the individual lot t-tests results:

- lot1: although the sample has mean of 1500, we cannot reject the null hypothesis since the p-values(1) is greater than 0.05.

- lot2: same as the lot1 results, the null hypothesis cannot be rejected since the p-values is 0.6072 which is over than 0.05.

- lot3: with p-value of 0.042, null hypothesis is accepted. It is to say, the true mean is equal to 1500.

<img src ="Images/delivery3.PNG">


## Study Design: MechaCar vs Competition.

Overall:

Collect 2-3 years historical data for across all major competitors (manufacturers) and include the following metrics:
- Original Retail Price: Independent Variable
- Current Price: Dependent Variable
- Driven Distance (Miles or KM):Independent Variable
- Engine Power: Independent Variable
- Safety Rating: Independent Variable
- Engine Type (model): Independent Variable
- MPG: Independent Variable

Hypothesis:

- Ho: Car's residual values are only based on the original retail values (not based on all key factors)
- Ha: Car's residual values are based on all key factors of performance (Safety Rating, Engine Type, Driven Distance, MPG)

Tests:

Current price would be set as a dependent variable and apply a multiple linear regression test to determine the coefficients among the independent variables. This will indicate which factor has the highest impact to the current price.









