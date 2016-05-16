# swirl-Motivations-Nachrichten unterdrücken
options(swirl_is_fun = FALSE)
options(swirl_language = "german")

# clear workspace
rm(list = ls())

# SPSS-Daten von einer URL einlesen - Warnung kann ignoriert werden. Die Daten werden als Daten-Frame gespeichert.
options(warn = -1)
if(file.exists(file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Zeitreihenanalyse", "07_Schach.sav"))){
  daten <- read.spss(
    file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Zeitreihenanalyse", "07_Schach.sav"),
    to.data.frame = TRUE,
    max.value.labels = Inf, 
    trim.factor.names = FALSE)
  daten <- daten$hf
}else if(!is.integer(try(download.file("http://www.google.de", tempfile(), quiet = TRUE), silent = TRUE))){
  stop("Dieses Tutorial benötigt eine funktionierende Internet-Verbindung. Bitte überprüfen Sie Ihre Verbindung!")
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