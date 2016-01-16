fileUrl<-"https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(fileUrl, destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip", files="household_power_consumption.txt")
data1 <- read.table("household_power_consumption.txt",header = TRUE, sep=";");
datasub1 <- subset(data1, as.Date(Date,"%d/%m/%Y")==as.Date("01/02/2007","%d/%m/%Y")|as.Date(Date,"%d/%m/%Y")==as.Date("02/02/2007","%d/%m/%Y"));
png(file="Plot3.png",width=480,height=480)
plot(strptime(paste(datasub1[,1],datasub1[,2]),format="%d/%m/%Y %H:%M:%S"),as.numeric(datasub1[,7]),type="l",xlab="",ylab="Energy sub metering",ylim=c(0, 35))
par(new=T)
plot(strptime(paste(datasub1[,1],datasub1[,2]),format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(datasub1[,8])),type="l",xlab="",ylab="Energy sub Metering",axes=F,col="Red",ylim=c(0,35))
par(new=T)
plot(strptime(paste(datasub1[,1],datasub1[,2]),format="%d/%m/%Y %H:%M:%S"),as.numeric(datasub1[,9]),type="l",xlab="",ylab="Energy sub Metering",col="Blue",axes=F,ylim=c(0,35))
legend("topright",lty=1,lwd=2,col=c("black","red","blue"),legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))
dev.off()