# R From Scratch: An Intro to Data Analytics
# Chapter 15: Predictive Analysis

# Correlation ----

# Load the ggplot2 package
library(ggplot2)

# Load the RPG dataset
RPG <- read.csv("https://raw.githubusercontent.com/JaySquare87/RfromScratch/main/Chapter%205/RPG.csv")

# Create a scatter plot of Level vs Magic
ggplot(RPG, aes(x = Magic, y = Level)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatter plot of Level vs Magic",
       x = "Magic",
       y = "Level")

# Calculate the correlation coefficient
cor(RPG$Level, RPG$Magic)

# Regression ----

## Linear Regression ----
# Using Magic as the predictor variable
# Perform linear regression
lm_model <- lm(Level ~ Magic, data = RPG)

# Print the results
print(summary(lm_model))

# Using all variables as predictor variables
# Perform linear regression
lm_model <- lm(Level ~ Armor + Weapon + Physical + Magic, data = RPG)

# Print the results
print(summary(lm_model))

### Predicting New Values ----
# Create a new data frame with the new values of the independent variables
new_data <- data.frame(Armor = 42, Weapon = 66, Physical = 24, Magic = 68)

# Predict the Level of the character
predict(lm_model, newdata = new_data)

# Predicting the Level of all characters in the dataset
# Predict the Level of the character
RPG$Level_predicted <- predict(lm_model)

# Print the first few rows of the dataset
head(RPG)

## Logistic Regression ----

# Load dplyr since we need to do some data manipulation
library(dplyr)

# First, we need to convert the FBoss column into values of 0 and 1
# 0 for the characters who failed to beat the final boss
# 1 for the characters who beat the final boss
RPG <- RPG |>
  mutate(FBoss_binary = ifelse(FBoss == "True", 1, 0))

# Create a scatter plot of Level vs FBoss
ggplot(RPG, aes(x = Level, y = FBoss_binary)) +
  geom_point() +
  stat_smooth(method = "glm", se = FALSE, method.args = list(family=binomial)) +
  labs(title = "Scatter plot of Level vs FBoss",
       x = "Level",
       y = "FBoss")

# Perform logistic regression
glm_model <- glm(FBoss_binary ~ Level, data = RPG, family = binomial)

# Print the results
print(summary(glm_model))

# Predict the FBoss of the character
RPG$FBoss_predicted <- predict(glm_model, type = "response")

# Convert the predicted values to 0 or 1
RPG$FBoss_predicted <- ifelse(RPG$FBoss_predicted > 0.5, 1, 0)

# Calculate the accuracy of the model
mean(RPG$FBoss_binary == RPG$FBoss_predicted)
