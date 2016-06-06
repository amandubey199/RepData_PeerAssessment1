str(datosnuevos)
datosnuevos$date <- as.Date(datosnuevos$date, "%Y-%m-%d")
datosnuevos$day <- weekdays(datosnuevos$date)
datosnuevos$tipodia <- c("weekday")
for (i in 1:nrow(datosnuevos)){
  if (datosnuevos$day[i] == "Saturday" || datosnuevos$day[i] == "Sunday"){
    datosnuevos$tipodia[i] <- "weekend"
  }
}
datosnuevos$tipodia <- as.factor(datosnuevos$tipodia)
semana_o_finde <- aggregate(steps ~ interval+tipodia, datosnuevos, mean)
qplot(interval, steps, data=semana_o_finde, geom=c("line"), xlab="5-min intervals", 
      ylab="steps mean", main="") + facet_wrap(~ tipodia, ncol=1)