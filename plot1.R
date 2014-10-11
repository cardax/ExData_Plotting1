unzip("household_power_consumption.zip")
setClass('myDate')
setAs("character","myDate",function(from) as.Date(from, format="%d/%m/%Y") )
power = read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("myDate","character", rep("numeric", 7)))
power <- power[which(power$Date >=as.Date("01/02/2007","%d/%m/%Y") & power$Date <=as.Date("02/02/2007","%d/%m/%Y")),]
png(filename = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()