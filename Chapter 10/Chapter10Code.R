# R From Scratch: An Intro to Data Analytics
# Chapter 10: More Data Wrangling

# Dealing With Missing Values ----

## Identifying Missing Values ----
# Create a data frame with missing values
df <- data.frame(
  x = c(1, 2, NA, 4, 5),
  y = c(NA, 2, 3, 4, 5)
)   

# Identify missing values in the data frame
is.na(df)

# Identify rows with missing values
complete.cases(df)

## Removing Missing Values ----
# Using the df we created above
# Remove rows with missing values
na.omit(df)

# Remove rows with missing values using complete.cases()
df[complete.cases(df), ]

## Replacing Missing Values ----
# Load the titanic_train table
titanic_train <- titanic::titanic_train

# Check for missing values
summary(titanic_train)

# Replace missing values with the mean
titanic_train$Age[is.na(titanic_train$Age)] <- mean(titanic_train$Age, na.rm = TRUE)

# Check for missing values
summary(titanic_train)

## Replacing Missing Values with the Last Non-Missing Value ----
# Create a data frame with missing values
df <- data.frame(
  patient = c("John", NA, NA, NA, NA),
  age = c(25, 25, 25, 26, 26),
  weight = c(150, 165, 160, 170, 168),
  height = c(5.8, NA, NA, NA, NA)
)

# Replace missing values with the last non-missing value
library(zoo)
df$patient <- na.locf(df$patient)
df$height <- na.locf(df$height)

# tidyr ----

## Pivot Longer ----
# Load the Iris dataset
data(iris)

# Check the first few rows of the dataset
head(iris)

# Load the tidyr library
library(tidyr)

# Reshape the Iris dataset from wide to long format
iris_long <- iris |> 
  pivot_longer(cols = c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),
               names_to = "variable", # Create a new column 'variable' to store the column names
               values_to = "value") # Create a new column 'value' to store the values

# Check the first few rows of the reshaped dataset
head(iris_long)

# Load the ggplot2 library
library(ggplot2)

# Plot the reshaped dataset
ggplot(iris_long, aes(x = variable, y = value, fill = Species)) +
  geom_boxplot() +
  labs(title = "Iris Dataset",
       x = "Variable",
       y = "Value")

## Pivot Wider ----
# Sample data creation
temperature_data <- tibble(
  Day = c("Monday", "Monday", "Monday", "Tuesday", "Tuesday", "Tuesday"),
  Time = c("Morning", "Noon", "Evening", "Morning", "Noon", "Evening"),
  Temperature = c(68, 75, 70, 67, 76, 71)
)

# Pivoting the data
wider_temperature_data <- temperature_data %>%
  pivot_wider(
    names_from = Time,          # Create new column headers from 'Time'
    values_from = Temperature   # Fill these new columns with values from 'Temperature'
  )

# Show the pivoted data
wider_temperature_data

# Join Functions ----

# Make sure to load dplyr or tidyverse
library(dplyr)

# Load the people and species tables
people <- starwarsdb::people
species <- starwarsdb::species

# Join the people and species tables
# There are too many columns in the species table
# so we will only select few columns from the joined table.
# You can view the whole table when you run the code on your machine
people |> 
  left_join(species, join_by(species == name)) |>
  select(name, species, classification, language) |>
  head()

## Checking for implicit missing values using anti_join() ----
# Check for implicit missing values
people |> 
  anti_join(species, join_by(species == name)) |>
  head()

# Add a missing value to the species table
people <- people |>
  add_row(name = "JJ", species = "Alien")

# Check the new row
people |> 
  select(name, species) |>
  tail()

# Check for implicit missing values
people |> 
  anti_join(species, join_by(species == name)) |>
  distinct(species)
