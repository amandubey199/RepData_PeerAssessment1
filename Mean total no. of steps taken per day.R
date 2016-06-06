activity$fechayhora <- as.POSIXct(with(activity, paste(date, paste(interval %/% 100, interval %% 100, sep=":"))),
                                  format="%Y-%m-%d %H:%M",tz="")

pasospordia <- setNames(aggregate(steps~as.Date(date), activity, sum, na.rm = TRUE), c("date","steps"))

xaxis <- seq(1, nrow(pasospordia), by = 6)

okscale <- list(x = list(rot = 45, cex = 1.0, labels = format(pasospordia$date, "%d-%b-%Y")[xaxis], at = xaxis))

barchart(date ~ steps, data = pasospordia, main = "steps per day", ylab = "steps", xlab = "date", scales = okscale, horizontal = F)

paste("mean:", mean(pasospordia$steps))
paste("median:", median(pasospordia$steps))