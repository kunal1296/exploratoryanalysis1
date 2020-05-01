#Reading, naming and subsetting the data
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
#converting date/time variable to date/time object
datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#creating a png file
png(file="plot3.png", width=480, height=480)
#calling the plot function
plot(datetime, as.numeric(subpower$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(subpower$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(subpower$Sub_metering_3), type="l", col="blue")
#creating legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#closing the file
dev.off()