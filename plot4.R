
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), 
sep=";", header=TRUE, 
colClasses=c("character", "character", rep("numeric",7)), na.strings="?")
unlink(temp)

dates=c("1/2/2007","2/2/2007")
data_index=match(data[,1],dates)
data=data[which(!is.na(data_index)),]
aa=data #just to make a copy if something goes wrong

#change locale to get Thu/Fri/Sat instead of Finnish weekdays
Sys.setlocale("LC_TIME", "C")
data$timestamp=strptime(paste(data[,1], data[,2], sep=" "), format="%d/%m/%Y %H:%M:%S")



png("plot4.png")
par(mfrow=c(2,2))
#1 plot
plot(data$timestamp,data[,3], 
main=NULL, xlab="", ylab="Global Active Power", type="l")
#2 plot
plot(data$timestamp,data$Voltage, ylab="Voltage",type="l", xlab="datetime", main=NULL)
#3  plot
plot(data$timestamp,data[,7], 
main=NULL, xlab="", ylab="Energy sub metering",
 type="l")
lines(data$timestamp,data[,8],col="red")
lines(data$timestamp,data[,9],col="blue")
legend("topright",colnames(data[,7:9]), bty="n", col=c("black", "red","blue"), lty=c(1,1,1))
#4 plot
plot(data$timestamp,data$Global_reactive_power,ylab="Global_reactive_power", type="l", xlab="datetime", main=NULL)

dev.off()