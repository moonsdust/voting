#### Preamble ####
# Purpose: Tests cleaned datasets on voters without IDs that are used in the paper.
# Author: Emily Su
# Date: 13 February 2024
# Contact: em.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-install_packages.R, 01-download_data.R, and 02-data-cleaning.R
# have been ran (in this order) to install the necessary packages, download datasets, and clean datasets, respectively.

#### Workspace setup ####
library(tidyverse)

#### Read in CSV files for cleaned datasets
cleaned_reason_data <- read_csv("data/analysis_data/cleaned_reason_data.csv", show_col_types = FALSE)
cleaned_map_data <- read_csv("data/analysis_data/cleaned_map_data.csv", show_col_types = FALSE)

#### Test data ####
## cleaned_map_data tests ##
## Expected columns: the_geom | county | count | female_white | 
# female_black | female_asian | female_latinx | female_count
# 1. Check classes of columns
class(cleaned_map_data$the_geom) == "character"
class(cleaned_map_data$county) == "character"
class(cleaned_map_data$count) == "numeric"
class(cleaned_map_data$female_white) == "numeric"
class(cleaned_map_data$female_black) == "numeric"
class(cleaned_map_data$female_asian) == "numeric"
class(cleaned_map_data$female_latinx) == "numeric"
class(cleaned_map_data$female_count) == "numeric"

# 2. Numeric columns' minimum is greater than or equal to 0 
cleaned_map_data$count |> min() >= 0
cleaned_map_data$female_white |> min() >= 0
cleaned_map_data$female_black |> min() >= 0
cleaned_map_data$female_asian |> min() >= 0
cleaned_map_data$female_latinx |> min() >= 0
cleaned_map_data$female_count |> min() >= 0

## cleaned_reason_data tests ## 
## Expected columns: county | transport | birthcert | work | lost | 
# disability | family | applied | other | black | latino | asian | white |
# other_race | relocation | id_capable | hardship | female 
# 1. Check classes of columns 
class(cleaned_reason_data$county) == "character"
class(cleaned_reason_data$female) == "numeric"

class(cleaned_reason_data$transport) == "numeric"
class(cleaned_reason_data$birthcert) == "numeric"
class(cleaned_reason_data$work) == "numeric"
class(cleaned_reason_data$lost) == "numeric"
class(cleaned_reason_data$disability) == "numeric"
class(cleaned_reason_data$family) == "numeric"
class(cleaned_reason_data$applied) == "numeric"
class(cleaned_reason_data$other) == "numeric"

class(cleaned_reason_data$black) == "numeric"
class(cleaned_reason_data$latino) == "numeric"
class(cleaned_reason_data$asian) == "numeric"
class(cleaned_reason_data$white) == "numeric"
class(cleaned_reason_data$other_race) == "numeric"

class(cleaned_reason_data$relocation) == "numeric"
class(cleaned_reason_data$id_capable) == "numeric"
class(cleaned_reason_data$hardship) == "numeric"

# 2. Numeric columns' minimum is greater than or equal to 0
cleaned_reason_data$female |> min()  >= 0

cleaned_reason_data$transport |> min()  >= 0
cleaned_reason_data$birthcert |> min()  >= 0
cleaned_reason_data$work |> min()  >= 0
cleaned_reason_data$lost |> min()  >= 0
cleaned_reason_data$disability |> min()  >= 0
cleaned_reason_data$family |> min()  >= 0
cleaned_reason_data$applied |> min()  >= 0
cleaned_reason_data$other |> min()  >= 0

cleaned_reason_data$black |> min()  >= 0
cleaned_reason_data$latino |> min()  >= 0
cleaned_reason_data$asian |> min()  >= 0
cleaned_reason_data$white |> min()  >= 0
cleaned_reason_data$other_race |> min()  >= 0

cleaned_reason_data$relocation |> min()  >= 0
cleaned_reason_data$id_capable |> min()  >= 0
cleaned_reason_data$hardship |> min()  >= 0

# 3. Numeric columns has either a 0 or 1
cleaned_reason_data$female |> unique() %in% c(0, 1)

cleaned_reason_data$transport |> unique() %in% c(0, 1)
cleaned_reason_data$birthcert |> unique() %in% c(0, 1)
cleaned_reason_data$work |> unique() %in% c(0, 1)
cleaned_reason_data$lost |> unique() %in% c(0, 1)
cleaned_reason_data$disability |> unique() %in% c(0, 1)
cleaned_reason_data$family |> unique() %in% c(0, 1)
cleaned_reason_data$applied |> unique() %in% c(0, 1)
cleaned_reason_data$other |> unique() %in% c(0, 1)

cleaned_reason_data$black |> unique() %in% c(0, 1)
cleaned_reason_data$latino |> unique() %in% c(0, 1)
cleaned_reason_data$asian |> unique() %in% c(0, 1)
cleaned_reason_data$white|> unique() %in% c(0, 1)
cleaned_reason_data$other_race|> unique() %in% c(0, 1)

cleaned_reason_data$relocation |> unique() %in% c(0, 1)
cleaned_reason_data$id_capable |> unique() %in% c(0, 1)
cleaned_reason_data$hardship |> unique() %in% c(0, 1)