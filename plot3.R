unzip("household_power_consumption.zip")
setClass('myDate')
Sys.setlocale("LC_TIME", "en_US.UTF-8")
setAs("character","myDate",function(from) as.Date(from, format="%d/%m/%Y") )
power = read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("myDate","character", rep("numeric", 7)))
power <- power[which(power$Date >=as.Date("01/02/2007","%d/%m/%Y") & power$Date <=as.Date("02/02/2007","%d/%m/%Y")),]
power$timestamp <- strptime(paste(power$Date,power$Time, sep=" "),"%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
plot(y=power$Sub_metering_1, x = power$timestamp,ylab="Energy sub metering", type="l", xlab="", col="black")
lines(y=power$Sub_metering_2, x = power$timestamp, type = "l", col="red")
lines(y=power$Sub_metering_3, x = power$timestamp, type = "l", col="blue")
legend("topright", col = c("black","red", "blue"), legend = colnames(power)[7:9], lwd = 1)
dev.off()