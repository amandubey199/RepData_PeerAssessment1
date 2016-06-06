paste("missing observations:", sum(is.na(activity$steps)))

"missing observations can be replaced with the sample mean instead of replacing them by zero (the 1st won't bias the estimates while the 2nd will)"

datosnuevos <- activity
datosnuevos[is.na(activity$steps), ]$steps <- mean(activity$steps)

datosnuevos$fechayhora <- as.POSIXct(with(datosnuevos, paste(date, paste(interval %/% 100, interval %% 100, sep=":"))),
                                     format="%Y-%m-%d %H:%M",tz="")

pasospordia2 <- setNames(aggregate(steps~as.Date(date), datosnuevos, sum, na.rm = TRUE), c("date","steps"))

xaxis <- seq(1, nrow(pasospordia2), by = 6)

okscale2 <- list(x = list(rot = 45, cex = 1.0, labels = format(pasospordia2$date, "%d-%b-%Y")[xaxis], at = xaxis))

barchart(date ~ steps, data = pasospordia2, main = "steps per day", ylab = "steps", xlab = "date", scales = okscale2, horizontal = F)

paste("mean:", mean(pasospordia2$steps))
paste("median:", median(pasospordia2$steps))

paste("means difference:", mean(pasospordia2$steps)-mean(pasospordia$steps))
paste("medians difference:", median(pasospordia2$steps)-median(pasospordia$steps))