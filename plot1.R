plot1<-function()
{
    #read data, subset & format time & date
    allData<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
    data<-subset(allData, Date == "1/2/2007" | Date == "2/2/2007")
    data$Time <- format(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
    data$Date<-as.Date(data$Date,format="%d/%m/%Y")
    
    #open png
    png(filename="plot1.png",width=480,height=480,units="px")
    
    #create histogram
    hist(data$Global_active_power, 
         col="red", 
         xlab="Global Active Power (kilowatts)", 
         ylab = "Frequency", 
         main="Global Active Power")
    
    #close png
    dev.off()
}