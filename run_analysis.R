# The run_analysis.R 
# By Lucinbell, 2021/08/26

# 0. Check to see if the assignment dataset is in the working directory.
#    If not, download and unzip the file

  if("UCI HAR Dataset" %in% dir()){
    message("UCI HAR Dataset detected in dir()")
  } else {
    message("UCI HAR Dataset not found. Proceed to download dataset")
    url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url1, destfile = "./Dataset.zip")
    unzip("./Dataset.zip")
    remove(url1)
  }
  

# 1. Merges the training and the test sets to create one data set.
  giant_table <- rbind(
    read.table("./UCI HAR Dataset/test/X_test.txt"),
    read.table("./UCI HAR Dataset/train/X_train.txt")
  )
  
  
  subject_string <- rbind(
    read.table("./UCI HAR Dataset/test/subject_test.txt"),
    read.table("./UCI HAR Dataset/train/subject_train.txt")
  )
  
  activity_string <- rbind(
    read.table("./UCI HAR Dataset/test/y_test.txt"),
    read.table("./UCI HAR Dataset/train/y_train.txt")
  )
  

# 2. Extracts only the measurements on the mean and standard
#    deviation for each measurement.
  features <- read.table("./UCI HAR Dataset/features.txt")[,2]
  targetcol <- grep("mean\\()|std\\()", features)

  slim_table <- giant_table[, targetcol]
    #remove unnecessary object
    remove(giant_table)
  
# 3. Uses descriptive activity names to name the activities in the data set
  activity <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
  for(i in 1:6){
    activity_string[[1]] <- gsub(i, activity[i], activity_string[[1]])
  }

# 4. Appropriately labels the data set with descriptive variable names
  colnames(slim_table) <- features[targetcol]
  colnames(activity_string) <- "activity"
  colnames(subject_string) <- "subject"
  
  slim_table <- cbind(subject_string, activity_string, slim_table)
  
  #remove un-needed objects
    remove(subject_string, activity_string,
           activity, features, targetcol, i)

# 5. From the data set in step 4, creates a second, independent tidy data
#    set with the average of each variable for each activity and each subject
  if("dplyr" %in% (.packages())){
    message("dplyr already loaded")
  }  else {
    message("Loading dplyr")
    library(dplyr)
  }
  
  output <- slim_table %>% group_by(subject, activity) %>% 
            summarize(across(.cols= everything(), mean))

  

  write.table(output, file = "./tidy_averages.txt", row.names = FALSE)

  
  