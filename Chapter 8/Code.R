# R From Scratch: An Intro to Data Analytics
# Chapter 8: Loops in R

# For Loops ----

# Print numbers from 1 to 5 using a for loop
for (i in 1:5) {
  print(i)
}

# Iterate over a vector and calculate the square of each element
vector <- c(1, 2, 3, 4, 5)
for (num in vector) {
  squared <- num^2
  print(squared)
}

# While Loops ----

# Initialize a variable
count <- 1

# Execute the loop while the condition is true
while (count <= 5) {
  print(count)
  count <- count + 1  # Increment the count variable
}

# Loop Control Statements ----

## break Statement ----
# Example of using break statement
for (i in 1:10) {
  if (i == 5) {
    break  # Exit the loop when i equals 5
  }
  print(i)
}

## next Statement ----
# Example of using next statement
for (i in 1:5) {
  if (i %% 2 == 0) {
    next  # Skip even numbers
  }
  print(i)
}

# Looping Over Data Structures ----

## Looping Over Vectors ----
# Example of looping over a numeric vector
vector <- c(1, 2, 3, 4, 5)
for (num in vector) {
  print(num)
}

## Looping Over Lists ----
# Example of looping over a list
my_list <- list(a = 1, b = c(2, 3), c = "Hello")
for (element in my_list) {
  print(element)
}

## Looping Over Matrices ----
matrix <- matrix(1:9, nrow = 3, ncol = 3)
for (i in 1:nrow(matrix)) {
    print(matrix[i, ])
}

## Looping Over Data Frames ----
# Example of looping over a data frame (rows)
data_frame <- data.frame(x = 1:3, y = c("a", "b", "c"))
for (i in 1:nrow(data_frame)) {
  print(data_frame[i, ])
}

# Advanced Looping Techniques ----

## Nested Loops ----
# Example of nested loops
matrix <- matrix(1:9, nrow = 3, ncol = 3)
for (i in 1:nrow(matrix)) {
  for (j in 1:ncol(matrix)) {
    print(matrix[i, j])
  }
}

## Conditional Iteration ----
# Example of conditional iteration
vector <- 1:10
for (num in vector) {
  if (num %% 2 == 0) {
    print(num * 2)
  }
  else {
    print(num)
  }
}

## Iteration over Multiple Data Structures ----
# Example of iterating over multiple lists simultaneously
list1 <- list(a = 1, b = 2, c = 3)
list2 <- list(d = 4, e = 5, f = 6)
for (i in 1:length(list1)) {
  print(paste(list1[[i]], list2[[i]], sep = ", "))
}

## Iterating with Functional Programming ----

# Example of using lapply for iteration
list <- list(a = 1:3, b = 4:6, c = 7:9)
result <- lapply(list, sum)
print(result)

# Example of using mapply for iteration
list1 <- list(a = 1:3, b = 4:6, c = 7:9)
list2 <- list(d = 10:12, e = 13:15, f = 16:18)
result <- mapply(sum, list1, list2)
print(result)
