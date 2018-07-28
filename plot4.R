## L.K. Campbell
## Assignment 1
## Exploratory Data Analysis
## Plot #3
## Read in the data and attach column names
dat = read.table("household_power_consumption.txt", sep=";",
	skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")),nrows=2880)

names(dat) = c("Date","Time","Global_active_power","Global_reactive_power",
"Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Construct the fourth plot which is a 2 by 2 matrix of graphs.
## Save this as plot 4.
## Open device
png('plot4.png')

## Create a matrix frame to hold the graphs
par(mfrow=c(2,2), mai = c(1, 0.75, 0.5, 0.5))

## 1st graph
n = length(dat$Global_active_power)
dat$ID = c(1:n)

plot(dat$ID,dat$Global_active_power, type="l", ylab = "Global Active Power",
	xaxt = "n", xlab = "" )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))


## 2nd graph
n = length(dat$Voltage)
dat$ID = c(1:n)

plot(dat$ID, dat$Voltage, type="l", ylab = "Voltage",
	xaxt = "n", xlab = "datetime" )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

## 3rd graph
n = length(dat$Sub_metering_1)
dat$ID = c(1:n)

plot(dat$ID,dat$Sub_metering_1, type="l", ylab = "Energy sub metering",
	xaxt = "n", xlab = "" )
points(dat$ID, dat$Sub_metering_2, type="l", col="red")
points(dat$ID, dat$Sub_metering_3, type="l", col="blue")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black","red","blue"),
	legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	bty="n", cex=0.85)


## 4th graph
n = length(dat$Global_reactive_power)
dat$ID = c(1:n)

## Create plot
plot(dat$ID, dat$Global_reactive_power, type="l", ylab = "Global_reactive_power",
	xaxt = "n", xlab = "datetime" )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

## Turn off device
dev.off()



