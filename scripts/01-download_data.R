#### Preamble ####
# Purpose: Downloads and saves data from paper into CSV format. 
# Author: Emily Su
# Date: 13 February 2024
# Contact: em.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-install_packages.R has been ran first to install packages below.

#### Workspace setup ####
library(dataverse)
library(tidyverse)
library(readr)
library(haven)

#### Download data #### 
# NOTE: If you unable to download data from dataverse, access the data through 
# https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/X5ALUA
# and download the following files: fraga_miller_county_replication.tab (in the dta format),
# and fraga_miller_reasons_replication.tab (in the dta format) and read in 
# each dataset using the read_dta function and set them to the variables county_data, and reason_data. 

county_data <- get_dataframe_by_name(filename = "fraga_miller_county_replication.tab",
                                     dataset = "10.7910/DVN/X5ALUA", server = "dataverse.harvard.edu",
                                     original = TRUE,
                                     .f = haven::read_dta)
reason_data <- get_dataframe_by_name(filename = "fraga_miller_reasons_replication.tab",
                                     dataset = "10.7910/DVN/X5ALUA", server = "dataverse.harvard.edu",
                                     original = TRUE,
                                     .f = haven::read_dta)
#### Save data ####
# Save county data into CSV format
write_csv(county_data, "data/raw_data/county_data.csv")
# Save reason data into CSV format
write_csv(reason_data, "data/raw_data/reason_data.csv")