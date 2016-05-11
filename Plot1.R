library(datasets)
txtFile <- "./lesson3/household_power_consumption.txt"
data <- read.table(txtFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
str(data)
SubSet<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


global_Active_Power<-as.numeric(SubSet$Global_active_power)
png("plot1.png",width=480, height=480)
hist(global_Active_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



