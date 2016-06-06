seriedetiempo <- aggregate(steps ~ interval, data = activity, FUN = mean)
plot(seriedetiempo, type = "l", axes = F, xlab = "Time of the day", 
     ylab = "Average across all days provided a time", main = "Average number of steps taken", 
     col = "red")
axis(1,at=c(seq(0,2400,100),835), label = paste(c(seq(0,24,1),8),c(rep(":00",25),":40"),sep=""), pos = 0)
axis(2, at=c(seq(0,210,30),206.2), label = c(seq(0,210,30),206.2), pos = 0)
maximo <- which.max(seriedetiempo$steps)
segments(832, 0, 832, 206.2, col = "blue", lty = "dashed")
text(835,200, "max average of steps: (832,206.2)", col = "blue", adj = c(-.1, -.1))
segments(0, 206.2, 832, 206.2, col = "blue", lty = "dashed")
seriedetiempo [maximo, ]
#which.max(seriedetiempo$steps)/12
paste(835, "is equivalent to 8.667 hours, this gives the maximum is reached at 8:40 am")