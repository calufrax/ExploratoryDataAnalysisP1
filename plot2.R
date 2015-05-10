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

png(file="plot2.png")
plot(temp,PC$Global_active_power,type="l",col='black',ylab="Global Active Power(kilowatts)",xlab="")
dev.off()

