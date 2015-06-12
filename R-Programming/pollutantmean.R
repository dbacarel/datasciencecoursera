"
Daniele Bacarella 
R Programming
Programming Assignment 1
pollutantmean.R
12/06/2015
"


pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
    
    
    nrows=0
    sum_v=0
    

    
    for(id_x in id){
        if(id_x<10)
            basename<-paste("00",id_x,".csv",sep = "")
        else if(id_x<100)
            basename<-paste("0",id_x,".csv",sep = "")
        else
            basename<-paste(id_x,".csv",sep = "")
        
        filename <- paste(directory,"/",basename, sep = "")
        df <- read.csv(filename)
        pos_pollutant <- df[!is.na(df[,pollutant]),][,pollutant]
        nrows <- nrows + length(pos_pollutant)
        sum_v <- sum_v + sum(pos_pollutant)
    }
    
    

    round(sum_v/nrows, digits=3)
    

    
  
}