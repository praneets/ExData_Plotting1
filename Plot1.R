fileUrl<-"https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(fileUrl, destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip", files="household_power_consumption.txt")
data1 <- read.table("household_power_consumption.txt",header = TRUE, sep=";");
datasub1 <- subset(data1, as.Date(Date,"%d/%m/%Y")==as.Date("02/01/2007","%m/%d/%Y")|as.Date(Date,"%d/%m/%Y")==as.Date("02/02/2007","%m/%d/%Y"));
png(file="Plot1.png",width=480,height=480)
hist(as.numeric(as.character(datasub1[,3])),xlab="Global Active Power (kilowatts)",ylab="Frequency",col="Red",main="Global Active Power")
dev.off()
