data<- read.table("household_power_consumption.txt",header=T, sep=";",stringsAsFactors=FALSE)

head(data)

data$dateT<-strptime(paste(data$Date, data$Time,sep = " "), format="%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

subData<- subset(data, Date>="2007-02-01" & Date<="2007-02-02")


png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(subData$dateT, subData$Global_active_power,type='l',xlab="", ylab = "Global Active Power (kilowatts)")
plot(subData$dateT, subData$Voltage,type='l',xlab="", ylab = "Voltage")
plot(subData$dateT, subData$Sub_metering_1,type='l',xlab="", ylab = "Energy sub metering")
lines(subData$dateT, subData$Sub_metering_2,type='l', col = "red")
lines(subData$dateT, subData$Sub_metering_3,type='l', col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty =1, lwd =2.5, col = c("black", "red", "blue"))
plot(subData$dateT, subData$Global_reactive_power,type='l',xlab="", ylab = "Global_reactive_power")
dev.off()