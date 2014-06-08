plot2<-function()
{
    #read data, subset & format time & date
    allData<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
    data<-subset(allData, Date == "1/2/2007" | Date == "2/2/2007")
    data$Time <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
    data$Date<-as.Date(data$Date,format="%d/%m/%Y")
    
    #open png
    png(filename="plot2.png",width=480,height=480,units="px")
    
    #create graph
    plot(data$Time,data$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
    lines(data$Time,data$Global_active_power)
    
    #close png
    dev.off()
}