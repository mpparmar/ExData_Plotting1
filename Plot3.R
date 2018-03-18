
## Exploratory data analysis week 1 project
##  Dataset from “Individual household electric power consumption Data Set” 
## Plot1 

## Set woring directory path
setwd("C:/DataScience/Exploratory_DataAnalysis")

## Read data from file from set path
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## View sample data
head(data_all)
plot3 <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))

## View sample data
head(plot3)
plot3$Date <- as.Date(plot3$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot3$Date), plot3$Time)
plot3$Datetime <- as.POSIXct(datetime)
## Plot3

with(plot3, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## set output device to png file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

