raw_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', 
                    na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")


data <- subset(raw_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(raw_data)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png("plot3.png", width=480, height=480)
with(data, {
plot(Sub_metering_1~Datetime, type="l", ylab="Energy Sub metering", xlab="")
lines(Sub_metering_2~Datetime, type="l", col="red")
lines(Sub_metering_3~Datetime, type="l", col="blue")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()