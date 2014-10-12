## COURSE PROEJECT 1

# Plot 2
# Global Active Power

library(data.table)
data     <- fread("household_power_consumption.txt", sep=";", header=TRUE, select=c("Date", "Time","Global_active_power"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- data[(Date=="2007-02-01" | Date=="2007-02-02")]
time <- paste(data_sub$Date, data_sub$Time)
time <- strptime(time, "%Y-%m-%d %H:%M:%S")

par(mfrow =c(1,1)) # 1 plot
par(mar = c(4,4,2,2)) # margin size
plot(time,as.numeric(data_sub$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png")
dev.off()