# R From Scratch: An Intro to Data Analytics
# Chapter 14: Basics of Statistical Modeling

# Random Numbers

## From a Normal Distribution ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from a normal distribution
data <- rnorm(10, mean = 0, sd = 1)

# Print the data
print(data)

# Calculate the mean and standard deviation of the data
mean_data <- mean(data)
sd_data <- sd(data)

# Print the mean and standard deviation
sprintf("The mean is %f", mean_data)
sprintf("The standard deviation is %f", sd_data)

## From a Uniform Distribution ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from a uniform distribution
data <- runif(10, min = 0, max = 1)

# Print the data
print(data)

# Calculate the mean of the data
mean_data <- mean(data)

# Print the mean
sprintf("The mean is %f", mean_data)

## From a Binomial Distribution ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from a binomial distribution
data <- rbinom(10, size = 10, prob = 0.5)

# Print the data
print(data)

## From a Poisson Distribution ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from a Poisson distribution
data <- rpois(10, lambda = 1)

# Print the data
print(data)

# Types of Distributions ----

## Normal Distribution ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from a normal distribution
data <- rnorm(1000, mean = 0, sd = 1)

# Create a histogram of the data
hist(data, breaks = 30, col = "grey50", main = "Normal Distribution", xlab = "Value", ylab = "Frequency")

## Uniform Distribution ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from a uniform distribution
data <- runif(1000, min = 0, max = 1)

# Create a histogram of the data
hist(data, breaks = 30, col = "grey50", main = "Uniform Distribution", xlab = "Value", ylab = "Frequency")

# Binomial Distribution ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from a binomial distribution
data <- rbinom(1000, size = 10, prob = 0.5)

# Create a histogram of the data
hist(data, breaks = 30, col = "grey50", main = "Binomial Distribution", xlab = "Value", ylab = "Frequency")

## Poisson Distribution ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from a Poisson distribution
data <- rpois(1000, lambda = 1)

# Create a histogram of the data
hist(data, breaks = 30, col = "grey50", main = "Poisson Distribution", xlab = "Value", ylab = "Frequency")

# Inferential Statistics ----

## Test of Means ----

### One-Sample t-Test ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from a normal distribution
data <- rnorm(100, mean = 0, sd = 1)

# Perform a one-sample t-test
t_test <- t.test(data, mu = 0)

# Print the results
print(t_test)

### Two-Sample t-Test ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from two normal distributions
data1 <- rnorm(100, mean = 0, sd = 1)
data2 <- rnorm(100, mean = 1, sd = 1)

# Perform a two-sample t-test
t_test <- t.test(data1, data2)

# Print the results
print(t_test)

# Load the ggplot2 package
library(ggplot2)

# Combine the data into a data frame
df <- data.frame(
  value = c(data1, data2),
  group = factor(rep(c("Group 1", "Group 2"), each = 100))
)

# Create a density plot of the data and add lines for the means of the two groups
ggplot(df, aes(x = value, fill = group)) +
  geom_density(alpha = 0.5) +
  labs(title = "Two-Sample t-Test", x = "Value", y = "Frequency") +
  geom_vline(xintercept = mean(data1), linetype = "dashed", color = "red") +
  geom_vline(xintercept = mean(data2), linetype = "dashed", color = "blue") +
  theme_minimal()

## Non-Parametric Test ----
### Shapiro-Wilk Test ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from a uniform distribution
data <- runif(100, min = 0, max = 1)

# Perform a Shapiro-Wilk test
shapiro_test <- shapiro.test(data)

# Print the results
print(shapiro_test)

### Wilcoxon Rank Sum Test ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data from two uniform distributions
data1 <- runif(100, min = 0, max = 1)
data2 <- runif(100, min = 0.5, max = 1.5)

# Perform a Wilcoxon rank-sum test
wilcox_test <- wilcox.test(data1, data2)

# Print the results
print(wilcox_test)

# Combine the data into a data frame
df <- data.frame(
  value = c(data1, data2),
  group = factor(rep(c("Group 1", "Group 2"), each = 100))
)

# Create a density plot of the data and add lines for the means of the two groups
ggplot(df, aes(x = value, fill = group)) +
  geom_density(alpha = 0.5) +
  labs(title = "Wilcoxon Rank-Sum Test", x = "Value", y = "Frequency") +
  geom_vline(xintercept = mean(data1), linetype = "dashed", color = "red") +
  geom_vline(xintercept = mean(data2), linetype = "dashed", color = "blue") +
  theme_minimal()

