# QUESTION 1
# Consider the following data with x as the predictor and y as as the outcome.
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
# Give a P-value for the two sided hypothesis test of whether β1 from a linear regression model is 0 or not.

f <- lm(y ~ x)
summary(f) # p-value: 0.05296

# QUESTION 2
# Consider the previous problem, give the estimate of the residual standard deviation.

# Residual standard error: 0.223 on 7 degrees of freedom

# QUESTION 3
# In the mtcars data set, fit a linear regression model of weight (predictor) on mpg (outcome). 
# Get a 95% confidence interval for the expected mpg at the average weight.
# What is the lower endpoint?

data(mtcars)
fit <- lm(mpg ~ I(wt - mean(wt)), data = mtcars)
confint(fit) #18.991

# QUESTION 4
# Refer to the previous question. Read the help file for mtcars . What is the weight coefficient interpreted as?

# The estimated expected change in mpg per 1,000 lb increase in weight.
# This is the standard interpretation of a regression coefficient. 
# The expected change in the response per unit change in the predictor.

# QUESTION 5
# Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (1,000 lbs). 
# A new car is coming weighing 3000 pounds. Construct a 95% prediction interval for its mpg. 
# What is the upper endpoint?

fit <- lm(mpg ~ wt, data = mtcars)
predict(fit, newdata = data.frame(wt = 3), interval = "prediction")

# QUESTION 6
# Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (in 1,000 lbs). 
# A “short” ton is defined as 2,000 lbs. Construct a 95% confidence interval for the expected change in mpg per 1 short ton increase in weight. 
# Give the lower endpoint.

fit <- lm(mpg ~ wt, data = mtcars)
confint(fit)[2, ] * 2

# QUESTION 7
# If my X from a linear regression is measured in centimeters and I convert it to meters what would happen to the slope coefficient?

# It would get multiplied by 100.

# QUESTION 8
# I have an outcome, Y, and a predictor, X and fit a linear regression model with Y = β0 + β1X + ε to obtain β0 and β1.
# What would be the consequence to the subsequent slope and intercept if I were to refit the model with a new regressor, X + c for some constant, c?

# The new intercept would be β0 − cβ1
# if Y = β0 + β1 X + ε then Y = β0 − cβ1 + β1(X + c) + ε

# QUESTION 9
# Refer back to the mtcars data set with mpg as an outcome and weight (wt) as the predictor.
# About what is the ratio of the the sum of the squared errors, ∑i=1 (Yi − Yi)^2 when
# comparing a model with just an intercept (denominator) to the model with the intercept and slope (numerator)?

fit1 <- lm(mpg ~ wt, data = mtcars)
fit2 <- lm(mpg ~ 1, data = mtcars)
1 - summary(fit1)$r.squared

# QUESTION 10
# Do the residuals always have to sum to 0 in linear regression?

# If an intercept is included, then they will sum to 0.￼