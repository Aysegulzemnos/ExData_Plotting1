source("load_data.R")

plot4 <- function(data=NULL) {
    if(is.null(data))
        data <- load_data()

    png("plot4.png", width=480, height=480)

##Time series plots of global active power, global reactive power, voltage and sub_metering
## Split the device into four plotting regions
    par(mfrow=c(2,2))
  
    ## Create plots and send to file
    ## Create the 'Global Active Power' vs 'Time' plot
    
    plot(data$Time, data$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power")
    
    ## Create the 'Voltage' vs 'Time' plot
      plot(data$Time, data$Voltage, type="l",
         xlab="datetime", ylab="Voltage")
    
    ## Create the 'Energy sub metering' vs 'Time' plot
    plot(data$Time, data$Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")
    lines(data$Time, data$Sub_metering_2, col="red")
    lines(data$Time, data$Sub_metering_3, col="blue")
    legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1,
           box.lwd=0)
    
    ## Create the 'Global_reactive_power' vs 'Time' plot
    
    plot(data$Time, data$Global_reactive_power, type="n",
         xlab="datetime", ylab="Global_reactive_power")
    lines(data$Time, data$Global_reactive_power)
    
    dev.off()

}
