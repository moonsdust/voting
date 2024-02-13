#### Preamble ####
# Purpose: Cleans dataset from paper into a usable CSV file.
# Author: Emily Su
# Date: 13 February 2024
# Contact: em.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: Have ran 00-install_packages.R and 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
reason_data <- read_csv("data/raw_data/reason_data.csv", show_col_types = FALSE)
texas_county_boundary_data <- read_csv("data/raw_data/county_boundary.csv", show_col_types = FALSE)

# Dataset 1
cleaned_reason_data <- reason_data |>
  # Add column for White
  mutate(
    white =
      if_else(
        (black == 0 & latino == 0 & asian == 0 & other_race == 0), 1, 0
        )
  ) |>
  # Remove columns that we don't need for our analysis 
  select(-c(identifier, age_sq, race, bc2, utility2, bank2, govcheck2, other_id, vote_cert))


# Dataset 2
# Expected Columns: the_geom | county | count 

# Change values in a certain column to be lowercase
# Reference code from https://stackoverflow.com/questions/30429039/r-convert-list-to-lowercase
# Function to change values all to lowercase
toLowerValues <- function(col) {
  for (i in seq(col)) {
    col[i] <- tolower(col[i])
  }
  return(col)
}

# temp dataset to get the count of voters without ID in each county
temp_count_data <- cleaned_reason_data |>
  group_by(county) |>
  mutate(
    count = n()
  ) |>
  ungroup() |>
  select(c(county, count)) |>
  unique()

cleaned_map_data <- texas_county_boundary_data |>
  # clean column names
  clean_names() |>
  # choose the_geom (boundaries of each county) and the name of the county
  select(c(the_geom, name)) |>
  # rename "name" to "county"
  rename(
    county = name
  )

# Change county names to lowercase
temp_count_data$county <- toLowerValues(temp_count_data$county)
cleaned_map_data$county <- toLowerValues(cleaned_map_data$county)

# join temp_count_data with cleaned_map_data
cleaned_map_data <- cleaned_map_data |>
  left_join(temp_count_data, by = "county")

# Set count values that are NA to 0 
cleaned_map_data$count[is.na(cleaned_map_data$count)] <- 0

#### Save data ####
# Save the cleaned reason data
write_csv(cleaned_reason_data, "data/analysis_data/cleaned_reason_data.csv")
# Save the cleaned map data
write_csv(cleaned_map_data, "data/analysis_data/cleaned_map_data.csv")