# swirl-Motivations-Nachrichten unterdrücken
options(swirl_is_fun = FALSE)

if("foreign" %in% rownames(installed.packages()) == FALSE) {
  print("Installing package: foreign")
  install.packages("foreign")
}
library("foreign")

if("ez" %in% rownames(installed.packages()) == FALSE) {
  print("Installing package: ez")
  install.packages("ez")
}
library("ez")

if("reshape2" %in% rownames(installed.packages()) == FALSE) {
  print("Installing package: reshape 2")
  install.packages("reshape2")
}
library("reshape2")


# SPSS-Daten von einer URL einlesen - Warnung kann ignoriert werden. Die Daten werden als Daten-Frame gespeichert.
options(warn=-1)
if(file.exists("PFH_Course")){
  daten <- read.spss(
    "PFH_Course/3_Varianzanalyse/03_Unfallopfer.sav",
    to.data.frame = TRUE,
    max.value.labels = Inf, 
    trim.factor.names = FALSE)
}else if(!is.integer(try(download.file("http://www.google.de", tempfile(), quiet = TRUE), silent = TRUE))){
  stop("Dieses Tutorial benoetigt eine funktionierende Internet-Verbindung. Bitte ueberpruefen Sie Ihre Verbindung!")
}else{  
  daten <- read.spss(
    "http://www.hogrefe.de/fileadmin/redakteure/hogrefe_de/Psychlehrbuchplus/Multivariate_Verfahren/03_Varianzanalyse/Unfallopfer.sav",
    to.data.frame = TRUE,
    max.value.labels = Inf, 
    trim.factor.names = FALSE)
}
# Den Objekten des Datensatzes als Namen die Variablen-Labels der SPSS Daten geben
#options(warn=0)
