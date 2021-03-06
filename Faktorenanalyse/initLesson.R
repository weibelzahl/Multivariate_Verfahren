# swirl-Motivations-Nachrichten unterdrücken
options(swirl_is_fun = FALSE)
options(swirl_language = "german_formal")

# Prohibit warnings messages inside swirl, change encoding to "UTF-8" for german Umlaut
options(warn=-1)
if(file.exists(file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Faktorenanalyse", "09_FABA.sav"))){
  daten <- read_sav(file =
                      file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Faktorenanalyse", "09_FABA.sav"))
}else if(!is.integer(try(download.file("http://www.google.de", tempfile(), quiet = TRUE), silent = TRUE))){
  stop("Dieses Tutorial benötigt eine funktionierende Internet-Verbindung. Bitte überprüfen Sie Ihre Verbindung!")
}else{
  require("haven")
  # SPSS-Daten von einer URL einlesen - Warnung kann ignoriert werden. Die Daten werden als Daten-Frame gespeichert.

  daten <- read_sav(file =
    "https://www3.hogrefe.de/fileadmin/redakteure/hogrefe_de/Psychlehrbuchplus/Multivariate_Verfahren/09_Faktorenanalyse/FABA.sav")
  # Den Objekten des Datensatzes als Namen die Variablen-Labels der SPSS Daten geben
#  names(daten) <- attributes(daten)$variable.labels  
}
#options(warn=0)
