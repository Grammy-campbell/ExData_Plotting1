## L.K. Campbell
## Assignment 1
## Exploratory Data Analysis
## Plot #3
## Read in the data and attach column names
dat = read.table("household_power_consumption.txt", sep=";",
	skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")),nrows=2880)

names(dat) = c("Date","Time","Global_active_power","Global_reactive_power",
"Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Construct the third graph and save it as plot3.png
png('plot3.png', width=480, height=480)

n = length(dat$Sub_metering_1)
dat$ID = c(1:n)

## Create the plot
plot(dat$ID,dat$Sub_metering_1, type="l", ylab = "Energy sub metering",
	xaxt = "n", xlab = "" )
points(dat$ID, dat$Sub_metering_2, type="l", col="red")
points(dat$ID, dat$Sub_metering_3, type="l", col="blue")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black","red","blue"),
	legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Turn off the device
dev.off()

