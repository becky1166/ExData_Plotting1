plot4<-function()
{
    #read data, subset & format time & date
    allData<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
    data<-subset(allData, Date == "1/2/2007" | Date == "2/2/2007")
    data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
    data$Date<-as.Date(data$Date,format="%d/%m/%Y")
    
    #open png
    png(filename="plot3.png",width=480,height=480,units="px")
    
    #create graph
    plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    lines(data$Time,data$Sub_metering_1,col="black")
    lines(data$Time,data$Sub_metering_2,col="red")
    lines(data$Time,data$Sub_metering_3,col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"), lty = c(1, 1, 1))
    
    #close png
    dev.off()
}