rankhospital <- function(state, outcome, num = "best") {
        
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
        
        ##set the value of num (if required)
        if (num == "best") {
                num <- 1
        } else if (num == "worst") {
                num <- dim(bst)[1]
        }
        
        ##Return the name of the hospital
        return(bst[num,1])
        
}
