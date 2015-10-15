# swirl-Motivations-Nachrichten unterdrücken
options(swirl_is_fun = FALSE)

if("foreign" %in% rownames(installed.packages()) == FALSE) {
  print("Installing package: foreign")
  install.packages("foreign")
}
library("foreign")

if("psych" %in% rownames(installed.packages()) == FALSE) {
  print("Installing package: psych")
  install.packages("psych")
}
library("psych")

if("GPArotation" %in% rownames(installed.packages()) == FALSE) {
  print("Installing package: GPArotation")
  install.packages("GPArotation")
}
library("GPArotation")

# Prohibit warnings messages inside swirl, change encoding to "UTF-8" for german Umlaut
options(warn=-1)
if(file.exists(file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Faktorenanalyse", "09_FABA.sav"))){
  daten <- read.spss(
    file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Faktorenanalyse", "09_FABA.sav"),
    to.data.frame = TRUE,
    max.value.labels = Inf, 
    trim.factor.names = FALSE)
}else if(!is.integer(try(download.file("http://www.google.de", tempfile(), quiet = TRUE), silent = TRUE))){
  stop("Dieses Tutorial benoetigt eine funktionierende Internet-Verbindung. Bitte ueberpruefen Sie Ihre Verbindung!")
}else{
  require("foreign")
  # SPSS-Daten von einer URL einlesen - Warnung kann ignoriert werden. Die Daten werden als Daten-Frame gespeichert.

  daten <- read.spss(
    "http://www.hogrefe.de/fileadmin/redakteure/hogrefe_de/Psychlehrbuchplus/Multivariate_Verfahren/09_Faktorenanalyse/FABA.sav",
    to.data.frame = TRUE,
    max.value.labels = Inf, 
    trim.factor.names = FALSE)
  # Den Objekten des Datensatzes als Namen die Variablen-Labels der SPSS Daten geben
  names(daten) <- attributes(daten)$variable.labels  
}
#options(warn=0)


  

