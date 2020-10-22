
complete_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
req_data <- subset(complete_data, Date %in% c("1/2/2007","2/2/2007"))
req_data$Date <- as.Date(req_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(req_data$Date), req_data$Time)
req_data$Datetime <- as.POSIXct(datetime)

head(data)
#graph 1
hist(req_data$Global_active_power,col = "red",main = "Global Active Power",
     xlab ="Global Active Power (kilowatts)")
png("plot1.png", width=480, height=480)


