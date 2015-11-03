## Read data:  only the desired lines from file
a <- read.delim("household_power_consumption.txt", header = FALSE, sep = ";", skip=66637, nrows = 2880, na.strings="?")

## Read the column names from first line of file
nam = read.delim("household_power_consumption.txt", header = FALSE, sep = ";", nrows = 1)

## Assign column names to data
names(a) <- as.vector(t(nam)[,1])
head(a)

## plot3
png("plot3.png",width=480,height=480)

plot(a$Sub_metering_1,type="l", xaxt = "n", xlab="", ylab="Energy sub metering")
axis(1,at=seq(0,2874,1437), labels = c("Thu","Fri", "Sat"))
lines(a$Sub_metering_2, col="red")
lines(a$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"))

dev.off()

