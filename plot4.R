dat <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
req_dat <- dat[(dat$Date == "2007-02-01" | dat$Date == "2007-02-02"),]
row.names(req_dat) <- 1:2880
Day_Time <- paste(req_dat$Date,req_dat$Time)
req_dat$Day_Time <- as.POSIXct(Day_Time)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(req_dat, {
  plot(Global_active_power~Day_Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(Voltage~Day_Time, type="l", ylab="Voltage (volt)", xlab="")
  
  plot(Sub_metering_1~Day_Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Day_Time,col='Red')
  lines(Sub_metering_3~Day_Time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Day_Time, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png,file = "plot4.png", width = 480, height = 480)
dev.off()