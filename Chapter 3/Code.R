# R From Scratch: An Intro to Data Analytics
# Chapter 3: R Data Structures

# Vectors ----

# Create a numeric vector
numeric_vector <- c(1, 2, 3, 4, 5)
print(numeric_vector)

# Create a character vector
character_vector <- c("apple", "banana", "cherry", "date", "elderberry")
print(character_vector)

# Create a logical vector
logical_vector <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
print(logical_vector)

# Create a sequence of numbers
sequence <- 1:5
print(sequence)

# Create a sequence of numbers in reverse order
reverse_sequence <- 5:-3
print(reverse_sequence)

## Operations on Vectors ----
### Arithmetic Operations ----
# Create two numeric vectors
x <- c(1, 2, 3, 4, 5)
y <- c(6, 7, 8, 9, 10)

# Add the two vectors
addition <- x + y
print(addition)

# Subtract the two vectors
subtraction <- x - y
print(subtraction)

# Multiply the two vectors
multiplication <- x * y
print(multiplication)

# Divide the two vectors
division <- x / y
print(division)

# Raise the first vector to the power of the second vector
exponentiation <- x ^ y
print(exponentiation)

## Comparison Operations ----
# Create two new vectors
x <- c(1, 3, 5, 7, 9)
y <- c(10, 8, 6, 4, 2)

# Check if each element of x is less than the corresponding element of y
less_than <- x < y
print(less_than)

# Check if each element of x is greater than or equal to the corresponding 
# element of y
greater_than_or_equal <- x >= y
print(greater_than_or_equal)

# Check if each element of x is equal to the corresponding element of y
equal <- x == y
print(equal)

# Check if all elements of x are less than 10
all_less_than_10 <- all(x < 10)
print(all_less_than_10)

# Check if there is at least one element of x that is equal to 5
any_equal_to_5 <- any(x == 5)
print(any_equal_to_5)

## Factor Vectors ----
# Create a vector of student seniority levels
seniority_levels <- c("freshman", "sophomore", "junior", "senior", "sophomore", "junior", "freshman", "senior", "junior", "sophomore")

# Create a factor of student seniority levels
factor_seniority_levels <- factor(seniority_levels)

# Check the levels of the factor
levels(factor_seniority_levels)

# Create a factor of student seniority levels with specified levels
factor_seniority_levels <- factor(seniority_levels, levels = c("freshman", "sophomore", "junior", "senior"))

# Check the levels of the factor
levels(factor_seniority_levels)

# Convert the factor to a numeric vector
numeric_vector <- as.numeric(factor_seniority_levels)
print(numeric_vector)

# Matrices ----

## Creating Matrices ----
# Create a vector of numbers
numbers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

# Create a matrix from the vector
matrix_numbers <- matrix(numbers, nrow = 3, ncol = 3)

# Print the matrix
print(matrix_numbers)

# Create a matrix from the vector by row
matrix_numbers_by_row <- matrix(numbers, nrow = 3, ncol = 3, byrow = TRUE)

# Print the matrix
print(matrix_numbers_by_row)

## Accessing Elements in Matrices ----
# Access the element in the first row and first column
element_11 <- matrix_numbers[1, 1]
print(element_11)

# Accessing the second row and third column
element_23 <- matrix_numbers[2, 3]
print(element_23)

## Operations on Matrices ----
## Arithmetic Operations ----
# Create two matrices
matrix_1 <- matrix(1:9, nrow = 3, ncol = 3)
matrix_2 <- matrix(9:1, nrow = 3, ncol = 3)

# Add the two matrices
addition <- matrix_1 + matrix_2
print(addition)

## Matrix Multiplication ----
# Multiply the two matrices
multiplication <- matrix_1 %*% matrix_2
print(multiplication)

# Multiply the matrix by itself
self_multiplication <- matrix_1 %*% matrix_1
print(self_multiplication)

# Multiply the matrix by a vector
vector <- c(1, 2, 3)
vector_multiplication <- matrix_1 %*% vector
print(vector_multiplication)

## Transposing a Matrix ----
# Transpose of matrix_1
transpose <- t(matrix_1)
print(transpose)

# Arrays ----

## Creating Arrays ----
# Create a vector of numbers
numbers <- 1:12

# Create a 3D array from the vector
array_numbers <- array(numbers, dim = c(3, 2, 2))

# Print the array
print(array_numbers)

## Accessing Elements in Arrays ----
# Access the element in the first row, first column, and first layer
element_111 <- array_numbers[1, 1, 1]
print(element_111)

# Access the element in the third row, second column, and second layer
element_322 <- array_numbers[3, 2, 2]
print(element_322)

## Operations on Arrays ----
# Create two 3D arrays
array_1 <- array(1:12, dim = c(3, 2, 2))
array_2 <- array(12:1, dim = c(3, 2, 2))

