dat <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
req_dat <- dat[(dat$Date == "2007-02-01" | dat$Date == "2007-02-02"),]
row.names(req_dat) <- 1:2880
Day_Time <- paste(req_dat$Date,req_dat$Time)
req_dat$Day_Time <- as.POSIXct(Day_Time)

with(req_dat, plot(Global_active_power ~ Day_Time, type="l", ylab = "Global Active Power (kilowatts)"))

dev.copy(png,file = "plot2.png", width = 480, height = 480)
dev.off()