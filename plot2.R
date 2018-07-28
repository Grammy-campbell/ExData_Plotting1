## L.K. Campbell
## Assignment 1
## Exploratory Data Analysis
## Plot #2

## Read in the data and attach column names
dat = read.table("household_power_consumption.txt", sep=";",
	skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")),nrows=2880)

names(dat) = c("Date","Time","Global_active_power","Global_reactive_power",
"Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Construct the second graph and save it as plot2.png
## Open the device
png('plot2.png', width=480, height=480)

n = length(dat$Global_active_power)
dat$ID = c(1:n)

## Create the plot
plot(dat$ID,dat$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)",
	xaxt = "n", xlab = "" )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

## Turn off the device
dev.off()

