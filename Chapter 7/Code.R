# R From Scratch: An Intro to Data Analytics
# Chapter 7: Data Manipulation With dplyr

# The RPG Dataset Again...
# Load the RPG dataset and store it in a variable called df
df <- read.csv("https://raw.githubusercontent.com/JaySquare87/RfromScratch/main/Chapter%205/RPG.csv")

# Load the dplyr Library
library(dplyr)

# Row Based Operations ----

## Filtering Rows ----
# Filter the RPG dataset to include only characters with a level greater than or equal to 70
df |>
  filter(Level >= 70) |>
  head()

# Filter the RPG dataset to include only characters with a level greater than or equal to 70 and are of class Magician
df |>
  filter(Level >= 70, Class == "Magician") |>
  head()

## Selecting Rows ----
# Select the first 5 rows of the RPG dataset
df |>
  slice(1:5)

# Select the 1st, 3rd, and 5th rows of the RPG dataset
df |>
  slice(c(1, 3, 5))

## Rearranging Rows ----
# Reorder the RPG dataset to display the characters in ascending order of their Level
df |>
  arrange(Level) |>
  head()

# Reorder the RPG dataset to display the characters in descending order of their Level
df |>
  arrange(desc(Level)) |>
  head()

# Column Based Operations ----

## Selecting Columns ----
# Select the Level, FBoss, and Class columns from the RPG dataset
df |>
  select(Level, FBoss, Class) |>
  head()

## Renaming Columns ----
# Rename the FBoss column to FinalBoss in the RPG dataset
df |>
  rename(FinalBoss = FBoss) |>
  head()

# Rename the FBoss column to FinalBoss in the RPG dataset 
# and store the result in the original dataset
df <- df |>
  rename(FinalBoss = FBoss)

# Print the column names of the RPG dataset
names(df)

# Select the Level, FinalBoss, and Class columns and rename FinalBoss to FBoss.
df |>
  select(Level, FBoss = FinalBoss, Class) |>
  head()

## Adding or Modifying Columns ----
# Add a new column to the RPG dataset that contains the average of all attributes of the characters
df |>
  mutate(AvgAttr = (Armor + Weapon + Physical + Magic) / 5) |>
  head()

# Recreate the AvgAtrr column
# Add another column to the RPG dataset that determines if the character is strong or weak based on the AvgAttr column.
# We will use a logical expression to determine if the character is strong or weak.
# If the character's average attributes are greater than or equal to 50, the character is strong, otherwise, the character is weak.
df |>
  mutate(AvgAttr = (Armor + Weapon + Physical + Magic) / 5,
         ChrStr = ifelse(AvgAttr >= 50, "Strong", "Weak")
  ) |>
  head()

# Summary Operations ----

## Summarizing Data ----
# Calculate the average level of the characters in the RPG dataset
df |>
  summarize(AvgLevel = mean(Level))

# Calculate the average Level and the median Magic power of the characters in the RPG dataset
df |>
  summarize(AvgLevel = mean(Level), MedianMagic = median(Magic))

## Group-wise Operations ----
# Calculate the average level of the characters in the RPG dataset for each class
df |>
  group_by(Class) |>
  summarize(AvgLevel = mean(Level))

# Calculate the average level of the characters in the RPG dataset for each class based on whether they beat the final boss or not
df |>
  group_by(Class, FinalBoss) |>
  summarize(AvgLevel = mean(Level), .groups = "drop")

# Using All The Functions Together ----

# Filter the characters that have a level greater than 50
# Select the Level, Class, Physical, and FinalBoss columns and rename FinalBoss to FBoss
# Calculate the average Physical strength of the characters for each class
# Add a new column that classifies if a class is Physical dependent based on whether the Class beat the final boss with AvgPhysical less than 50
# Filter the PhysDep column to display only the Classes that are NOT PhysDep
# Arrange by their AvgPhysical in descending order
df |>
  filter(Level > 50) |>
  select(Level, Class, Physical, FBoss = FinalBoss) |>
  group_by(Class, FBoss) |>
  summarize(AvgPhysical = mean(Physical), .groups = "drop") |>
  mutate(PhysDep = ifelse(AvgPhysical < 50, "No", "Yes")) |>
  filter(PhysDep == "No", FBoss == "True") |>
  arrange(desc(AvgPhysical))