# Add the two arrays
addition <- array_1 + array_2
print(addition)

# Lists ----

## Creating Lists ----
# Create a list of data types
list_of_data <- list(
  numeric_vector = c(1, 2, 3, 4, 5),
  character_vector = c("apple", "banana", "cherry", "date", "elderberry"),
  logical_vector = c(TRUE, FALSE, TRUE, FALSE, TRUE),
  matrix_data = matrix(1:9, nrow = 3, ncol = 3),
  array_data = array(1:12, dim = c(3, 2, 2))
)

# Print the list
print(list_of_data)

## Accessing Elements in Lists ----
# Access the numeric vector in the list
numeric_vector <- list_of_data$numeric_vector
print(numeric_vector)

# Access the matrix in the list
matrix_data <- list_of_data[["matrix_data"]]
print(matrix_data)

# Access the first element of the list
first_element <- list_of_data[[1]]
print(first_element)

# Access the first element of the character vector in the list
first_element_character_vector <- list_of_data$character_vector[1]
print(first_element_character_vector)

# Access the second row and third column of the matrix in the list
second_row_third_column_matrix <- list_of_data[["matrix_data"]][2, 3]
print(second_row_third_column_matrix)

# Access the second layer of the array in the list
second_layer_array <- list_of_data[[5]][,,2]
print(second_layer_array)

## Adding Elements to Lists ----
# Add a new element to the list using the $ operator
list_of_data$new_element <- c(6, 7, 8, 9, 10)

# Add a new element to the list using the double square brackets
list_of_data[["new_element2"]] <- c(10, 9, 8, 7, 6)

# Add a new element to the list using the c() function
new_element3 <- list(c(5, 4, 3, 2, 1))
list_of_data <- c(list_of_data, new_element3 = new_element3)
# Notice how we provided a name for the new element from inside the c() function
# The name of the variable `new_element3` will not be used as the name of the new element in the list. It has to be provided from inside the c() function.

# Print the list to see the three new added elements
print(list_of_data)

# Data Frames ----

## Creating Data Frames ----
# Create vectors of data
name <- c("Alice", "Bob", "Charlie", "David", "Eve")
age <- c(25, 30, 35, 40, 45)
height <- c(5.6, 5.8, 5.9, 6.0, 6.2)
married <- c(TRUE, FALSE, TRUE, TRUE, FALSE)

# Create a data frame from the vectors
data_frame <- data.frame(name, age, height, married)

# Print the data frame
print(data_frame)

# Create a data frame by specifying the column names and values
data_frame <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  age = c(25, 30, 35, 40, 45),
  height = c(5.6, 5.8, 5.9, 6.0, 6.2),
  married = c(TRUE, FALSE, TRUE, TRUE, FALSE)
)

## Accessing Elements in Data Frames ----
# Access the name column of the data frame
name_column <- data_frame$name
print(name_column)

# Access the first element of the name column
first_element_name_column <- data_frame$name[1]
print(first_element_name_column)

# Access the first column by index using double square brackets
first_column <- data_frame[[1]]
print(first_column)

# Access the first column by index using single square brackets
first_column <- data_frame[1]

## Subsetting Data Frames ----
# Subset the first three rows and the first two columns of the data frame
subset <- data_frame[1:3, 1:2]
print(subset)

# Subset the first three rows and the name and age columns of the data frame
subset <- data_frame[1:3, c("name", "age")]
print(subset)

# Or perhaps we want, the first, third, and fifth rows and the name and height columns of the data frame
subset <- data_frame[c(1, 3, 5), c("name", "height")]
print(subset)

# Subset all the rows of the name and age columns of the data frame
subset <- data_frame[, c("name", "age")]
print(subset)

# Subset the first, third, and fifth rows of the data frame
subset <- data_frame[c(1, 3, 5), ]
print(subset)

## Essential Functions for Data Frames ----
### The head() and tail() functions ----
# View the first few rows of the data frame
head(data_frame)

# View the first 10 rows of the data frame
head(data_frame, n = 10)

# View the last few rows of the data frame
tail(data_frame)

# View the last 10 rows of the data frame
tail(data_frame, n = 10)

### The summary() function ----
# Generate a summary of the data frame
summary(data_frame)

### The str() function ----
# Inspect the structure of the data frame
str(data_frame)

### The nrow() and ncol() functions ----
# Get the number of rows of the data frame
number_of_rows <- nrow(data_frame)
print(number_of_rows)

# Get the number of columns of the data frame
number_of_columns <- ncol(data_frame)
print(number_of_columns)

### The names() function ----
# Get the names of the columns of the data frame
column_names <- names(data_frame)
print(column_names)
