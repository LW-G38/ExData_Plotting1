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

plot3 <- function(powerline){
        datetime <- strptime(paste(powerline$Date, powerline$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
        submeter <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        Energy <- powerline[submeter]
        png("plot3.png", width=480, height=480)
        plot(datetime, as.numeric(Energy$Sub_metering_1),type="l", , xlab="", ylab="Energy Sub Metering")
        lines(datetime, as.numeric(Energy$Sub_metering_2), type="l", col="red")
        lines(datetime, as.numeric(Energy$Sub_metering_3), type="l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=1)
        dev.off()
}