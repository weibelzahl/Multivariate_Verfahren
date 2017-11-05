# swirl-Motivations-Nachrichten unterdrücken
options(swirl_is_fun = FALSE)
options(swirl_language = "german_formal")


# SPSS-Daten von einer URL einlesen - Warnung kann ignoriert werden. Die Daten werden als Daten-Frame gespeichert.
if(file.exists(file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Logistische_Regression", "05_Depression.sav"))){
  daten <- read_sav(file = 
    file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Logistische_Regression", "05_Depression.sav"))
}else if(!is.integer(try(download.file("http://www.google.de", tempfile(), quiet = TRUE), silent = TRUE))){
  stop("Dieses Tutorial benötigt eine funktionierende Internet-Verbindung. Bitte überprüfen Sie Ihre Verbindung!")
}else{
  options(warn=-1)
  require("haven")
  daten <- read_sav(file = 
    "https://www3.hogrefe.de/fileadmin/redakteure/hogrefe_de/Psychlehrbuchplus/Multivariate_Verfahren/05_Logistische_Regression/Depression.sav")
  # Den Objekten des Datensatzes als Namen die Variablen-Labels der SPSS Daten geben
}  
#options(warn=0)