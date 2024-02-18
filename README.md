# Voting

## Overview

In 2016, Texas allowed voters without valid photo ID to vote in the 2016 United States election after the 2011 voter ID law was deemed to be discriminatory against minorities. This paper extends research done on Texas voters without valid photo IDs by focusing on female voters of different races without valid photo IDs and the effects on their turnout across different counties. The results showed that despite the relaxation of the voting law, the voter turnout rates of minority women without photo IDs were lower than White women without photo IDs and that highly populated counties had the highest percentage of female voters without valid photo IDs. These results suggest that the 2011 voter ID law still had an effect on female voters, especially minority women and that further investigation needs to be done on the reasons female voters did not vote in 2016.

This repository contains a replication of the paper, "Who Does Voter ID Keep from Voting?" (Fraga and Miller 2022): https://doi.org/10.1086/716282. The replication on the Social Science Reproduction Platform can be found through [this link](https://doi.org/10.48152/ssrp-cbev-p353). The corresponding script to run the replication can be found under `scripts/99-replications.R`. 

## Important Notes
**Data from Paper**: Not all data was able to be retrieved using the `Dataverse` API in `scripts/01-download_data.R` (Please see comments in 01-download_data.R for more information) and not all files can be uploaded due to their file size exceeding 100MB. All the files and data from the paper can be found here: https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/X5ALUA

**About rid_data.csv**: This CSV file is currently not in data/raw_data due to its file size exceeding 100MB. To download rid_data.csv, please read the comment made in the script 01-download_data.R located in the following path: `scripts/01-download_data.R`.

**About data on Texas County Boundaries**: The CSV file from Texas Open Data Portal's "County Map - StratMap_County_poly" page is only able to be retrieved with an app token, email, and password. The CSV file is currently downloaded and located in `data/raw_data under` with the name `county_boundary.csv` to avoid sensitive information from being posted online. 

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data from the paper, "Who Does Voter ID Keep from Voting?".
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `other` contains sketches.
-   `paper` contains the files used to generate both the main paper and the paper on the replicated figures (which is located under the `SSRP` folder). These files includes the Quarto document and reference bibliography file, as well as the PDF of each of the papers.
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Statement on LLM usage

No LLMs were used for any aspect of this work.
