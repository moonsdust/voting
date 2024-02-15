#### Preamble ####
# Purpose: Simulates datasets that will be used in paper. 
# Author: Emily Su
# Date: 13 February 2024
# Contact: em.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-install_packages.R has been ran to install tidyverse.


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(646)

## Global Variables ##
num_of_counties <- 6
num_of_voters_without_id <- 1000
county_names <-  c("Anderson", "Harris", "Collin", "Dallas", "Travis", "Bexar")

# Dataset 1
# Columns: county | count | female_white | female_asian | female_black | female_latinx | female_count
simulated_data_one <- tibble(
  county = county_names,
  count = round(runif(n = num_of_counties, min = 0, max = num_of_voters_without_id)),
  female_white = round(runif(n = num_of_counties, min = 0, max = (num_of_voters_without_id / 4))), 
  female_asian = round(runif(n = num_of_counties, min = 0, max = (num_of_voters_without_id / 4))),
  female_black = round(runif(n = num_of_counties, min = 0, max = (num_of_voters_without_id / 4))),
  female_latinx = round(runif(n = num_of_counties, min = 0, max = (num_of_voters_without_id / 4))),
  female_count = round(runif(n = num_of_counties, min = 0, max = num_of_voters_without_id))
)


# Dataset 2 (reason dataset)
# Columns: female | transport | birthcert | work | lost | disability | 
# family | applied | other | black | latino | asian | white | 
# relocation | id_capable | hardship 
simulated_data_two <- tibble(
  female = round(runif(n = num_of_voters_without_id, min = 0, max = 1)), 
  transport = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  birthcert = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  work = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  lost = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  disability = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  family = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  applied = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  other = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  black = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  latino = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  asian = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  white = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  relocation = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  id_capable = round(runif(n = num_of_voters_without_id, min = 0, max = 1)),
  hardship = round(runif(n = num_of_voters_without_id, min = 0, max = 1))
)

# Dataset 1 and 2 Data Validation / Tests 
## Dataset 1 ##
# 1. Check classes of columns
class(simulated_data_one$county) == "character"
class(simulated_data_one$count) == "numeric"
class(simulated_data_one$female_white) == "numeric"
class(simulated_data_one$female_black) == "numeric"
class(simulated_data_one$female_asian) == "numeric"
class(simulated_data_one$female_latinx) == "numeric"
class(simulated_data_one$female_count) == "numeric"

# 2. Numeric columns' minimum is greater than or equal to 0 
simulated_data_one$count |> min() >= 0
simulated_data_one$female_white |> min() >= 0
simulated_data_one$female_black |> min() >= 0
simulated_data_one$female_asian |> min() >= 0
simulated_data_one$female_latinx |> min() >= 0
simulated_data_one$female_count |> min() >= 0

## Dataset 2 ## 
# 1. Check classes of columns 
class(simulated_data_two$female) == "numeric"
class(simulated_data_two$transport) == "numeric"
class(simulated_data_two$birthcert) == "numeric"
class(simulated_data_two$work) == "numeric"
class(simulated_data_two$lost) == "numeric"
class(simulated_data_two$disability) == "numeric"
class(simulated_data_two$family) == "numeric"
class(simulated_data_two$other) == "numeric"
class(simulated_data_two$black) == "numeric"
class(simulated_data_two$latino) == "numeric"
class(simulated_data_two$asian) == "numeric"
class(simulated_data_two$white) == "numeric"
class(simulated_data_two$relocation) == "numeric"
class(simulated_data_two$id_capable) == "numeric"
class(simulated_data_two$hardship) == "numeric"

# 2. Numeric columns' minimum is greater than or equal to 0
simulated_data_two$female |> min()  >= 0
simulated_data_two$transport |> min()  >= 0
simulated_data_two$birthcert |> min()  >= 0
simulated_data_two$work |> min()  >= 0
simulated_data_two$lost |> min()  >= 0
simulated_data_two$disability |> min()  >= 0
simulated_data_two$family |> min()  >= 0
simulated_data_two$applied |> min()  >= 0
simulated_data_two$other |> min()  >= 0
simulated_data_two$black |> min()  >= 0
simulated_data_two$latino |> min()  >= 0
simulated_data_two$asian |> min()  >= 0
simulated_data_two$white |> min()  >= 0
simulated_data_two$relocation |> min()  >= 0
simulated_data_two$id_capable |> min()  >= 0
simulated_data_two$hardship |> min()  >= 0

# 3. Numeric columns has either a 0 or 1
simulated_data_two$female |> unique() %in% c(0, 1)
simulated_data_two$transport |> unique() %in% c(0, 1)
simulated_data_two$birthcert |> unique() %in% c(0, 1)
simulated_data_two$work |> unique() %in% c(0, 1)
simulated_data_two$lost |> unique() %in% c(0, 1)
simulated_data_two$disability |> unique() %in% c(0, 1)
simulated_data_two$family |> unique() %in% c(0, 1)
simulated_data_two$applied |> unique() %in% c(0, 1)
simulated_data_two$other |> unique() %in% c(0, 1)
simulated_data_two$black |> unique() %in% c(0, 1)
simulated_data_two$latino |> unique() %in% c(0, 1)
simulated_data_two$asian |> unique() %in% c(0, 1)
simulated_data_two$white|> unique() %in% c(0, 1)
simulated_data_two$relocation |> unique() %in% c(0, 1)
simulated_data_two$id_capable |> unique() %in% c(0, 1)
simulated_data_two$hardship |> unique() %in% c(0, 1)