setwd("~/Classes/R/EDA/ExData_Plotting1/code")
hpc <-
  read.table(
    "../data/household_power_consumption.txt",
    header = T,
    sep = ";",
    na.strings = "?"
  )
hpc <- data.frame(hpc)

hpc$Date <- strptime(hpc$Date, format = "%d/%m/%Y")
png(file = file.path("..","plots", "plot1.png"))
plot1 <- hist(
  hpc$Global_active_power,
  col = "red",
  freq = T,
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)")

dev.off()
savePlot("plot1", type = "png", device = dev.cur(),restoreConsole = T)
