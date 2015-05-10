#load main table, for the moment, all as char
HPC<- read.table("household_power_consumption.txt", sep=";", quote="\"",header=TRUE, as.is=TRUE)
#subset
PC<-HPC[HPC[,1]=="1/2/2007"|HPC[,1]=="2/2/2007",]
# convert column 3 to numeric - not elegant, but encountering errors, this seems to work
PC[,3]<-as.numeric(PC[,3])

png(file="plot1.png")
hist(PC$Global_active_power,main=paste("Global Active Power"),xlab="Global Active Power (kilowatts)",col="RED")
dev.off()

