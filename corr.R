#getwd()
#setwd("U:/Data Tools/R Code/RTraining/RProgramming/Prgrm_Assign_1")

#dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
#download.file(dataset_url, "specdata.zip")
#unzip("specdata.zip", exdir = "Prgrm_Assign_1")

#source("complete.R")
#completeData <- complete("specdata")

corr <- function(directory,threshold = 0)       {
        files_list <- list.files("specdata", full.names=TRUE)    #creates a list of files
        dat <- vector()                                     #creates an empty data frame
        completeData <- complete("specdata")
        id <- completeData [completeData$nobs > threshold,1]
        for (i in id){
                file <- read.csv(files_list[i])
                cleanfile <- file[complete.cases(file),]
                cleancorr <- cor(cleanfile$sulfate,cleanfile$nitrate, use="everything")
                dat <- c(dat, cleancorr)     ##loops through the files, concatinating them together
        }
        return(dat)
}
