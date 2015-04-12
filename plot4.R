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
## Convert dates and times to POSIX format
dates_times <- as.POSIXct(strptime(paste(sub_data$Date,sub_data$Time),"%d/%m/%Y %H:%M:%S"))
## Save the graph to a png file of 480x480 pixels
png(file="plot4.png", width=480,height=480,bg = "white")
## Vector of colours
plot_colours <- c("black", "red", "blue")
## Set the grid for the graphs
par(mfrow=c(2,2), mar=c(4,4,2,2))
## Create Global Active Power line graph
plot(sub_data$Global_active_power~dates_times, type='l', xaxt='n', xlab="",ylab="Global Active Power (kilowatts)")
## Axis labels formatted to show day of the week
axis.POSIXct(1, dates_times, format="%a")
## Create Voltage line graph
plot(sub_data$Voltage~dates_times, type='l', xaxt='n', xlab="datetime",ylab="Voltage")
## Axis labels formatted to show day of the week
axis.POSIXct(1, dates_times, format="%a")
## Create Energy sub metering line graph
plot(sub_data$Sub_metering_1~dates_times, type='l', xaxt='n', xlab="",ylab="Energy sub metering", col=plot_colours[1])
## Add Sub metering 2
lines(sub_data$Sub_metering_2~dates_times, type="l", col=plot_colours[2])
## Add Sub metering 3
lines(sub_data$Sub_metering_3~dates_times, type="l", col=plot_colours[3])
## Vector of the legend labels
legend_names<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
## Create a legend on the top right hand corner of the graph
legend("topright", legend=legend_names, col=plot_colours, lty=1, bty="n")
## Axis labels formatted to show day of the week
axis.POSIXct(1, dates_times, format="%a")
## Create Global reactive power line graph
plot(sub_data$Global_reactive_power~dates_times, type='l', xaxt='n', xlab="datetime",ylab="Global_reactive_power")
## Axis labels formatted to show day of the week
axis.POSIXct(1, dates_times, format="%a")
## Close device
dev.off()