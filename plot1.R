## Week 1 Project
## Plot 1

library(dplyr)
library(lubridate)

par(mfrow = c(1,1))

data <-read.csv("household_power_consumption.txt", sep = ";", na.strings=c("?", "NA")) #, colClasses = dataColClasses)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
Feb1and2 <- filter(data, (Date == "2007-2-1" | Date == "2007-2-2"))

#Create histogram
hist(Feb1and2$Global_active_power, xlim=c(0,6), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", breaks =12) 

#copy to png file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

