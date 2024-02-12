# Voting

## Overview

This repository contains a replication of the paper, "Who Does Voter ID Keep from Voting?" by Bernard L. Fraga and Michael G. Miller (2022): https://doi.org/10.1086/716282. 

## Important Notes
**Data from Paper**: scripts/01-download_data.R retrieves the necessary data from the paper using the `Dataverse` API but not all files can be uploaded due to their file size exceeding 100MB. All the files and data from the paper can be found here:  https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/X5ALUA

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data from the paper, "Who Does Voter ID Keep from Voting?".
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `other` contains sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

No LLMs were used for any aspect of this work.
