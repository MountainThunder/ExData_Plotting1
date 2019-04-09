## Week 1 Project
## Plot 3

library(dplyr)
library(lubridate)

par(mfrow = c(1,1))

## Read in data
data <-read.csv("household_power_consumption.txt", sep = ";", na.strings=c("?", "NA")) #, colClasses = dataColClasses)

## Filter only the dates we need
Feb1and2 <- filter(data, (Date == "1/2/2007" | Date == "2/2/2007"))

## Convert column to numeric type
Feb1and2$Global_active_power <- as.numeric(Feb1and2$Global_active_power)

## Combine date adn time to make new column
Feb1and2$DateTime <- strptime(paste(Feb1and2$Date, Feb1and2$Time), format="%d/%m/%Y %H:%M:%S")

## Create plot using type=line
plot(Feb1and2$DateTime, Feb1and2$Sub_metering_1, ylab="Energy sub metering", type="n", xlab= "") 
points(Feb1and2$DateTime, Feb1and2$Sub_metering_1, type="l", xlab= "") 
points(Feb1and2$DateTime, Feb1and2$Sub_metering_2, type="l", col="red" )
points(Feb1and2$DateTime, Feb1and2$Sub_metering_3, type="l", col="blue" )
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))

## copy to png file
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()

