# swirl-Motivations-Nachrichten unterdrücken
options(swirl_is_fun = FALSE)

# clear workspace
rm(list = ls())

if("foreign" %in% rownames(installed.packages()) == FALSE) {
  print("Installing package: foreign")
  install.packages("foreign")
}
library("foreign")

# SPSS-Daten von einer URL einlesen - Warnung kann ignoriert werden. Die Daten werden als Daten-Frame gespeichert.
options(warn = -1)
if(file.exists("PFH_Course")){
  daten <- read.spss(
    "PFH_Course/7_Zeitreihenanalyse/07_Schach.sav",
    to.data.frame = TRUE,
    max.value.labels = Inf, 
    trim.factor.names = FALSE)
  daten <- daten$hf
}else if(!is.integer(try(download.file("http://www.google.de", tempfile(), quiet = TRUE), silent = TRUE))){
  stop("Dieses Tutorial benoetigt eine funktionierende Internet-Verbindung. Bitte ueberpruefen Sie Ihre Verbindung!")
}else{
  # , encoding = "UTF-8"))
  #, encoding = "native.enc"
  daten <- read.spss(
    "http://www.hogrefe.de/fileadmin/redakteure/hogrefe_de/Psychlehrbuchplus/Multivariate_Verfahren/07_Zeitreihenanalyse/Schach.sav",
    to.data.frame = TRUE,
    max.value.labels = Inf, 
    trim.factor.names = FALSE) 
  daten <- daten$hf
}  
# Den Objekten des Datensatzes als Namen die Variablen-Labels der SPSS Daten geben
names(daten) <- attributes(daten)$variable.labels  
#options(warn=0)