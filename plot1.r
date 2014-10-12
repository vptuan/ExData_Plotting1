## COURSE PROEJECT 1

# Plot 1
# Global Active Power
library(data.table)
data     <- fread("household_power_consumption.txt", sep=";", header=TRUE, select=c("Date","Global_active_power"))
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_sub <- data[(Date=="2007-02-01" | Date=="2007-02-02")]

par(mfrow =c(1,1)) # 1 plot
par(mar = c(4,4,2,2)) # margin size
hist(as.numeric(data_sub$Global_active_power), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
#png(filename = "Rplot%03d.png",
#    width = 480, height = 480, units = "px", pointsize = 12,
#    bg = "white",  res = NA, ...,
#    type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)
dev.copy(png, file="plot1.png") # default size 480x480
dev.off() # shutdown the device
