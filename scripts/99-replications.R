#### Preamble ####
# Purpose: Replicated graphs from "Who Does Voter ID Keep from Voting?" by 
# Bernard L. Fraga and Michael G. Miller (2022)
# Author: Emily Su
# Date: 13 February 2024
# Contact: em.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: tidyverse, ggplot2, and knitr has been installed by running 00-install_packages.R


#### Workspace setup ####
library(tidyverse)
library(ggplot2)
library(knitr)


#### Load data ####
cleaned_reason_data <- read_csv("data/analysis_data/cleaned_reason_data.csv", show_col_types = FALSE)

#### Replication #### 
## Figure A1: 
# https://dataverse.harvard.edu/file.xhtml?fileId=4328158&version=1.0
figure_A1_rep_all_data <- cleaned_reason_data |>
  select(family, applied, transport, birthcert, disability, work, lost, other, black, latino, white)

# White 
figure_A1_rep_white_data <- figure_A1_rep_all_data |>
  # Filter for white
  filter(white == 1) |>
  # Remove other races
  select(-c(black, latino)) |>
  # Get percentages 
  mutate( 
    "Family Obligations" = round(sum(family) / n(), 2),
    "Applied, Has Not Recieved" = round(sum(applied) / n(), 2),
    "Lack of Transportation" = round(sum(transport) / n(), 2),
    "Lacks Necessary Documents" = round(sum(birthcert) / n(), 2), 
    "Disability/Illness" = round(sum(disability) / n(), 2),
    "Work Obligations" = round(sum(work) / n(), 2), 
    "ID was Lost or Stolen" = round(sum(lost) / n(), 2), 
    "Other Reason" = round(sum(other) / n(), 2)
  ) |>
  # Remove the original columns
  select(-c(family, applied, transport, birthcert, disability, work, lost, other, white)) |>
  # Have the percentages only show up in 1 row
  unique() |>
  # Code snippet to convert to a 1-column matrix and then to a vector 
  # was adapted from the following: https://www.geeksforgeeks.org/convert-matrix-to-vector-in-r/
  t() |> # Convert 1-row matrix into a 1-column matrix
  c() |> # Convert to a vector
  tibble() |> # Change into a tibble
  rename( # Left side is the new name and the right side is the old name
    percent = "c(...)"
  ) |>
  mutate(
    reasons = c("Family Obligations", 
                "Applied, Has Not Recieved", 
                "Lack of Transportation", 
                "Lacks Necessary Documents",
                "Disability/Illness", 
                "Work Obligations", 
                "ID was Lost or Stolen",
                "Other Reason"),
     # Add column for race
    race = "white"
  ) 


# Black
figure_A1_rep_black_data <- figure_A1_rep_all_data |>
  # Filter for black
  filter(black == 1) |>
  # Remove other races
  select(-c(white, latino)) |>
  # Get percentages 
  mutate( 
    "Family Obligations" = round(sum(family) / n(), 2),
    "Applied, Has Not Recieved" = round(sum(applied) / n(), 2),
    "Lack of Transportation" = round(sum(transport) / n(), 2),
    "Lacks Necessary Documents" = round(sum(birthcert) / n(), 2), 
    "Disability/Illness" = round(sum(disability) / n(), 2),
    "Work Obligations" = round(sum(work) / n(), 2), 
    "ID was Lost or Stolen" = round(sum(lost) / n(), 2), 
    "Other Reason" = round(sum(other) / n(), 2)
  ) |>
  # Remove the original columns
  select(-c(family, applied, transport, birthcert, disability, work, lost, other, black)) |>
  # Have the percentages only show up in 1 row
  unique() |>
  # Code snippet to convert to a 1-column matrix and then to a vector 
  # was adapted from the following: https://www.geeksforgeeks.org/convert-matrix-to-vector-in-r/
  t() |> # Convert 1-row matrix into a 1-column matrix
  c() |> # Convert to a vector
  tibble() |> # Change into a tibble
  rename( # Left side is the new name and the right side is the old name
    percent = "c(...)"
  ) |>
  mutate(
    reasons = c("Family Obligations", 
                "Applied, Has Not Recieved", 
                "Lack of Transportation", 
                "Lacks Necessary Documents",
                "Disability/Illness", 
                "Work Obligations", 
                "ID was Lost or Stolen",
                "Other Reason"),
    # Add column for race
    race = "black"
  ) 

