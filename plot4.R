## load data into table
##meas_tbl <- read.table(".\\household_power_consumption.txt", header = T,sep =";")
## subset data ("1/2/2007","2/2/2007" measurements)
##measFlt_Tbl <-meas_tbl[which(meas_tbl$Date %in% c("1/2/2007","2/2/2007")), ]
## create a standard Date column (from Date Time columns)
##measFlt_Tbl <- measFlt_Tbl%>% mutate(dateTime = strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"))
## convert the Sub_metering 1-2-3, Global active, reactive power values to numeric
measFlt_Tbl$Sub_metering_1 <- as.numeric(measFlt_Tbl$Sub_metering_1)
measFlt_Tbl$Sub_metering_2 <- as.numeric(measFlt_Tbl$Sub_metering_2)
measFlt_Tbl$Sub_metering_3 <- as.numeric(measFlt_Tbl$Sub_metering_3)
measFlt_Tbl$Global_active_power <- as.numeric(measFlt_Tbl$Global_active_power)
measFlt_Tbl$Global_reactive_power <- as.numeric(measFlt_Tbl$Global_reactive_power)
## Plot the histogram to plot4.png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(measFlt_Tbl$dateTime, measFlt_Tbl$Global_active_power,xlab ="" , 
     ylab = "Global Active Power (kilowatts)", type = "l")

plot(measFlt_Tbl$dateTime, measFlt_Tbl$Voltage,xlab ="datetime" , 
     ylab = "Voltage", type = "l")

plot(measFlt_Tbl$dateTime, measFlt_Tbl$Sub_metering_1,xlab ="" , 
     ylab = "Energy sub metering", type = "l")
lines(measFlt_Tbl$dateTime,measFlt_Tbl$Sub_metering_2, col= "red",type = "l" )
lines(measFlt_Tbl$dateTime,measFlt_Tbl$Sub_metering_3, col= "blue",type = "l" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),lty = 1, lwd = 2.5, bty = "n")

plot(measFlt_Tbl$dateTime, measFlt_Tbl$Global_reactive_power, xlab ="datetime" , 
     ylab = "Global_reactive_power" , type = "l")

dev.off()
