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

cleaned_reason_data <- reason_data |>
  # Add column for White
  mutate(
    white =
      if_else(
        (black == 0 & latino == 0 & asian == 0 & other_race == 0), 1, 0
        )
  ) |>
  # Remove columns that we don't need for our analysis 
  select(-c(age_sq, race, bc2, utility2, bank2, govcheck2, other_id, vote_cert))
    
#### Save data ####
write_csv(cleaned_reason_data, "data/analysis_data/cleaned_reason_data.csv")
