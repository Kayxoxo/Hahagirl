complete_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
req_data <- subset(complete_data, Date %in% c("1/2/2007","2/2/2007"))
req_data$Date <- as.Date(req_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(req_data$Date), req_data$Time)
req_data$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(req_data, {
  plot(Global_active_power~Datetime, type="l", #graph 1
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", #graph 2
       ylab="Voltage", xlab="")
  plot(req_data$Sub_metering_1~Datetime, type="l",#graph 3
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(req_data$Sub_metering_2~Datetime,col = "red")
  lines(req_data$Sub_metering_3~Datetime,col = "blue")
  plot(Global_reactive_power~Datetime, type="l", #graph 4
       ylab="Global Reactive Power (kilowatts)", xlab="")
  
})


