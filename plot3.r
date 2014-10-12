## COURSE PROEJECT 1

# Plot 3
# Enerygy sub meeting
library(data.table)
data     <- fread("household_power_consumption.txt", sep=";", header=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- data[(Date=="2007-02-01" | Date=="2007-02-02")]
time <- paste(data_sub$Date, data_sub$Time)
time <- strptime(time, "%Y-%m-%d %H:%M:%S")

par(mfrow =c(1,1)) # 1 plot
par(mar = c(4,4,2,2)) # margin size
plot(time,as.numeric(data_sub$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(time,as.numeric(data_sub$Sub_metering_2), type="l", ylab="Energy sub metering",col="red", xlab="")     
lines(time,as.numeric(data_sub$Sub_metering_3), type="l", ylab="Energy sub metering",col="blue", xlab="") 
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, col=c("black","red","blue"))

dev.copy(png, file="plot3.png")
dev.off()