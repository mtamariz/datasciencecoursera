## Read data:  only the desired lines from file
a <- read.delim("household_power_consumption.txt", header = FALSE, sep = ";", skip=66637, nrows = 2880, na.strings="?")

## Read the column names from first line of file
nam = read.delim("household_power_consumption.txt", header = FALSE, sep = ";", nrows = 1)

## Assign column names to data
names(a) <- as.vector(t(nam)[,1])
head(a)

## plot1
png("plot1.png",width=480,height=480)
hist(a$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
