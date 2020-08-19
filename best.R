## best() takes two arguments, state and outcome (which could be one of three
## "heart attack", "heart failure" or "pneumonia"), and returns the name of
## hospital that has the best (lowest) mortality rate for 30-day period.
## In the event of a tie, the function returns the hospital that comes 
## alphabetically first.

best <- function(state, outcome) {
  ## First read the data in a data.frame
  outcome_db <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                         colClasses = "character")
  ## head(outcome_db)
  ## Check for correct argument
  if(!state %in% outcome_db$State) {
    stop("invalid state")
  }
  ## Now that we have the state validated, let's subset the data
  outcome_db <- outcome_db[outcome_db$State == state,]
  
  ## Let's check if the outcome is valid
  ## if so, select the appropriate column from the dataset
  if(outcome == "heart attack") {
    colnum <- 11
  } else if(outcome == "heart failure") {
    colnum <- 17
  } else if(outcome == "pneumonia") {
    colnum <- 23
  } else {
    stop("invalid outcome")
  }
  ## Further subset the data with outcome now
  outcome_rate <- outcome_db[,colnum]
  
  ## get the minimum value
  minimum <- which.min(outcome_rate)
  
  ## Now that we have the index for hospital with lowest death
  ## Get the name(s) of the hospital corresponding to it.
  hospitals <- outcome_db[minimum, 2]
  hospitals <- sort(hospitals) ## sort the names in alphabetical order
  ## return the first value
  hospitals[1]
}