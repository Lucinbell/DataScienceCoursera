## Getting and Cleaning Data > Week 4 Assignment
## By Lucinbell

This document contains description of the the data source and variable explanation
of the tidied dataset "tidy_averages.txt", as well as the transformation steps
taken to produced the dataset.

A. Original Data:
- The data is originally sourced from the UCI data archive. The particular
 data set used were downloaded from the assignment instruction with the following
 url: 
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

B. Variables:
Variable 1 and 2 are "subject" and "activity" respectively, which indicates the
volunteer from whom the data is recorded, and the activity they performed.

Variable 3~68 are means and standard deviation of the following features data:
  tBodyAcc-XYZ
  tGravityAcc-XYZ
  tBodyAccJerk-XYZ
  tBodyGyro-XYZ
  tBodyGyroJerk-XYZ
  tBodyAccMag
  tGravityAccMag
  tBodyAccJerkMag
  tBodyGyroMag
  tBodyGyroJerkMag
  fBodyAcc-XYZ
  fBodyAccJerk-XYZ
  fBodyGyro-XYZ
  fBodyAccMag
  fBodyAccJerkMag
  fBodyGyroMag
  fBodyGyroJerkMag

The features labels (column names) are loaded from "./UCI HAR Dataset/features.txt" 
and filtered for "mean()" and "std()". For more information on feature selection,
please reference the text file located in "./UCI HAR Dataset/features_info.txt".

C. Transformation steps:
The data cleaning and transformation performed in the "run_analysis.R" script
closely corresponds to the steps prescribed in the assignment instruction.
  - Step 0
    The script first checks for presence of the "UCI HAR Dataset" in the working
    directory, and downloads and unzips the requisite data if it is not detected.
    
  - Step 1
    The script imports and row binds the training and testing datasets to create
    a combined dataset. This step also combines the subject and activity dataset
    together for further processing down the line.
    
  - Step 2
    Imports data features (variable names) from the features.txt file, which
    is then filtered for mean() and std() using 'grep' function. The result is 
    stored as targetcol (target column), and is then used to subset the columns
    needed for the final output dataset.
    
  - Step 3
    Activity names are imported from the activity_labels.txt file and stored. A
    simple For loops is constructed to cycle through the activity dataset created
    in step 1 and replaces the number with actual activity names using 'gsub'.
    
  - Step 4
    Column names for the combined dataset is changed to descriptive variable
    names by subsetting the features object, which contains the variable names
    imported from features.txt, with targetcol created in step 2 using 'colnames'.
    The column names of activity and subject datasets are also changed to 
    appropriate descriptive names.
    These datasets are then combined into one single data frame.
    
  - Step 5
    Using functions from 'dplyr' package, the script groups the table by subject
    and activity variables, then performs the 'summarize' function with 'mean'
    to create a datasets with means of all variables for each activity and each
    subject.
    This dataset is then exported to a .txt file using 'write.table' function.
    