# Latinx
figure_A1_rep_latinx_data <- figure_A1_rep_all_data |>
  # Filter for Latino
  filter(latino == 1) |>
  # Remove other races
  select(-c(white, black)) |>
  # Get percentages 
  mutate( 
    "Family Obligations" = round(sum(family) / n(), 2),
    "Applied, Has Not Recieved" = round(sum(applied) / n(), 2),
    "Lack of Transportation" = round(sum(transport) / n(), 2),
    "Lacks Necessary Documents" = round(sum(birthcert) / n(), 2), 
    "Disability/Illness" = round(sum(disability) / n(), 2),
    "Work Obligations" = round(sum(work) / n(), 2), 
    "ID was Lost or Stolen" = round(sum(lost) / n(), 2), 
    "Other Reason" = round(sum(other) / n(), 2)
  ) |>
  # Remove the original columns
  select(-c(family, applied, transport, birthcert, disability, work, lost, other, latino)) |>
  # Have the percentages only show up in 1 row
  unique() |> # Code snippet to convert to a 1-column matrix and then to a vector
  # Code snippet to convert to a 1-column matrix and then to a vector 
  # was adapted from the following: https://www.geeksforgeeks.org/convert-matrix-to-vector-in-r/
  t() |> # Convert 1-row matrix into a 1-column matrix
  c() |> # Convert to a vector
  tibble() |> # Change into a tibble
  rename( # Left side is the new name and the right side is the old name
    percent = "c(...)"
  ) |>
  mutate(
    reasons = c("Family Obligations", 
                "Applied, Has Not Recieved", 
                "Lack of Transportation", 
                "Lacks Necessary Documents",
                "Disability/Illness", 
                "Work Obligations", 
                "ID was Lost or Stolen",
                "Other Reason"),
    # Add column for race
    race = "latinx"
  ) 

# Combine all
# Referenced code from here: https://help.qresearchsoftware.com/hc/en-us/articles/4446615637775-How-to-Merge-Tables-Using-R
combined_figure_A1_data <- rbind(figure_A1_rep_white_data, figure_A1_rep_black_data)
combined_figure_A1_data <- rbind(combined_figure_A1_data, figure_A1_rep_latinx_data)

# Graph
# Referenced code from https://r-graph-gallery.com/267-reorder-a-variable-in-ggplot2.html
# To figure out how to sort 
combined_figure_A1_data |>
  mutate(reasons = fct_reorder(reasons, desc(percent))) |>
  ggplot(mapping = aes(x = reasons, y = percent)) +
  geom_bar(stat="identity") +
  theme_minimal() +
  labs(
    x = "Reasons",
    y = "Percent"
  ) +
  coord_flip() + 
  # Referenced code from https://github.com/tidyverse/ggplot2/issues/2762
  # to figure out how to put labels on the left and use facet_grid
  facet_grid(vars(race), switch = "y") +
  guides(x = guide_axis(angle = 0), ) +
  theme(legend.position = "bottom") + 
  ggtitle("Figure A1") 

# Table
combined_figure_A1_data |>
  kable()


## Figure 2
figure_2_rep_data <- cleaned_reason_data |>
  select(family, applied, transport, birthcert, disability, work, lost, other) |>
  # Get percentages 
  mutate( 
    "Family Obligations" = round((sum(family) / n()) * 100, 2),
    "Applied, Has Not Recieved" = round((sum(applied) / n()) * 100, 2),
    "Lack of Transportation" = round((sum(transport) / n()) * 100, 2),
    "Lacks Necessary Documents" = round((sum(birthcert) / n()) * 100, 2), 
    "Disability/Illness" = round((sum(disability) / n()) * 100, 2),
    "Work Obligations" = round((sum(work) / n()) * 100, 2), 
    "ID was Lost or Stolen" = round((sum(lost) / n()) * 100, 2), 
    "Other Reason" = round((sum(other) / n()) * 100, 2)
  ) |>
  # Remove the original columns
  select(-c(family, applied, transport, birthcert, disability, work, lost, other)) |>
  # Have the percentages only show up in 1 row
  unique() |>
  # Code snippet to convert to a 1-column matrix and then to a vector 
  # was adapted from the following: https://www.geeksforgeeks.org/convert-matrix-to-vector-in-r/
  t() |> # Convert 1-row matrix into a 1-column matrix
  c() |> # Convert to a vector
  tibble() |> # Change into a tibble
  rename( # Left side is the new name and the right side is the old name
    percent = "c(...)"
  ) |>
  mutate(
    reasons = c("Family Obligations", 
                "Applied, Has Not Recieved", 
                "Lack of Transportation", 
                "Lacks Necessary Documents",
                "Disability/Illness", 
                "Work Obligations", 
                "ID was Lost or Stolen",
                "Other Reason"
                )
  ) 

# Referenced code from https://r-graph-gallery.com/267-reorder-a-variable-in-ggplot2.html
# To figure out how to sort 
# Graph
figure_2_rep_data |>
  mutate(reasons = fct_reorder(reasons, desc(percent))) |>
  ggplot(mapping = aes(x = reasons, y = percent)) +
  geom_bar(stat="identity") +
  ggtitle("Figure 2: Impediments cited by Texas voters in 2016") +
  coord_flip() + 
  theme_bw() +
  labs(x = "Reasons", y = "Percent")

# Table
figure_2_rep_data |> 
  kable()


# Figure 3


