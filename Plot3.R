

##Time series plot of energy usage across various sections of the house.

##Sub_metering_1 corresponds to the kitchen, containing of mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
##Sub_metering_2 corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. 
##Sub_metering_3 corresponds to an electric water-heater and an air-conditioner.
##All measurements reflect watt-hour of active energy.

source("load_data.R")

plot3 <- function(data=NULL) {
    if(is.null(data))
        data <- load_data()

    png("plot3.png", width=480, height=480)

    plot(data$Time, data$Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")
    lines(data$Time, data$Sub_metering_2, col="red")
    lines(data$Time, data$Sub_metering_3, col="blue")
    legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1)

    dev.off()
}
