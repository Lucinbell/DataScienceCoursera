corr <- function(directory = "specdata", threshold = 0){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the 
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  tabulation <- c()
  
  file_string <- dir(directory)
  
  
  
  for(i in seq_along(file_string)) {
    
    filepath <- paste(directory, "/", file_string[i], sep = "")
    
    collector <- read.csv(filepath)
    
    sulfate_vector <- collector[, "sulfate"]
    
    sulfate_vector_NA <- is.na(sulfate_vector)
    
    nitrate_vector <- collector[, "nitrate"]
    
    nitrate_vector_NA <- is.na(nitrate_vector)
    
    full_case <- sum(!nitrate_vector_NA & !sulfate_vector_NA)
    
    if(full_case >= threshold){
      sample_cor <- cor(sulfate_vector, nitrate_vector, use = "pairwise.complete.obs")
      tabulation <- c(tabulation, sample_cor)
    }
  }
  
  dim(tabulation)
  
  tabulation
}