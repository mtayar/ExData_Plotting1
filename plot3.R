## load data into table
##meas_tbl <- read.table(".\\household_power_consumption.txt", header = T,sep =";")
## subset data ("1/2/2007","2/2/2007" measurements)
##measFlt_Tbl <-meas_tbl[which(meas_tbl$Date %in% c("1/2/2007","2/2/2007")), ]
## create a standard Date column (from Date Time columns)
##measFlt_Tbl <- measFlt_Tbl%>% mutate(dateTime = strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"))
## convert the Sub_metering 1-2-3 values to numeric
measFlt_Tbl$Sub_metering_1 <- as.numeric(measFlt_Tbl$Sub_metering_1)
measFlt_Tbl$Sub_metering_2 <- as.numeric(measFlt_Tbl$Sub_metering_2)
measFlt_Tbl$Sub_metering_3 <- as.numeric(measFlt_Tbl$Sub_metering_3)

## Plot the histogram to plot2.png
png("plot3.png", width = 480, height = 480)
plot(measFlt_Tbl$dateTime, measFlt_Tbl$Sub_metering_1,xlab ="" , 
     ylab = "Energy sub metering", type = "l")
lines(measFlt_Tbl$dateTime,measFlt_Tbl$Sub_metering_2, col= "red",type = "l" )
lines(measFlt_Tbl$dateTime,measFlt_Tbl$Sub_metering_3, col= "blue",type = "l" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"),lty = 1, lwd = 2.5, bty = "n")
dev.off()
