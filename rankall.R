## Rankall() takes two arguments, outcome and the ranking number and returns
## a data frame containing all the hospitals in that category for the specified
## rank number.

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## First read the data in a data.frame
  outcome_db <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                         colClasses = "character")
  ## head(outcome_db)
  ## Check that outcome is valid
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
  ## First subset the data for the specified outcome
  outcome_db[, colnum] <- as.numeric(outcome_db[, colnum])
  ## Remove the NAs
  outcome_db<-outcome_db[!is.na(outcome_db[,colnum]),]
  
  ## First split it for each state
  state_split <- split(outcome_db, outcome_db$State)
  ## For each state, find the hospital of the given rank
  hospitals <- lapply(state_split, function(x, num) {
    ## Order the hospital based on mortality rate
    x <- x[order(x[,colnum], x$Hospital.Name), ]
    
    ## now let's figure out which rank is requested
    if(num == "best") {
      num <- 1  ## Get the first entry
    } else if(num == "worst") {
      num <- nrow(x) ## Get the last entry
    }
    x$Hospital.Name[num]
  }, num)
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  data.frame(hospital=unlist(hospitals), state=names(hospitals))
}