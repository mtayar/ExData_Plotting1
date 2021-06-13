## load data into table
##meas_tbl <- read.table(".\\household_power_consumption.txt", header = T,sep =";")
## subset data ("1/2/2007","2/2/2007" measurements)
##measFlt_Tbl <-meas_tbl[which(meas_tbl$Date %in% c("1/2/2007","2/2/2007")), ]
## create a standard Date column (from Date Time columns)
##measFlt_Tbl <- measFlt_Tbl%>% mutate(dateTime = strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S"))
## convert the Global_active_power values to numeric
measFlt_Tbl$Global_active_power <- as.numeric(measFlt_Tbl$Global_active_power)

## Plot the histogram to plot2.png
png("plot2.png", width = 480, height = 480)
plot(measFlt_Tbl$dateTime, measFlt_Tbl$Global_active_power,xlab ="" , 
     ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