## Proporion Test ----

### Chi-Square Test ----
# Create a 2x2 contingency table
data <- matrix(c(10, 20, 30, 40), nrow = 2)

# Add column names
colnames(data) <- c("Group1", "Group2")

# Add row names
rownames(data) <- c("Outcome1", "Outcome2")

# Print the contingency table
print(data)

# Perform the Chi-Square test
chisq_test <- chisq.test(data)

# Print the results
print(chisq_test)

### Fisher's Exact Test ----
# Create a 2x2 contingency table with small counts
data <- matrix(c(1, 0, 0, 2), nrow = 2)

# Add column names
colnames(data) <- c("Group1", "Group2")

# Add row names
rownames(data) <- c("Outcome1", "Outcome2")

# Print the contingency table
print(data)

# Perform Chi-Square test
chsq_result <- chisq.test(data)

# Perform the Fisher's Exact Test
fisher_result <- fisher.test(data)

# Print the results
print(fisher_result)

## ANOVA ----

### One-Way ANOVA ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data of blood preasure from three normal distributions
data1 <- rnorm(100, mean = 120, sd = 10)
data2 <- rnorm(100, mean = 130, sd = 10)
data3 <- rnorm(100, mean = 140, sd = 10)

# Create a data frame with the data
df <- data.frame(
  value = c(data1, data2, data3),
  group = factor(rep(c("Group 1", "Group 2", "Group 3"), each = 100))
)

# Perform a one-way ANOVA
anova_test <- aov(value ~ group, data = df)

# Print the results 
print(summary(anova_test))

### Two-Way ANOVA ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data of blood pressure from three normal distributions for two age groups
data1_young <- rnorm(50, mean = 120, sd = 10)
data2_young <- rnorm(50, mean = 130, sd = 10)
data3_young <- rnorm(50, mean = 140, sd = 10)

data1_old <- rnorm(50, mean = 125, sd = 10)
data2_old <- rnorm(50, mean = 135, sd = 10)
data3_old <- rnorm(50, mean = 145, sd = 10)

# Create a data frame with the data
df <- data.frame(
  value = c(data1_young, data2_young, data3_young, data1_old, data2_old, data3_old),
  group = factor(rep(c("Group 1", "Group 2", "Group 3"), each = 100)),
  age = factor(rep(c("Young", "Old"), each = 150))
)

# Perform a two-way ANOVA
anova_test <- aov(value ~ group * age, data = df)

# Print the results 
print(summary(anova_test))

## Manova ----
# Set the seed for reproducibility
set.seed(123)

# Generate random data of blood pressure and heart rate from three normal distributions for two age groups
data1_young_bp <- rnorm(50, mean = 120, sd = 10)
data2_young_bp <- rnorm(50, mean = 130, sd = 10)
data3_young_bp <- rnorm(50, mean = 140, sd = 10)

data1_old_bp <- rnorm(50, mean = 125, sd = 10)
data2_old_bp <- rnorm(50, mean = 135, sd = 10)
data3_old_bp <- rnorm(50, mean = 145, sd = 10)

data1_young_hr <- rnorm(50, mean = 70, sd = 5)
data2_young_hr <- rnorm(50, mean = 75, sd = 5)
data3_young_hr <- rnorm(50, mean = 80, sd = 5)

data1_old_hr <- rnorm(50, mean = 72, sd = 5)
data2_old_hr <- rnorm(50, mean = 77, sd = 5)
data3_old_hr <- rnorm(50, mean = 82, sd = 5)

# Create a data frame with the data
df <- data.frame(
  blood_pressure = c(data1_young_bp, data2_young_bp, data3_young_bp, data1_old_bp, data2_old_bp, data3_old_bp),
  heart_rate = c(data1_young_hr, data2_young_hr, data3_young_hr, data1_old_hr, data2_old_hr, data3_old_hr),
  group = factor(rep(c("Group 1", "Group 2", "Group 3"), each = 100)),
  age = factor(rep(c("Young", "Old"), each = 150))
)

# Perform MANOVA
manova_test <- manova(cbind(blood_pressure, heart_rate) ~ group * age, data = df)

# Print the results 
print(summary(manova_test))

# Summary of the MANOVA for each response variable
print(summary.aov(manova_test))
