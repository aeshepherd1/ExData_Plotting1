hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)

plot2_dates <- c("1/2/2007", "2/2/2007")
df_plot2 <- hpc[hpc$Date == plot2_dates[1] | hpc$Date == plot2_dates[2],]
dates <- df_plot2$Date
times <- df_plot2$Time
dates_times <- paste(dates, times)
df_plot2$Time <- strptime(dates_times, "%d/%m/%Y %H:%M:%S")

plot(df_plot2$Time, df_plot2$Global_active_power, type="l", xlab= "", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480, units="px") 
dev.off()