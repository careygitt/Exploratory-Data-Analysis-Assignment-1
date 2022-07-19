data_full<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",nrows=2075259,
                    check.names = FALSE,stringsAsFactors =FALSE,comment.char ="",quote = '\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date (data1$Date,format="%d/%m/%Y")
datetime<- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

par (mfrow=c(2,2),mar=c(4,4,2,1))
with(data1,{
  plot(Global_active_power~Datetime,type="l",ylab="GLobal Active Power",xlab="")
  plot(Voltage~Datetime,type="l", ylab="Voltage",xlab="")
  plot(Sub_metering_1~Datetime,type="l", ylab="Energy Sub Metering",xlab="")
  lines(Sub_metering_2~Datetime,type="l",col='Red')
  lines(Sub_metering_3~Datetime,type="l",col='Blue')
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,bty="n",col=c("black","red","blue"))
  plot(Global_reactive_power~Datetime,type="l",ylab="GLobal_ReActive_Power",xlab="")
})
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()
