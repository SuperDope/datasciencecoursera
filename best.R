## best() takes two arguments, state and outcome (which could be one of three
## "heart attach", "heart failure" or "pneumonia"), and returns the name of
## hospital that has the best (lowest) mortality rate for 30-day period.
## In the event of a tie, the function returns the hospital that comes 
## alphabetically first.

best <- function(state, outcome) {
  ## First read the data in a data.frame
  outcome_db <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                         colClasses = "character")
  head(outcome_db)
}