#####################################################################
## Script corresponding to 'Exploratory Data Analysis' Week1 Project
#####################################################################
##
## Author: ferran.brianso@gmail.com
## Created on:    2015/07/10
## Last modified: 2015/07/12
##
####################################################################
## Github repo: http://github.com/ferran-brianso/ExData_Plotting1
####################################################################

#### 
#### The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
####  
####  Date: Date in format dd/mm/yyyy
####  Time: time in format hh:mm:ss
####  Global_active_power: household global minute-averaged active power (in kilowatt)
####  Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
####  Voltage: minute-averaged voltage (in volt)
####  Global_intensity: household global minute-averaged current intensity (in ampere)
####  Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
####  Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
####  Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
####



#####################################
###  Plot1.R (Global Active Power)
#####################################
## Load the full dataset
all.data <- read.csv("household_power_consumption.txt", header=T, sep=';', quote='\"', na.strings="?", 
                      nrows=2075259, stringsAsFactors=F, comment.char="", check.names=F)
all.data$Date <- as.Date(all.data$Date, format="%d/%m/%Y")

## Subset the data by date range
data <- subset(all.data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(all.data)

## Properly format dates
date.time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date.time)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save plot to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
