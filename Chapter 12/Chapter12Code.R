# R From Scratch: An Intro to Data Analytics
# Chapter 12: Time Series Analysis

# Loading the Lubridate package ----
library(lubridate)

# Getting the current date and time ----
# Get the current date and time
now()

# Get the current date without the time component
today()

# Parsing Dates and Times ----
# Parse dates in the format "year-month-day"
ymd("2023-12-31")

# Parse dates in the format "month-day-year"
mdy("12-31-2023")

# Parse dates in the format "day-month-year"
dmy("31-12-2023")

# Parse date-time objects in the format "year-month-day hour:minute:second"
ymd_hms("2023-12-31 23:59:59")

# Parse date-time objects in the format "month-day-year hour:minute:second"
mdy_hms("12-31-2023 23:59:59")

# Parse date-time objects in the format "day-month-year hour:minute:second"
dmy_hms("31-12-2023 23:59:59")

# Extracting Components from Dates and Times ----
# Create a date-time object
dt <- ymd_hms("2023-12-31 23:59:59")

# Extract the year
year(dt)

# Extract the month
month(dt)

# Extract the day
day(dt)

# Extract the hour
hour(dt)

# Extract the minute
minute(dt)

# Extract the second
second(dt)

# Creating Date-Time Sequences ----
# Create a sequence of dates from January 1, 2023 to December 31, 2023
seq(ymd("2023-01-01"), ymd("2023-12-31"), by = "1 month")

# Create a sequence of dates from January 1, 2023 to December 31, 2023 by weeks
seq(ymd("2023-01-01"), ymd("2023-12-31"), by = "1 week")

# Create a sequence of dates from January 1, 2023 to December 31, 2023 by days
seq(ymd("2023-01-01"), ymd("2023-12-31"), by = "1 day")

# Arithmetic Operations on Date-Time Objects ----
# Create a date-time object
dt <- ymd_hms("2023-12-31 23:59:59")

# Add 1 day to the date-time object
dt + days(1)

# Subtract 2 months from the date-time object
dt - months(2)

# Add 1 hour, 30 minutes, and 15 seconds to the date-time object
dt + hours(1) + minutes(30) + seconds(15)

# Create a duration of 1 hour, 30 minutes, and 15 seconds
dur <- dhours(1) + dminutes(30) + dseconds(15)

# Print the duration
dur

# Add the duration to the date-time object
dt + dur

# Create a period of 1 year, 2 months, and 3 days
period(year = 1, months = 2, days = 3)

# Add the period to the date-time object
dt + period(year = 1, months = 3, days = 3)

# Create an interval between two date-time objects
int <- interval(ymd_hms("2023-01-01 00:00:00"), ymd_hms("2023-12-31 23:59:59"))

# Print the interval
int

# Dealing with Time Zones ----
# Create a date-time object in the UTC time zone
dt_utc <- ymd_hms("2023-12-31 23:59:59", tz = "UTC")

# Get the time zone of the date-time object
tz(dt_utc)

# Set the time zone of the date-time object to "America/New_York"
dt_ny <- with_tz(dt_utc, tzone = "America/New_York")

# Print the NY date-time object
dt_ny

# Get the time zone of the date-time object
tz(dt_ny)

# Floor and Ceiling Functions ----
# Create a date-time object
dt <- ymd_hms("2023-12-31 23:59:59")

# Round the date-time object down to the nearest month
floor_date(dt, unit = "month")

# Round the date-time object up to the nearest month
ceiling_date(dt, unit = "month")

# Working with the Daily CO Levels Data ----
# Load the daily CO levels data
fl_co <- read.csv("https://raw.githubusercontent.com/JaySquare87/RfromScratch/main/Chapter%2012/FL_CO_MIN_D.csv")

# Display the first few rows of the data
head(fl_co)

# Check the type of the Date.Local column
class(fl_co$Date.Local)

# Convert the Date.Local column to a date-time object
fl_co$Date.Local <- ymd(fl_co$Date.Local)

# Check the type of the Date.Local column again
class(fl_co$Date.Local)

# Extract the year, month, and day components of the date-time object
fl_co$Year <- year(fl_co$Date.Local)
fl_co$Month <- month(fl_co$Date.Local)
fl_co$Day <- day(fl_co$Date.Local)

# Display the structure of the data
str(fl_co)

# Display the summary of the data
summary(fl_co)

# Load the ggplot2 library
library(ggplot2)

# Load the dplyr library
library(dplyr)

# Create a plot of the average monthly CO levels in Florida for the year 2023
ggplot(fl_co |>
         group_by(Month) |>
         summarize(Avg_CO = mean(Arithmetic.Mean)),
       aes(x = factor(Month), y = Avg_CO)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Monthly CO Levels in Florida (2023)",
       x = "Month",
       y = "Average CO Level (ppm)")
