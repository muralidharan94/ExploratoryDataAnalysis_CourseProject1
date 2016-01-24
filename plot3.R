##Code for reading and subsetting the required data
data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
d1<-subset(data,Date=="1/2/2007")
d2<-subset(data,Date=="2/2/2007")
data_feb<-rbind(d1,d2)
data_feb$date_time<-paste(data_feb$Date,data_feb$Time)
data_feb$date_time<-strptime(data_feb$date_time,"%d/%m/%Y %T")
data_feb$Date<-NULL
data_feb$Time<-NULL
data_feb_f<-cbind(date_time,data_feb)



##Plot 3 Code
pch(mar=c(6,6,6,6))
plot(data_feb$date_time,data_feb$Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering")
lines(data_feb$date_time,data_feb$Sub_metering_1,col="black")
lines(data_feb$date_time,data_feb$Sub_metering_2,col="red")
lines(data_feb$date_time,data_feb$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),col=c("black","red","blue"),lwd=0)
dev.copy(png,"plot3.png")
dev.off()

