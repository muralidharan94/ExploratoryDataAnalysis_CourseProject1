
##Code for reading data
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
d1<-subset(data,Date=="1/2/2007")
d2<-subset(data,Date=="2/2/2007")
data_feb<-rbind(d1,d2)
data_feb$date_time<-paste(data_feb$Date,data_feb$Time)
data_feb$date_time<-strptime(data_feb$date_time,"%d/%m/%Y %T")
data_feb$Date<-NULL
data_feb$Time<-NULL
data_feb_f<-cbind(date_time,data_feb)




##Upfated Plot 4
par(mfrow=c(2,2))
plot(data_feb$date_time,data_feb$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(data_feb$date_time,data_feb$Global_active_power)

plot(data_feb$date_time,data_feb$Voltage,type="n",xlab="datetime",ylab="voltage")
lines(data_feb$date_time,data_feb$Voltage)


plot(data_feb$date_time,data_feb$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",mar=c(4,4,6,6))
lines(data_feb$date_time,data_feb$Sub_metering_1,col="black")
lines(data_feb$date_time,data_feb$Sub_metering_2,col="red")
lines(data_feb$date_time,data_feb$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),col=c("black","red","blue"),lwd=0,bty="n")


plot(data_feb$date_time,data_feb$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(data_feb$date_time,data_feb$Global_reactive_power)
dev.copy(png,"plot4.png")
dev.off()

