setwd("/Users/pacha/Documents/Coursera/tareas\ y\ controles/Reproducible\ Research/Course\ Project/")
source("ipak.R")
packages <- c("plyr", "lattice", "data.table", "httr", "ggplot2")
ipak(packages)

#EBImage is not available at CRAN and it is needed for plyr
#source("http://bioconductor.org/biocLite.R")
#biocLite("EBImage")

direccion <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
datos <- "datos"
if(!file.exists(datos)){
  dir.create(datos)
} 
graficos <- "graficos" 
if(!file.exists(graficos)){
  dir.create(graficos)
}
zip <- paste(getwd(), "/activity.zip", sep = "")
if(!file.exists(zip)){
  download.file(direccion, zip, method="curl", mode="wb")
}
archivo <- paste(getwd(), "/datos/activity.csv", sep = "")
if(!file.exists(archivo)){
  unzip(zip, list = FALSE, overwrite = FALSE, exdir = datos)
}

activity <- read.table(file = archivo, header = TRUE, sep = ",")