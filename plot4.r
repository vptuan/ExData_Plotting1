## COURSE PROEJECT 1

# Plot 4
# 2x2 plot
library(data.table)
data     <- fread("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- data[(Date=="2007-02-01" | Date=="2007-02-02")]
time <- paste(data_sub$Date, data_sub$Time)
time <- strptime(time, "%Y-%m-%d %H:%M:%S")

par(mfrow =c(2,2)) # 2x2 plot
par(mar = c(4,4,2,2)) # margin size

#Plot 1.1
plot(time,as.numeric(data_sub$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Plot 1.2
plot(time,as.numeric(data_sub$Voltage), type="l", ylab="Voltage", xlab="datetime")

#Plot 2.1
plot(time,as.numeric(data_sub$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(time,as.numeric(data_sub$Sub_metering_2), type="l", ylab="Energy sub metering",col="red", xlab="")     
lines(time,as.numeric(data_sub$Sub_metering_3), type="l", ylab="Energy sub metering",col="blue", xlab="") 
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lwd=1, lty=c(1,1,1), col=c("black","red","blue"))

#Plot 2.2
plot(time,as.numeric(data_sub$Global_reactive_power), type="l", ylab="Global_reative_power", xlab="datetime")


dev.copy(png, file="plot4.png")
dev.off()