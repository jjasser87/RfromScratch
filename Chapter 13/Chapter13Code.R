# R From Scratch: An Intro to Data Analytics
# Chapter 13: Advanced Data Visualization and Communication

# Advanced Customization

## Customizing Themes
# Load the ggplot2 library
library(ggplot2)

# Load the RPG dataset
RPG <- read.csv("https://raw.githubusercontent.com/JaySquare87/RfromScratch/main/Chapter%205/RPG.csv")

# Create a scatter plot of Magic vs. Weapon
p <- ggplot(RPG, aes(x = Level, y = Magic)) +
  geom_point() +
  labs(title = "Magic vs. Weapon",
       x = "Magic",
       y = "Weapon")

# Display the plot
p

# Customize the text appearance in the plot
p + theme(
  text = element_text(size = 20, family = "Arial")
)

## Modifying Background and Gridlines
# Customize the background color and gridlines in the plot
p + theme(
  panel.background = element_rect(fill = "lightblue"),
  panel.grid = element_blank()
)

## Combining Theme Elements
# Combine multiple theme elements to create a custom theme
p + theme(
  text = element_text(size = 18, family = "Courier New"),
  panel.background = element_rect(fill = "lightblue"),
  panel.grid = element_blank(),
  plot.background = element_rect(fill = "gray")
)

## Customizing Axis ----
# Customize the appearance of axis labels in the plot
p + theme(
  axis.text = element_text(size = 14, family = "Times New Roman", color = "red", angle = 45)
)

# Customize the appearance of axis titles in the plot
p + theme(
  axis.title.x = element_text(size = 16, family = "Arial", color = "blue", angle = 30),
  axis.title.y = element_text(size = 16, family = "Arial", color = "blue", angle = 45)
)

# Customize the axis limits and ticks in the plot
p + scale_x_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 20)) +
  scale_y_continuous(limits = c(0, 200), breaks = seq(0, 200, by = 20))


## Advanced Faceting ----
# Create a faceted plot
p_facet <- ggplot(RPG, aes(x = Level, y = Magic)) +
  geom_point() +
  facet_grid(Class ~ .) +
  labs(title = "Magic vs. Level by Class",
       x = "Level",
       y = "Magic")

# Customize the appearance of facets in the plot
p_facet + theme(
  strip.text = element_text(size = 7, family = "Arial", color = "red"),
  strip.background = element_rect(fill = "lightyellow")
)

# Create a faceted plot with multiple variables
p_multi_facet <- ggplot(RPG, aes(x = Level, y = Magic)) +
  geom_point() +
  facet_grid(Class ~ FBoss) +
  labs(title = "Magic vs. Level by Class and Magic",
       x = "Level",
       y = "Magic")

# Display the plot with modified theme
p_multi_facet + theme(
  strip.text = element_text(size = 6, family = "Arial", color = "red"),
  strip.background = element_rect(fill = "lightyellow")
)

# Complex Plot Types ----

## Dual-Axis Plot ----
# We need the dplyr package for this example
library(dplyr)

# First, let us find the number of characters who have defeated the final boss at each level
fboss_count <- RPG |>
  filter(FBoss == "True", Class %in% c("Magician", "Sorcerer", "BattleMage")) |>
  group_by(Level) |>
  summarise(n = n())

# Create a dual-axis plot
p_dual_axis <- ggplot(RPG |>
                        filter(Class %in% c("Magician", "Sorcerer", "BattleMage")), aes(x = Level, y = Magic)) +
  geom_point() +
  geom_col(data = fboss_count, aes(y = n * 10), color = "red", alpha=0.1) +
  scale_y_continuous(sec.axis = sec_axis(~./10, name = "Num/Defeated Final Boss")) +
  labs(title = "Magic vs. Level vs. FBoss",
       subtitle = "Class types are Magician, Sorcerer, and BattleMage",
       x = "Level",
       y = "Magic")

# Display the dual-axis plot
p_dual_axis

## Annotation and Inset Plots ----
# Find the character with the lowest level and highest magic attribute
top_magic_lowest_level <- RPG |>
  filter(Magic == max(Magic)) |>
  arrange(Level) |>
  head(1)

# Create a scatter plot of Magic vs. Level
p_annotate <- ggplot(RPG, aes(x = Level, y = Magic)) +
  geom_point() +
  geom_point(data = top_magic_lowest_level, color = "red", size = 3, shape = "circle open") +
  labs(title = "Magic vs. Level",
       x = "Level",
       y = "Magic")

# Add an annotation to highlight the character with the lowest level and highest magic attribute
p_annotate + annotate("text", x = top_magic_lowest_level$Level, y = top_magic_lowest_level$Magic+5, label = "Lowest Level / Highest Magic", color = "red", size = 3)

# Filter the data where Class is either Magician, Sorcerer, or BattleMage
RPG_subset <- RPG |>
  filter(Class %in% c("Magician", "Sorcerer", "BattleMage"))

