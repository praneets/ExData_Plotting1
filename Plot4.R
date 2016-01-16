data1 <- read.table("household_power_consumption.txt",header = TRUE, sep=";");
datasub1 <- subset(data1, as.Date(Date,"%d/%m/%Y")==as.Date("01/02/2007","%d/%m/%Y")|as.Date(Date,"%d/%m/%Y")==as.Date("02/02/2007","%d/%m/%Y"));
png(file="Plot4.png",width=480,height=480)
par(mfcol=c(2,2))
plot(strptime(paste(datasub1[,1],datasub1[,2]),format="%d/%m/%Y %H:%M:%S"),as.numeric(datasub1[,3])/1000,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(strptime(paste(datasub1[,1],datasub1[,2]),format="%d/%m/%Y %H:%M:%S"),as.numeric(datasub1[,7]),type="l",xlab="",ylab="Energy sub metering",ylim=c(0, 35))
par(new=T)
plot(strptime(paste(datasub1[,1],datasub1[,2]),format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(datasub1[,8])),type="l",xlab="",ylab="Energy sub Metering",axes=F,col="Red",ylim=c(0,35))
par(new=T)
plot(strptime(paste(datasub1[,1],datasub1[,2]),format="%d/%m/%Y %H:%M:%S"),as.numeric(datasub1[,9]),type="l",xlab="",ylab="Energy sub Metering",col="Blue",axes=F,ylim=c(0,35))
legend("topright",lty=1,lwd=2,col=c("black","red","blue"),legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

plot(strptime(paste(datasub1[,1],datasub1[,2]),format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(datasub1[,5])),type="l",xlab="datetime",ylab="Voltage")
plot(strptime(paste(datasub1[,1],datasub1[,2]),format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(datasub1[,4])),type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
