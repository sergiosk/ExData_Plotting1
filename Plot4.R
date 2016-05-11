library(datasets)
txtFile <- "./lesson3/household_power_consumption.txt"
data <- read.table(txtFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
str(data)
SubSet<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

voltage <- as.numeric(SubSet$Voltage)
global_Active_Power<-as.numeric(SubSet$Global_active_power)
global_Reactive_Power<-as.numeric(SubSet$Global_reactive_power)
Sub_Matering1<-as.numeric(SubSet$Sub_metering_1)
Sub_Matering2<-as.numeric(SubSet$Sub_metering_2)
Sub_Matering3<-as.numeric(SubSet$Sub_metering_3)

weekday <- strptime(paste(SubSet$Date, SubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


png("plot4.png",width=480, height=480)
par(mfrow = c(2, 2)) 

##Graph1 
plot(weekday, global_Active_Power, type="l", xlab="", ylab="Global Active Power")

##Graph2
plot(weekday, voltage, type="l", xlab="datetime", ylab="Voltage")

##Graph3
plot(weekday,Sub_Matering1,type="l", ylab="Energy Submetering", xlab="")
lines(weekday, Sub_Matering2, type="l", col="red")
lines(weekday, Sub_Matering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

##Graph4
plot(weekday, global_Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()



