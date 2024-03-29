#### Preamble ####
# Purpose: Installs packages needed to run scripts and Quarto document
# Author: Emily Su
# Date: 13 February 2024
# Contact: em.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: -

#### Workspace setup ####
## Installing packages (only needs to be done once per computer)
install.packages("tidyverse") # Contains data-related packages
install.packages("haven") # Used to read in Stata DTA files 
install.packages("knitr") # To make tables
install.packages("janitor") # To clean datasets
install.packages("dplyr")
install.packages("ggplot2") # To make graphs
install.packages("sf") # For making maps
install.packages("readr")
install.packages("dataverse") # Dataverse API to obtain datasets
install.packages("ggpubr") # To put multiple graphs in one graphs 
