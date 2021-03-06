complete_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
req_data <- subset(complete_data, Date %in% c("1/2/2007","2/2/2007"))
req_data$Date <- as.Date(req_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(req_data$Date), req_data$Time)
req_data$Datetime <- as.POSIXct(datetime)

## Plot 2
with(req_data, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})