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

png(file = file.path("..","plots", "plot3.png"))

plot(x = pl2$datetime, y = pl2$Sub_metering_1, type="l", ylab = "Energy Sub Metering", xlab="")
lines(x = pl2$datetime, y = pl2$Sub_metering_2, col = "red")
lines(x = pl2$datetime, y = pl2$Sub_metering_3, col = "blue")

dev.off()