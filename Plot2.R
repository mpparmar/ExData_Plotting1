
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
plot2 <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))

## View sample data
head(plot2)
plot2$Date <- as.Date(plot2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot2$Date), plot2$Time)
plot2$Datetime <- as.POSIXct(datetime)
## Plot2

with(plot2, {
  plot(Global_active_power~Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
  })
## set output device to png file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

