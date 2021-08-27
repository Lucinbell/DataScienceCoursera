## Getting and Cleaning Data > Week 4 Assignment
## By Lucinbell

This repo is an assignment submission for week four of 'Getting and Cleaning
Data' on Coursera.

The repo contains three items:

1. README.md
  This simple README file contains summary description of each component of 
  the assignment.
  
2. CodeBook.md
  This is the note describing the original data
  
3. run_analysis.R
  The R script that executes the data cleaning and transformation of the
  assignment dataset: UHI HAR Dataset. The R script performs download, unzip,
  data merging, and calculation, with the final output of a .txt file.
  The script requires packages "dplyr" (for grouping and transforming data)
  and "utils" (for unziping compressed file) to function.
  
Running "run_analysis.R":
- To run the script, simply download the script to the working directory and
source the file. The script will check if the "UCI HAR Dataset" (the unzipped
file from the downloaded file) is present in the working directory. If not,
it will download and decompress the file.

