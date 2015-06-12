"
Daniele Bacarella 
R Programming
Programming Assignment 1
complete.R
12/06/2015
"

complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    
    row_id <- list()
    comp_cases <- list()
    
    for(id_x in id){
        if(id_x<10)
            basename<-paste("00",id_x,".csv",sep = "")
        else if(id_x<100)
            basename<-paste("0",id_x,".csv",sep = "")
        else
            basename<-paste(id_x,".csv",sep = "")
        
        filename <- paste(directory,"/",basename, sep = "")
        
        df <- read.csv(filename)
        
        row_id <- c(row_id, as.integer(id_x))
        comp_cases <- c(comp_cases, sum(complete.cases(df)))
        
     
    }
    
    df<-data.frame(cbind(id<-row_id, nobs<-comp_cases))
    colnames(df) <- c("id","nobs")
    df
    
    
}