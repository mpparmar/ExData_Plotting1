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
plot1 <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))

## View sample data
head(plot1)
plot1$Date <- as.Date(plot1$Date, format="%d/%m/%Y")
## Plot Hist. graph
hist(plot1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## set output device to png file
png("plot1.png", width=480, height=480)
dev.off()
