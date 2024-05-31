# R From Scratch: An Intro to Data Analytics
# Chapter 11: String Manipulation

# Basic String Manipulation Functions ----

# Create a string
text <- "Hello, World!"

# Count the number of characters in the string
nchar(text)

# Extract a substring starting from the 8th character with a length of 5 characters
substr(text, start = 8, stop = 12)

# Create two strings
text1 <- "Hello"
text2 <- "World"

# Concatenate the two strings
paste(text1, text2)

# Using the same string from the previous examples
# "Hello, World!"

# Convert the string to uppercase
toupper(text)

# Convert the string to lowercase
tolower(text)

# Create a string with leading and trailing whitespace
text <- "   Hello, World!   "

# Remove leading and trailing whitespace
trimws(text)

# Advanced String Manipulation Functions ----

# Load the stringr package
library(stringr)

# Let us reset the text variable to the original string
text <- "Hello, World!"

# Count the number of characters in the string
str_length(text)

# Extract a substring starting from the 8th character with a length of 5 characters
str_sub(text, start = 8, end = 12)

# Using text1 and text2 variables from the previous examples
# "Hello" and "World"

# Concatenate the two strings
str_c(text1, text2)

# Concatenate the two strings with a space between them
str_c(text1, text2, sep = " ")

# Using the same string from the previous examples
# "Hello, World!"

# Convert the string to uppercase
str_to_upper(text)

# Convert the string to lowercase
str_to_lower(text)

# Create a string with leading and trailing whitespace
text <- "   Hello, World!   "

# Remove leading and trailing whitespace
str_trim(text)

# Again, let us reset the text variable and remove the white spaces
text <- "Hello, World!"

# Replace the substring "World" with "Universe"
str_replace(text, "World", "Universe")

# Check if the string contains the pattern "World"
str_detect(text, "World")

# Count the number of occurrences of the pattern "o"
str_count(text, "o")

# Extract all occurrences of the pattern "o"
str_extract_all(text, "o")

# Understanding Regular Expressions ----

# Sample text
text <- c("R from Scratch is a book that introduces you to Data Analytics.",
          "The book is written by Dr. JJ")

# Find words that start with 'S' or 's'
matches <- grep("[Ss]c", text, value = TRUE)
print(matches)

# Replace "Scratch" with "Scraps"
replaced_text <- str_replace(text, "Scratch", "Scraps")
print(replaced_text)

# The IMDB Review Dataset, A Simple Sentiment Analysis ----

# Load the smaller IMDB review dataset
imdb_reviews <- read.csv("https://raw.githubusercontent.com/JaySquare87/RfromScratch/main/Chapter%2011/IMDB_Review_First100.csv")

# Load the dplyr library
library(dplyr)

# Clean the textual data
imdb_reviews <- imdb_reviews |>
  mutate(review = str_to_lower(review),
         review = str_replace_all(review, "[[:punct:]]", ""),
         review = str_trim(review))

# Define the positive and negative sentiment words
positive_words <- c("good", "great", "excellent", "awesome", "amazing")
negative_words <- c("bad", "terrible", "awful", "horrible", "disappointing")

# Check if the reviews contain positive or negative sentiment words
imdb_reviews <- imdb_reviews |>
  mutate(sentiment_word = case_when(
    str_detect(review, str_c(positive_words, collapse = "|")) ~ "Positive",
    str_detect(review, str_c(negative_words, collapse = "|")) ~ "Negative",
    TRUE ~ "Neutral"
  ))

# Print the first few rows of the new column
head(imdb_reviews$sentiment_word)

# Load the ggplot2 library
library(ggplot2)

# Create a bar plot of the sentiment words
ggplot(imdb_reviews, aes(x = sentiment_word)) +
  geom_bar() +
  labs(title = "Sentiment Analysis of IMDB Reviews",
       x = "Sentiment Word",
       y = "Count")
