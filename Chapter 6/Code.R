# R From Scratch: An Intro to Data Analytics
# Chapter 6: Conditional Statements and Functions

# Conditional Statements ----

## The if Statement ----
# Define a variable
grade <- 80

# Check if grade is greater than or equal to 60
if (grade >= 60) {
  print("Pass")
}

## The else Statement ----
# Define a variable
grade <- 50

# Check if grade is greater than or equal to 60
if (grade >= 60) {
  print("Pass")
} else {
  print("Fail")
}

## The else if Statement ----
# Define a variable
grade <- 75

# Print a letter grade based on the numeric grade
if (grade >= 90) {
  print("A")
} else if (grade >= 80) {
  print("B")
} else if (grade >= 70) {
  print("C")
} else if (grade >= 60) {
  print("D")
} else {
  print("F")
}

## The ifelse Function ----
# Define a vector
x <- c(1, 2, 3, 4, 5)

# Check if each element of x is greater than 3
ifelse(x > 3, "Yes", "No")

# Define a vector of grades
grades <- c(75, 85, 95, 65, 55)

# Print a letter grade based on the numeric grade
ifelse(grades >= 90, "A",
       ifelse(grades >= 80, "B",
              ifelse(grades >= 70, "C",
                     ifelse(grades >= 60, "D", "F"))))


# The switch Function ----
# Define a letter grades
grades <- "C"

# Print a grade category based on the letter grade
switch(grades, 
       "A" = "Excellent", 
       "B" = "Good", 
       "C" = "Average", 
       "D" = "Poor", 
       "F" = "Fail"
       )

# Functions ----

## Creating Functions ----
# Create a function to add two numbers
add_numbers <- function(x, y) {
  result <- x + y
  return(result)
}

# Call the add_numbers function
add_numbers(5, 10)

## Providing Default Values ----
# Create a function to calculate the area of a rectangle
calculate_area <- function(length = 5, width = 3) {
  area <- length * width
  return(area)
}

# Call the calculate_area function
calculate_area()

# Call the calculate_area function with the width argument specified
calculate_area(width = 4)

# Call the calculate_area function with the arguments specified in any order
calculate_area(width = 4, length = 6)

## Variable Scoping ----
# Define a variable
x <- 10

# Create a function that defines a variable with the same name
print_x <- function() {
  x <- 20
  print(x)
}

# Call the print_x function
print_x()

# Print the value of the variable x
print(x)

## Combining Functions and Conditional Statements ----
# Create a function to convert a numeric grade to a letter grade
convert_grade <- function(grade) {
  if (grade >= 90) {
    return("A")
  } else if (grade >= 80) {
    return("B")
  } else if (grade >= 70) {
    return("C")
  } else if (grade >= 60) {
    return("D")
  } else {
    return("F")
  }
}

# Call the convert_grade function
convert_grade(75)
