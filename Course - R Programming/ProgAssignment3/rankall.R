rankall <- function(outcome, num = "best") {

        ##Read in the hospital data
        data <- read.csv("outcome-of-care-measures.csv", na.strings 
                         = "Not Available", stringsAsFactors = FALSE)
        
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
        
        ##Build a vector of all the states 
        states <- unique(dataset[,2])
        
        ##Select the correct hospitals
        hos <- lapply(states, function(x, dataset, num) {
                temp <- dataset[dataset$state == x,]
                if (num == "best") {
                        return(temp[1,1])
                } else if (num == "worst") {
                        return(temp[dim(temp)[1],1])
                } else {
                        return(temp[num,1])
                }
        }, dataset, num)
        
        vect <- cbind(hos,states)
        names(vect) <- c("hospital", "state")
        
        return(vect)
                
                        
        
        
}
