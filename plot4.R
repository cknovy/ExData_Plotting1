setwd("~/Classes/R/EDA/ExData_Plotting1/code")
hpc <-
  read.table(
    "../data/household_power_consumption.txt",
    header = T,
    sep = ";",
    na.strings = "?"
  )

hpc <- data.frame(hpc)
hpc$datetime <- paste(as.character(hpc$Date) , as.character(hpc$Time), sep = " ")
hpc$datetime <- strptime(hpc$datetime, format = "%d/%m/%Y %H:%M:%S")

pl2 <- hpc[hpc$datetime >= "2007-02-01" & hpc$datetime <= "2007-02-03",]
pl2 <- pl2[!is.na(pl2),]

png(file = file.path("..","plots", "plot4.png"))

par(mfrow = c(2, 2)) 

plot(pl2$datetime, pl2$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(pl2$datetime, pl2$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(pl2$datetime, pl2$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(pl2$datetime, pl2$Sub_metering_2, type="l", col="red")
lines(pl2$datetime, pl2$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(pl2$datetime, pl2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()