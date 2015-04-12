
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



png("plot2.png")
plot(data$timestamp,data[,3], 
main=NULL, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()