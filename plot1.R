d1<-subset(data,Date=="1/2/2007")
d2<-subset(data,Date=="2/2/2007")
data_feb<-rbind(d1,d2)
data_feb$date_time<-paste(data_feb$Date,data_feb$Time)
data_feb$date_time<-strptime(data_feb$date_time,"%d/%m/%Y %T")
data_feb$Date<-NULL
data_feb$Time<-NULL
data_feb_f<-cbind(date_time,data_feb)

##1
hist(data_feb$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.copy(png,"plot1.png")
dev.off()


