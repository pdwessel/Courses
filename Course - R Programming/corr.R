corr <- function(directory, threshold = 0) {
        
        my_files <- list.files(path = directory, pattern = "*.csv")
        my_files <- paste(directory, "/",my_files, sep = "")
        
        my_cor <- vector()
        
        for (i in 1:332){
                my_data <- read.csv(my_files[i])
                
                
                if (complete(directory, i)[["nobs"]] > threshold) {
                        #Get a logical index vector for compete cases
                        index <- !is.na(my_data[["sulfate"]]) & !is.na(my_data[["nitrate"]])
                        
                        #Extract the complete nitrate and sulfate vector
                        nit <- my_data[["nitrate"]][index]
                        sul <- my_data[["sulfate"]][index]
                        
                        #Compute the cor        
                        #my_cor <- rbind(my_cor, cor(nit,sul)) 
                        my_cor <- c(my_cor, cor(nit,sul))
                }
         
        }
        index2 <- !is.na(my_cor)
        return(my_cor[index2])
}
