hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)

plot3_dates <- c("1/2/2007", "2/2/2007")
df_plot3 <- hpc[hpc$Date == plot3_dates[1] | hpc$Date == plot3_dates[2],]
dates <- df_plot3$Date
times <- df_plot3$Time
dates_times <- paste(dates, times)
df_plot3$Time <- strptime(dates_times, "%d/%m/%Y %H:%M:%S")

plot(df_plot3$Time, df_plot3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df_plot3$Time, df_plot3$Sub_metering_2, col = "red")
lines(df_plot3$Time, df_plot3$Sub_metering_3, col = "blue")
t1 <- colnames(df_plot3)[[7]]
t2 <- colnames(df_plot3)[[8]]
t3 <- colnames(df_plot3)[[9]]

legend("topright", cex=0.75, legend = c(t1, t2, t3), lty=c(1,1), col=c("black","red","blue"))

dev.copy(png, file="plot3.png", width=480, height=480, units="px") 
dev.off()