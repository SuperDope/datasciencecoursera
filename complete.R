complete <- function(directory, id = 1:332){
  ## 'director' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the i ID numbers
  ## to be used
  
  ## Return a data frame of the from:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the i ID number and 'nobs' is the
  ## number of complete cases
  results <- data.frame(id=numeric(0), nobs=numeric(0))
  for(i in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
    i_data <- read.csv(path)
    interested_data <- i_data[(!is.na(i_data$sulfate)), ]
    interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
    nobs <- nrow(interested_data)
    results <- rbind(results, data.frame(id=i, nobs=nobs))
  }
  results
}