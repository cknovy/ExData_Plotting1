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

pl2$datetime <- as.POSIXct(strptime(paste(pl2$Date, pl2$Time, sep = " "), format = "%Y-m-%d %H:%M:%S"))
png(file = file.path("..","plots", "plot2.png"))
plot(pl2$datetime, pl2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowats)")
dev.off()
