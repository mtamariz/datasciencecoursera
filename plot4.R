## Read data:  only the desired lines from file
a <- read.delim("household_power_consumption.txt", header = FALSE, sep = ";", skip=66637, nrows = 2880, na.strings="?")

## Read the column names from first line of file
nam = read.delim("household_power_consumption.txt", header = FALSE, sep = ";", nrows = 1)

## Assign column names to data
names(a) <- as.vector(t(nam)[,1])
head(a)

## plot4
png("plot4.png",width=480,height=480)

par(mfcol=c(2,2))

plot(a$Global_active_power,type="l", xaxt = "n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1,at=seq(0,2874,1437), labels = c("Thu","Fri", "Sat"))

plot(a$Sub_metering_1,type="l", xaxt = "n", xlab="", ylab="Energy sub metering")
axis(1,at=seq(0,2874,1437), labels = c("Thu","Fri", "Sat"))
lines(a$Sub_metering_2, col="red")
lines(a$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, col=c("black","red","blue"))

plot(a$Voltage,type="l", xaxt = "n", xlab="datetime", ylab="Voltage")
axis(1,at=seq(0,2874,1437), labels = c("Thu","Fri", "Sat"))

plot(a$Global_reactive_power,type="l", xaxt = "n",xlab="datetime", ylab="Global_reactive_power")
axis(1,at=seq(0,2874,1437), labels = c("Thu","Fri", "Sat"))

dev.off()
