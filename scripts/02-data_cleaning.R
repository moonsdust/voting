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
# Expected Columns: 
# the_geom | county | count | female_count | female_white | female_black | female_latinx | female_asian

# Function to change values in a certain column to uppercase for the first letter of each word
# Referenced https://www.geeksforgeeks.org/convert-first-letter-of-every-word-to-uppercase-in-r-programming-str_to_title-function/
toTitle <- function(col) {
  for (i in seq(col)) {
    col[i] <- str_to_title(col[i])
  }
  return(col)
}

# Change county names to be uppercase for only the first word of each part of its name
cleaned_reason_data$county <- toTitle(cleaned_reason_data$county)

# temp dataset to get the count of voters without ID in each county 
temp_count_data <- cleaned_reason_data |>
  # Group by county only to get the count 
  group_by(county) |>
  mutate(
    count = n()
  ) |>
  ungroup() |>
  select(c(county, count)) |>
  unique()

# Datasets for the count of female voters without ID in each county across each race 
temp_female_count_data <- cleaned_reason_data |>
  # Group by county and filter for female to get the female count for voters
  group_by(county) |>
  filter(female == 1) |>
  mutate(
    female_count = n()
  ) |>
  ungroup() |>
  select(c(county, female_count)) |>
  unique()

temp_white_female_count_data <- cleaned_reason_data |>
  # Group by county and filter for female and white
  group_by(county) |>
  filter(female == 1) |>
  filter(white == 1) |>
  mutate(
    female_white = n()
  ) |>
  ungroup() |>
  select(c(county, female_white)) |>
  unique()

temp_black_female_count_data <- cleaned_reason_data |>
  # Group by county and filter for female and black
  group_by(county) |>
  filter(female == 1) |>
  filter(black == 1) |>
  mutate(
    female_black = n()
  ) |>
  ungroup() |>
  select(c(county, female_black)) |>
  unique()

temp_latinx_female_count_data <- cleaned_reason_data |>
  # Group by county and filter for female and latino
  group_by(county) |>
  filter(female == 1) |>
  filter(latino == 1) |>
  mutate(
    female_latinx = n()
  ) |>
  ungroup() |>
  select(c(county, female_latinx)) |>
  unique()

temp_asian_female_count_data <- cleaned_reason_data |>
  # Group by county and filter for female and asian
  group_by(county) |>
  filter(female == 1) |>
  filter(asian == 1) |>
  mutate(
    female_asian = n()
  ) |>
  ungroup() |>
  select(c(county, female_asian)) |>
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

# join temporary datasets with cleaned_map_data
cleaned_map_data <- cleaned_map_data |>
  left_join(temp_count_data, by = "county")
cleaned_map_data <- cleaned_map_data |>
  left_join(temp_female_count_data, by = "county")
cleaned_map_data <- cleaned_map_data |>
  left_join(temp_white_female_count_data, by = "county")
cleaned_map_data <- cleaned_map_data |>
  left_join(temp_black_female_count_data, by = "county")
cleaned_map_data <- cleaned_map_data |>
  left_join(temp_latinx_female_count_data, by = "county")
cleaned_map_data <- cleaned_map_data |>
  left_join(temp_asian_female_count_data, by = "county")


# Set count values that are NA to 0 
cleaned_map_data$count[is.na(cleaned_map_data$count)] <- 0
cleaned_map_data$female_count[is.na(cleaned_map_data$female_count)] <- 0
cleaned_map_data$female_white[is.na(cleaned_map_data$female_white)] <- 0
cleaned_map_data$female_black[is.na(cleaned_map_data$female_black)] <- 0
cleaned_map_data$female_latinx[is.na(cleaned_map_data$female_latinx)] <- 0
cleaned_map_data$female_asian[is.na(cleaned_map_data$female_asian)] <- 0

#### Save data ####
# Save the cleaned reason data
write_csv(cleaned_reason_data, "data/analysis_data/cleaned_reason_data.csv")
# Save the cleaned map data
write_csv(cleaned_map_data, "data/analysis_data/cleaned_map_data.csv")