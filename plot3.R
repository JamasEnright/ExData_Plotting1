plot<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",
                 stringsAsFactors=FALSE,nrows=3)

plot3<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",skip=66636,nrows=2880,
                  stringsAsFactors=FALSE)
names(plot3)<-names(plot)

plot3$datetime<-strptime(paste(plot3$Date,plot3$Time),format="%d/%m/%Y %H:%M:%S")

png(file="plot3.png",width=480,height=480,unit="px")
plot(plot3$datetime,plot3$Sub_metering_1,col="black",xlab="",type="l",
     ylab="Energy Sub Metering",main="")
lines(plot3$datetime,plot3$Sub_metering_2,col="red")
lines(plot3$datetime,plot3$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.off()
