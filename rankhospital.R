## rankhospital() takes three arguments, state, outcome and rank number
## which returns the name of the hospital in the rank provided from a given
## state in categories of "heart attack", "heart failure" and "pneumonia"
## rank num could also be "best", "worse" or any number with the default being
## the "best" hospital in the state given the outcome category

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## First read the data in a data.frame
  outcome_db <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                         colClasses = "character")
  ## head(outcome_db)
  ## Check that state and outcome are valid
  ## Check for correct argument
  if(!state %in% outcome_db$State) {
    stop("invalid state")
  }
  ## Now that we have the state validated, let's subset the data
  outcome_db <- outcome_db[outcome_db$State == state,]
  
  ## Let's check if the outcome is valid
  ## if so, select the appropriate column from the data set
  if(outcome == "heart attack") {
    colnum <- 11
  } else if(outcome == "heart failure") {
    colnum <- 17
  } else if(outcome == "pneumonia") {
    colnum <- 23
  } else {
    stop("invalid outcome")
  }
  ## First convert the mortality rate of numeric to do ordering
  outcome_db[, colnum] <- as.numeric(outcome_db[, colnum])
  
  ## Let's order the hospitals per mortality rate
  hospitals <- outcome_db[order(outcome_db[, colnum], outcome_db[, 2]), ]
  
  ## Remove the NA entries
  hospitals <- hospitals[(!is.na(hospitals[,colnum])), ]
  
  ## now let's figure out which rank is requested
  if(num == "best") {
    num <- 1  ## Get the first entry
  } else if(num == "worst") {
    num <- nrow(hospitals) ## Get the last entry
  }
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  hospitals[num, 2]
}