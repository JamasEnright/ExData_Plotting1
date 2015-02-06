plot<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",
                 stringsAsFactors=FALSE,nrows=3)

plot2<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",skip=66636,nrows=2880,
                  stringsAsFactors=FALSE)
names(plot2)<-names(plot)

plot2$datetime<-strptime(paste(plot2$Date,plot2$Time),format="%d/%m/%Y %H:%M:%S")

plot(plot2$datetime,plot2$Global_active_power,col="black",xlab="",type="l",
     ylab="Global Active Power (kilowatts)",main="")
dev.copy(png,file="plot2.png",width=480,height=480,unit="px")
dev.off()
