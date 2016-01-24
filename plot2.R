d1<-subset(data,Date=="1/2/2007")
d2<-subset(data,Date=="2/2/2007")
data_feb<-rbind(d1,d2)
data_feb$date_time<-paste(data_feb$Date,data_feb$Time)
data_feb$date_time<-strptime(data_feb$date_time,"%d/%m/%Y %T")
data_feb$Date<-NULL
data_feb$Time<-NULL
data_feb_f<-cbind(date_time,data_feb)

##2
pch(mar=c(6,6,6,6))
plot(data_feb$date_time,data_feb$Global_active_power,type="n",ylab="Global Active Power(Kilowatts)",xlab="")
lines(data_feb$date_time,data_feb$Global_active_power)
dev.copy(png,"plot2.png")
dev.off()



