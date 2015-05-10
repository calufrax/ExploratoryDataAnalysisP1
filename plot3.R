#load main table, for the moment, all as char
HPC<- read.table("household_power_consumption.txt", sep=";", quote="\"",header=TRUE, as.is=TRUE)
#subset
PC<-HPC[HPC[,1]=="1/2/2007"|HPC[,1]=="2/2/2007",]
# convert cols 3:9 to numeric - not elegant, but encountering errors, this seems to work
PC[,7]<-as.numeric(PC[,7])
PC[,8]<-as.numeric(PC[,8])
PC[,9]<-as.numeric(PC[,9])

convDate<-strptime(PC[,1],format="%d/%m/%Y")
datesPower <- paste(convDate,PC[,2])
temp<-strftime(datesPower,format="%Y-%m-%d %H:%M:%S",tz="",usetz=FALSE)
temp<-as.POSIXct(temp)

png(file="plot3.png")
plot(temp,PC$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",ylim=c(0.0,40.0),col='black')
par(new=T)
plot(temp,PC$Sub_metering_2,type="l",ylab="",xlab="",axes=FALSE,ylim=c(0.0,40.0),col='red')
par(new=T)
plot(temp,PC$Sub_metering_3,type="l",ylab="",xlab="",axes=FALSE,ylim=c(0.0,40.0),col='blue')
legend(as.POSIXct("2007-02-02  7:00:00"),39,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"))
par(new=F)
dev.off()