# Create a scatter plot of Magic vs. Level
p_inset <- ggplot(RPG_subset, aes(x = Level, y = Magic)) +
  geom_point() +
  labs(title = "Magic vs. Level",
       subtitle = "Classes: Magician, Sorcerer, BattleMage",
       x = "Level",
       y = "Magic")

# Create a histogram of the Level attribute
hist_magic <- ggplot(RPG_subset, aes(x = Level)) +
  geom_histogram(bins = 20, fill = "lightblue", color = "black") +
  labs(title = "Distribution of Levels",
       x = "Level",
       y = "Frequency")

# Add the inset plot to the main plot. Set location to be lower right corner
p_inset + annotation_custom(ggplotGrob(hist_magic), xmin = 50, xmax = 100, ymin = 0, ymax = 40)

## Map Plots ----
# Load map data for the state of Florida
florida_map <- map_data("county", region = "florida")

# Display the first few rows of the florida_map data
head(florida_map)

# Rename the columns of the florida_map data
florida_map <- florida_map |>
  rename(County.Name = subregion, Longitude = long, Latitude = lat)

# Create a map plot of Florida
ggplot(florida_map, aes(x = Longitude, y = Latitude, group = group)) +
  geom_polygon(fill = "lightgray", color = "black") +
  labs(title = "Map of Florida",
       x = "Longitude",
       y = "Latitude") +
  theme_minimal() +
  coord_quickmap()

### Analyzing CO Levels by County ----
# Load the daily CO data
fl_co <- read.csv("https://raw.githubusercontent.com/JaySquare87/RfromScratch/main/Chapter%2012/FL_CO_MIN_D.csv")

# Calculate the overall average CO levels by county in Florida
co_by_county <- fl_co |>
  group_by(County.Name) |>
  summarise(Avg.CO = mean(Arithmetic.Mean, na.rm = TRUE))

# Display the unique county names in the CO data
unique(fl_co$County.Name)

# Find the counties in the CO data that are not present in the florida_map data
co_by_county |>
  anti_join(florida_map, join_by(County.Name)) |>
  distinct(County.Name)

# Load the stringr package
library(stringr)

# Check if Broward county is present in the florida_map data
# We need to search for the county disregarding the case
florida_map |>
  filter(str_detect(tolower(County.Name), "broward")) |>
  distinct(County.Name)

# Convert the county names in the CO data to lowercase
co_by_county <- co_by_county |>
  mutate(County.Name = tolower(County.Name))

# Find the counties in the CO data that are not present in the florida_map data
co_by_county |>
  anti_join(florida_map, join_by(County.Name)) |>
  distinct(County.Name)

# Merge the CO data with the map data
co_map <- florida_map |>
  left_join(co_by_county, join_by(County.Name))

# Create a map plot of the CO levels in Florida by county
ggplot(co_map, aes(x = Longitude, y = Latitude, group = group, fill = Avg.CO)) +
  geom_polygon(color = "black") +
  scale_fill_viridis_c(option = "plasma", na.value = "white", name = "Avg.CO") +
  labs(title = "Overall Average CO Levels in Florida by County",
       x = "Longitude",
       y = "Latitude") +
  theme_minimal() +
  coord_quickmap()

### For the Whole United States ----
# Load map data for the United States
us_map <- map_data("state")

# Load the complete daily CO data
us_co <- read.csv("https://raw.githubusercontent.com/JaySquare87/RfromScratch/main/Chapter%2013/daily_42101_2023.csv")

# Calculate the overall average CO levels by state in the United States
co_by_state <- us_co |>
  group_by(State.Name) |>
  summarise(Avg.CO = mean(Arithmetic.Mean, na.rm = TRUE))

# Print the first few rows of the co_by_state data
head(co_by_state)

# Convert the state names in the CO data to lowercase
co_by_state <- co_by_state |>
  mutate(State.Name = tolower(State.Name))

# Rename the columns of the us_map data
us_map <- us_map |>
  rename(State.Name = region, Longitude = long, Latitude = lat)

# Find the states in the CO data that are not present in the us_map data
co_by_state |>
  anti_join(us_map, join_by(State.Name)) |>
  distinct(State.Name)

# Filter out the states of Alaska, Hawaii, and Puerto Rico from the CO data
co_by_state <- co_by_state |>
  filter(!State.Name %in% c("alaska", "hawaii", "puerto rico"))

# Find the states in the CO data that are not present in the us_map data
co_by_state |>
  anti_join(us_map, join_by(State.Name)) |>
  distinct(State.Name)

# Merge the CO data with the map data
co_map_us <- us_map |>
  left_join(co_by_state, join_by(State.Name))

# Create a map plot of the CO levels in the United States by state
ggplot(co_map_us, aes(x = Longitude, y = Latitude, group = group, fill = Avg.CO)) +
  geom_polygon(color = "black") +
  scale_fill_viridis_c(option = "plasma", na.value = "white", name = "Avg.CO") +
  labs(title = "Overall Average CO Levels by State",
       x = "Longitude",
       y = "Latitude") +
  theme_minimal() +
  coord_quickmap()
