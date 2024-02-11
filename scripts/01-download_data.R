#### Preamble ####
# Purpose: Downloads and saves data from paper into CSV format. 
# Author: Emily Su
# Date: 13 February 2024
# Contact: em.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-install_packages.R has been ran first to install packages below.
# and haven. 

#### Workspace setup ####
library(dataverse)
library(tidyverse)
library(readr)
library(haven)

#### Download data #### 
# NOTE: FragaMiller_JOP_ReplicationData.RData is currently too large to be uploaded
# through GitHub (it exceeds 100mb) and it is not possible to download the file using 
# the Dataverse API. To obtain this RData file, please download the file here 
# https://dataverse.harvard.edu/file.xhtml?fileId=4328150
# and upload it to the raw_data folder located in the data folder 

# NOTE: If you unable to download data from dataverse, access the data through 
# https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/X5ALUA
# and download the following files: FragaMiller_JOP_ReplicationData.RData, fraga_miller_county_replication.tab (in the dta format),
# and fraga_miller_reasons_replication.tab (in the dta format) and read in 
# each dataset using the load function (for rdata file) and the read_dta function (for dta files)
# and set them to the variables rid_data, county_data, and reason_data. 

rid_data <- load("data/raw_data/FragaMiller_JOP_ReplicationData.RData")

county_data <- get_dataframe_by_name(filename = "fraga_miller_county_replication.tab",
                                     dataset = "10.7910/DVN/X5ALUA", server = "dataverse.harvard.edu",
                                     original = TRUE,
                                     .f = haven::read_dta)
reason_data <- get_dataframe_by_name(filename = "fraga_miller_reasons_replication.tab",
                                     dataset = "10.7910/DVN/X5ALUA", server = "dataverse.harvard.edu",
                                     original = TRUE,
                                     .f = haven::read_dta)
#### Save data ####
# Save rid data into CSV format 
# get function from https://stackoverflow.com/questions/7270544/how-to-see-data-from-rdata-file
write_csv(get(rid_data), "data/raw_data/rid_data.csv")
# Save county data into CSV format
write_csv(county_data, "data/raw_data/county_data.csv")
# Save reason data into CSV format
write_csv(reason_data, "data/raw_data/reason_data.csv")