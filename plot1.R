dat <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
req_dat <- dat[(dat$Date == "2007-02-01" | dat$Date == "2007-02-02"),]
row.names(req_dat) <- 1:2880
hist(req_dat$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency" , col ="Red")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()