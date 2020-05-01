#Reading, naming and subsetting the data
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
#creating a png file
png(file="plot1.png",width=480, height=480)
#calling the plot function
hist(as.numeric(subpower$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
# annotating
title(main="Global Active Power")
#closing the file
dev.off()