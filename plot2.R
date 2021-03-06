data<- read.table("household_power_consumption.txt",header=T, sep=";",stringsAsFactors=FALSE)

head(data)

data$dateT<-strptime(paste(data$Date, data$Time,sep = " "), format="%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

subData<- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

png("plot2.png", width =480, height=480)
plot(subData$dateT, subData$Global_active_power,type='l',xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()


