plot<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",
                 stringsAsFactors=FALSE,nrows=3)

plot4<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",skip=66636,nrows=2880,
                  stringsAsFactors=FALSE)
names(plot4)<-names(plot)

plot4$datetime<-strptime(paste(plot4$Date,plot4$Time),format="%d/%m/%Y %H:%M:%S")


png(file="plot4.png",width=480,height=480,unit="px")
par(mfrow=c(2,2))
plot(plot4$datetime,plot4$Global_active_power,col="black",xlab="",type="l",
     ylab="Global Active Power",main="")

plot(plot4$datetime,plot4$Voltage,col="black",xlab="datetime",type="l",
     ylab="Voltage",main="")

plot(plot4$datetime,plot4$Sub_metering_1,col="black",xlab="",type="l",
     ylab="Energy Sub Metering",main="")
lines(plot4$datetime,plot4$Sub_metering_2,col="red")
lines(plot4$datetime,plot4$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),
       bty="n")

plot(plot4$datetime,plot4$Global_reactive_power,col="black",xlab="datetime",type="l",
     ylab="Global_reactive_power",main="")
dev.off()
