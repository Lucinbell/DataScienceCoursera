complete <- function(directory = "specdata", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used 
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1 117
  ## 2 1041
  ##...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  nobs_vector <- c()
  
  for(i in seq_along(id)){
    
    if(nchar(id[i]) == 1){
      id[i] <- paste("00", id[i], sep = "")
    }
    
    if(nchar(id[i]) == 2){
      id[i] <- paste("0", id[i], sep = "")
    }
    ## I know this is not the optimal way to get the file name,
    ## but I just wanna try this one out
    
    filepath <- paste(directory, "/", id, ".csv", sep = "")
    
    ##process counts of complete cases into nobs_vector
    
    monitor_data <- read.csv(filepath[i])
    
    sulfate_vector <- monitor_data[, "sulfate"]
    
    sulfate_vector_NA <- is.na(sulfate_vector)
    
    nitrate_vector <- monitor_data[, "nitrate"]
    
    nitrate_vector_NA <- is.na(nitrate_vector)
    
    full_case <- sum(!nitrate_vector_NA & !sulfate_vector_NA)
    
    nobs_vector <- c(nobs_vector, full_case)
  }
  
  output <- data.frame(id = id, nobs = nobs_vector)
  
  print(output)
  
}


