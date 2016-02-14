raw_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', 
                     na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")


data <- subset(raw_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(raw_data)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png("plot2.png", width=480, height=480)
plot(data$Global_active_power~data$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()