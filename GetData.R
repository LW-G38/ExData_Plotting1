library("plyr")

downloadpowerdata <- function(){
        fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        zipfile <-"exdata-data-household_power_consumption.zip"
        download.file(fileurl, destfile=zipfile, method="curl")
        unzip(zipfile, exdir="data")
}

datacleaning <- function(){
        filename <- "data/household_power_consumption.txt"
        powerdata <- read.table(filename,header=TRUE,sep=";")
        powerline<-powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
        return(powerline)
}
