plot<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",
                  stringsAsFactors=FALSE,nrows=3)

plot1<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",skip=66636,nrows=2880,
                  stringsAsFactors=FALSE)
names(plot1)<-names(plot)

plot1$datetime<-strptime(paste(plot1$Date,plot1$Time),format="%d/%m/%Y %H:%M:%S")

hist(plot1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     ylab="Frequency",main="Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480,unit="px")
dev.off()
