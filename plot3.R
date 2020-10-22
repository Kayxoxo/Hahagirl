complete_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
req_data <- subset(complete_data, Date %in% c("1/2/2007","2/2/2007"))
req_data$Date <- as.Date(req_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(req_data$Date), req_data$Time)
req_data$Datetime <- as.POSIXct(datetime)


### Plot 3
with(req_data, {
  plot(req_data$Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(req_data$Sub_metering_2~Datetime,col = "red")
  lines(req_data$Sub_metering_3~Datetime,col = "blue")
})
#The Legend
legend("topright",col = c("black","red","blue"),lty = 1,lwd = 2,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png(480,480)
