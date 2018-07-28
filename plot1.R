## L.K. Campbell
## Assignment 1
## Exploratory Data Analysis
## Plot #1

## Read in the data and attach column names
dat = read.table("household_power_consumption.txt", sep=";",
	skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")),nrows=2880)

names(dat) = c("Date","Time","Global_active_power","Global_reactive_power",
"Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Construct the first graph and save it as plot1.png
## Open the device
png('plot1.png', width=480, height=480)

## Construct the plot.
hist(dat$Global_active_power, col="red", main="Global Active Power",
	xlab="Global Active Power (kilowatts)")

## Turn off the device
dev.off()

