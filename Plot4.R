#Plot 4
plot_Data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
period <- plot_Data[plot_Data$Date %in% c("1/2/2007","2/2/2007"),]
convert_time <-strptime(paste(period$Date, period$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
period <- cbind(convert_time, period)
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
color_lines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(period$convert_time, period$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(period$convert_time, period$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(period$convert_time, period$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(period$convert_time, period$Sub_metering_2, type="l", col="red")
lines(period$convert_time, period$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=color_lines)
plot(period$convert_time, period$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png,file="plot4.png")
dev.off()
