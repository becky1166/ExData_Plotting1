plot4<-function()
{
    #read data, subset & format time & date
    allData<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
    data<-subset(allData, Date == "1/2/2007" | Date == "2/2/2007")
    data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
    data$Date<-as.Date(data$Date,format="%d/%m/%Y")
    
    #open png
    png(filename="plot4.png",width=480,height=480,units="px")
    
    #tell it to do 4 plots
    par(mfcol = c(2,2))
    
    
    #create top left graph
    plot(data$Time,data$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
    lines(data$Time,data$Global_active_power)
    
    #create bottom left graph
    plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    lines(data$Time,data$Sub_metering_1,col="black")
    lines(data$Time,data$Sub_metering_2,col="red")
    lines(data$Time,data$Sub_metering_3,col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red","blue"), lty = c(1, 1, 1))
    
    #create top right graph
    plot(data$Time,data$Voltage,type="l",xlab = "datetime",ylab="Voltage")
    
    #create bottom right graph
    plot(data$Time,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
    
    #close png
    dev.off()
}