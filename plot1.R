## Install required package and load
install.packages("data.table")
library(data.table)

## Set working directory to where the data file is kept
setwd("~/Coursera/C4 - Exploratory Data Analysis/Course Project 1/ExData_Plotting1")

## Read the data file
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?",stringsAsFactors=FALSE)
## Create a new date column
data$DateTime<-paste(data$Date, data$Time)
## Change the class to Date
data$DateTime <- as.Date(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
## Subset the data to required date range
sub_data <- data[data$DateTime>="2007-02-01" & data$DateTime<="2007-02-02",]
## Create a histogram on the Global Active Power variable
hist(sub_data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
## Save the graph to a png file of 480x480 pixels
dev.copy(png, file="plot1.png")
## Close device
dev.off()
