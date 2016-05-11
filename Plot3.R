library(datasets)
txtFile <- "./lesson3/household_power_consumption.txt"
data <- read.table(txtFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
str(data)
SubSet<-data[data$Date %in% c("1/2/2007","2/2/2007"),]



Sub_Matering1<-as.numeric(SubSet$Sub_metering_1)
Sub_Matering2<-as.numeric(SubSet$Sub_metering_2)
Sub_Matering3<-as.numeric(SubSet$Sub_metering_3)

weekday <- strptime(paste(SubSet$Date, SubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


png("plot2.png",width=480, height=480)
plot(weekday, global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



