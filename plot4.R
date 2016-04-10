hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)

plot_dates <- c("1/2/2007", "2/2/2007")
df_plot4 <- hpc[hpc$Date == plot_dates[1] | hpc$Date == plot_dates[2],]
dates <- df_plot4$Date
times <- df_plot4$Time
dates_times <- paste(dates, times)
df_plot4$Time <- strptime(dates_times, "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2), mar=c(4,4,2,1))

plot(df_plot4$Time, df_plot4$Global_active_power, type="l", xlab= "", ylab="Global Active Power")

plot(df_plot4$Time, df_plot4$Voltage, type="l", xlab= "datetime", ylab="Voltage")

plot(df_plot4$Time, df_plot4$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df_plot4$Time, df_plot4$Sub_metering_2, col = "red")
lines(df_plot4$Time, df_plot4$Sub_metering_3, col = "blue")
t1 <- colnames(df_plot4)[[7]]
t2 <- colnames(df_plot4)[[8]]
t3 <- colnames(df_plot4)[[9]]
legend("topright", cex=0.50, bty="n", title="", c(t1, t2, t3), lty=c(1,1), col=c("black","red","blue"))

plot(df_plot4$Time, df_plot4$Global_reactive_power, type="l", xlab= "datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480, units="px") 
dev.off()