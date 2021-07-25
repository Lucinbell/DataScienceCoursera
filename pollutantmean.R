  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!

pollutantmean <- function(directory = "specdata", pollutant, id = 1:322){
  ## 1- Try to get the proper file path
  
  processing_pool <- data.frame()
  
  file_string <- dir(directory)
  
  for(i in seq_along(id)){
    
    filepath <- paste(directory, "/", file_string[id], sep = "")
    
    processing_pool <- rbind(processing_pool, read.csv(filepath[i]))
  }
  ## 2- Get all the referenced file together into one single data frame
  
  test_string <- processing_pool [, pollutant]
  
  na_string <- is.na(test_string)
  
  answer <- mean(test_string[!na_string])
  
  print(answer)

}