# swirl-Motivations-Nachrichten unterdrücken
options(swirl_is_fun = FALSE)
options(swirl_language = "german")

# SPSS-Daten von einer URL einlesen - Warnung kann ignoriert werden. Die Daten werden als Daten-Frame gespeichert.
options(warn=-1)
if(file.exists(file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Diskriminanzanalyse", "04_Bruecken_in_Arbeit.sav"))){
  daten <- read.spss(
    file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Diskriminanzanalyse", "04_Bruecken_in_Arbeit.sav"),
    to.data.frame = TRUE,
    max.value.labels = Inf, 
    trim.factor.names = FALSE)
}else if(!is.integer(try(download.file("http://www.google.de", tempfile(), quiet = TRUE), silent = TRUE))){
  stop("Dieses Tutorial benötigt eine funktionierende Internet-Verbindung. Bitte überprüfen Sie Ihre Verbindung!")
}else{
  daten <- read.spss(
    "http://www.hogrefe.de/fileadmin/redakteure/hogrefe_de/Psychlehrbuchplus/Multivariate_Verfahren/04_Diskriminanzanalyse/Bruecken_in_Arbeit.sav",
    to.data.frame = TRUE,
    max.value.labels = Inf, 
    trim.factor.names = FALSE)
}
# Den Objekten des Datensatzes als Namen die Variablen-Labels der SPSS Daten geben
#names(daten) <- attributes(daten)$variable.labels  
#options(warn=0)
