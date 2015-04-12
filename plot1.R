
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), 
sep=";", header=TRUE, 
colClasses=c("character", "character", rep("numeric",7)), na.strings="?")
unlink(temp)

dates=c("1/2/2007","2/2/2007")
data_index=match(data[,1],dates)
data=data[which(!is.na(data_index)),]
png("plot1.png")
 hist(as.numeric(data[,3]), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()