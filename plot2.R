## Read data:  only the desired lines from file
a <- read.delim("household_power_consumption.txt", header = FALSE, sep = ";", skip=66637, nrows = 2880, na.strings="?")

## Read the column names from first line of file
nam = read.delim("household_power_consumption.txt", header = FALSE, sep = ";", nrows = 1)

## Assign column names to data
names(a) <- as.vector(t(nam)[,1])
head(a)

## plot2
png("plot2.png",width=480,height=480)
plot(a$Global_active_power,type="l", xaxt = "n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1,at=seq(0,2874,1437), labels = c("Thu","Fri", "Sat"))
dev.off()

