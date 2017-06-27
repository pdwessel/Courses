best <- function(state, outcome) {
        
        ##Read in the hospital data
        data <- read.csv("outcome-of-care-measures.csv", na.strings 
                         = "Not Available", stringsAsFactors = FALSE)
        
        ##Check the validity of the state argument
        if (!is.element(state,unique(data[,7]))) {
                stop("invalid state")
        } 
        
        ##Check the validity of the outcome argument
        possible_outcomes = c("heart attack", "heart failure", "pneumonia")
        if (!is.element(outcome, possible_outcomes)) {
                stop("invalid outcome")
        } 
        
        ##Find the hosptial in the state with the lowest 30-day death rate for
        ##the specified outcome.
        
        ##Seperate the three relevant columns
        outcomes <- c("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
        dataset <- data[,c(2,7,outcomes[outcome])]
        names(dataset) <- c("hospital", "state", "outcome")
        
        ##Remove the NA values
        dataset <- dataset[!is.na(dataset$outcome),]
        
        ##Sort the dataset by State > Outcome > Hospital
        dataset <- dataset[order(dataset$state, dataset$outcome, dataset$hospital),]
        
        ##Select the correct state data
        bst <- dataset[dataset$state == state,]
        
        ##Return the name of the hospital
        return(bst[1,1])
        
        
        
        
        
        
        
        
                
        
}