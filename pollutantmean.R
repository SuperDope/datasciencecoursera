# Pollutant mean function for Week 2 assignment
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the ID numbers
  ## to be used
  
  ## return the mean of the pollutant across all is list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the results!
  means <- c()
  files_list <- list.files(directory, full.names=TRUE)
  for(i in id){
  ##  path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
    i_data <- read.csv(files_list[i])
    interested_data <- i_data[pollutant]
    means <- c(means, interested_data[!is.na(interested_data)])
  }
  
  mean(means)
}