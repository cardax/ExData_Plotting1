unzip("household_power_consumption.zip")
setClass('myDate')
Sys.setlocale("LC_TIME", "en_US.UTF-8")
setAs("character","myDate",function(from) as.Date(from, format="%d/%m/%Y") )
power = read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("myDate","character", rep("numeric", 7)))
power <- power[which(power$Date >=as.Date("01/02/2007","%d/%m/%Y") & power$Date <=as.Date("02/02/2007","%d/%m/%Y")),]
power$timestamp <- strptime(paste(power$Date,power$Time, sep=" "),"%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(power, {
  plot(y=Global_active_power, x = timestamp,ylab="Global Active Power", type="l", xlab="")
  plot(y=Voltage, x = timestamp,ylab="Voltage", type="l", xlab="datetime")
  
  
  plot(y=Sub_metering_1, x = timestamp,ylab="Energy sub metering", type="l", xlab="", col="black")
  lines(y=Sub_metering_2, x = timestamp, type = "l", col="red")
  lines(y=Sub_metering_3, x = timestamp, type = "l", col="blue")
  legend("topright", col = c("black","red", "blue"), legend = colnames(power)[7:9], lwd = 1,bty = "n")
  
  plot(y=Global_reactive_power, x = timestamp,ylab="Global_reacting_power", type="l", xlab="datetime")
})
dev.off()