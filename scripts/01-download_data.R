#### Preamble ####
# Purpose: Downloads and saves data from paper into CSV format. 
# Author: Emily Su
# Date: 13 February 2024
# Contact: em.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-install_packages.R has been ran to install tidyverse
# and haven. 

#### Workspace setup ####
library(tidyverse)
library(haven)

#### Download data ####
county_data <- read_dta("data/raw_data/fraga_miller_county_replication.dta")
reason_data <- read_dta("data/raw_data/fraga_miller_reasons_replication.dta")

#### Save data ####
# Save county data into CSV format
write_csv(county_data, "data/raw_data/county_data.csv")
# Save reason data into CSV format
write_csv(county_data, "data/raw_data/reason_data.csv")