# R From Scratch: An Intro to Data Analytics
# Chapter 5: Basic Data Visualization

# The RPG Dataset ----
# Load the RPG dataset
df <- read.csv("RPG.csv")

# Get the structure of the dataset
str(df)

# View the first few rows of the dataset
head(df)

# Basic Data Visualization with Base R ----

## Scatter Plots ----
# Create a scatter plot of the 'Magic' and 'Level' variables
plot(df$Level, df$Magic, main = "Magic vs Level",
     xlab = "Magic", ylab = "Level")

## Histograms ----
# Create a histogram of the 'Level' variable
hist(df$Level, main = "Level Distribution", xlab = "Level", ylab = "Frequency")

## Box Plots ----
# Create a box plot of the 'Magic' variable
boxplot(df$Magic, main = "Magic Distribution", xlab = "Magic")

## Bar Plots ----
# Create a bar plot of the 'Class' variable
barplot(table(df$Class), main = "Class Distribution",
        xlab = "Class", ylab = "Frequency")

# ggplot2: A More Powerful Visualization Package ----

## The ggplot() function
# Load the tidyverse package
library(tidyverse)
# or if you don't need to load all of the packages encapsulated in the 
# tidyverse package, you can load the ggplot2 package alone
library(ggplot2)

# Create a new ggplot object
ggplot()

# Create a new ggplot object and define the dataset and aesthetics
ggplot(data = df, aes(x = Level, y = Magic))

## Scatter Plots with ggplot2 ----
# Create a scatter plot of the 'Magic' and 'Level' variables using ggplot2
ggplot(data = df, aes(x = Level, y = Magic)) +
  geom_point()

### The Smoothed Line Layer ----
# Create a scatter plot of the 'Magic' and 'Level' variables using ggplot2 
# with a smoothed line layer
ggplot(data = df, aes(x = Level, y = Magic)) +
  geom_point() +
  geom_smooth(method = "lm")

### The aes() Function ----
# Create a scatter plot of the 'Magic' and 'Level' variables using ggplot2 
# with color aesthetic
ggplot(data = df, aes(x = Level, y = Magic)) +
  geom_point(aes(color = Class)) +
  geom_smooth(method = "lm")

# Create a scatter plot of the 'Magic' and 'Level' variables using ggplot2 
# with color aesthetic
ggplot(data = df, aes(x = Level, y = Magic)) +
  geom_point() +
  geom_smooth(aes(color = Class), method = "lm")

## Histograms with ggplot2 ----
# Create a histogram of the 'Level' variable using ggplot2
ggplot(data = df, aes(x = Level)) +
  geom_histogram()

# Density Plots with ggplot2 ----
# Create a density plot of the 'Level' variable using ggplot2
ggplot(data = df, aes(x = Level)) +
  geom_density()

# Create a density plot of the 'Level' variable using ggplot2 with a 
# fill aesthetic
ggplot(data = df, aes(x = Level)) +
  geom_density(aes(fill = Class))

# Create a density plot of the 'Level' variable using ggplot2 with a 
# fill aesthetic and transparent colors
ggplot(data = df, aes(x = Level)) +
  geom_density(aes(fill = Class), alpha = 0.2)

## Faceting ----
### facet_wrap() ----
# Create a faceted density plot of the 'Level' variable using ggplot2
ggplot(data = df, aes(x = Level)) +
  geom_density() +
  facet_wrap(~ Class)

### facet_grid() ----
# Create a faceted scatter plot of the 'Magic' and 'Level' variables 
# using ggplot2
ggplot(data = df, aes(x = Level, y = Magic)) +
  geom_point() +
  facet_grid(Class ~ .)

## Box Plots with ggplot2 ----
# Create a box plot of the 'Magic' variable by the 'Class' variable 
# using ggplot2
ggplot(data = df, aes(x = Class, y = Magic)) +
  geom_boxplot()

## Violin Plots with ggplot2 ----
# Create a violin plot of the 'Weapon' variable by the 'Class' variable 
# using ggplot2
ggplot(data = df, aes(x = Class, y = Weapon)) +
  geom_violin()

## Bar Plots with ggplot2 ----
# Create a bar plot of the frequency of each class in the dataset using ggplot2
ggplot(data = df, aes(x = Class)) +
  geom_bar()
