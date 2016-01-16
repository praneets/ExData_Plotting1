fileUrl<-"https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(fileUrl, destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip", files="household_power_consumption.txt")
data1 <- read.table("household_power_consumption.txt",header = TRUE, sep=";");
datasub1 <- subset(data1, as.Date(Date,"%d/%m/%Y")==as.Date("01/02/2007","%d/%m/%Y")|as.Date(Date,"%d/%m/%Y")==as.Date("02/02/2007","%d/%m/%Y"));
png(file="Plot2.png",width=480,height=480)
plot(strptime(paste(datasub1[,1],datasub1[,2]),format="%d/%m/%Y %H:%M:%S"),as.numeric(as.character(datasub1[,3])),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

