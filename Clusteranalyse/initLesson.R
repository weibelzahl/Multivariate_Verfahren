# swirl-Motivations-Nachrichten unterdrücken
options(swirl_is_fun = FALSE)
options(swirl_language = "german")

# SPSS-Daten von einer URL einlesen - Warnung kann ignoriert werden. Die Daten werden als Daten-Frame gespeichert.
options(warn=-1)
if(file.exists(file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Clusteranalyse", "08_Arbeitserleben.sav"))){
  daten <- read.spss(
    file.path(path.package("swirl"), "Courses","Multivariate_Verfahren", "Clusteranalyse", "08_Arbeitserleben.sav"),
    to.data.frame = TRUE,
    max.value.labels = Inf, 
    trim.factor.names = FALSE)
}else if(!is.integer(try(download.file("http://www.google.de", tempfile(), quiet = TRUE), silent = TRUE))){
  stop("Dieses Tutorial benötigt eine funktionierende Internet-Verbindung. Bitte überprüfen Sie Ihre Verbindung!")
}else{
  daten <- read.spss(
    "https://www3.hogrefe.de/fileadmin/redakteure/hogrefe_de/Psychlehrbuchplus/Multivariate_Verfahren/08_Clusteranalsyse/Arbeitserleben.sav",
    to.data.frame = TRUE,
    max.value.labels = Inf, 
    trim.factor.names = FALSE)
  # Den Objekten des Datensatzes als Namen die Variablen-Labels der SPSS Daten geben
  #names(daten) <- attributes(daten)$variable.labels  
}  
#options(warn=0)

daten.auswahl<-daten[, 3:22]
daten.scale<-scale(daten.auswahl)

head(daten.scale)

daten<-data.frame(pb = daten$pb)
daten$tech_orga_bed<-rowMeans(daten.scale[, c(1,2,3,4,5,6,7,8,9,10,11,12)], na.rm=T)
daten$koop_kommu <- rowMeans(daten.scale[, c(13, 14, 15)])
daten$verant<-rowMeans(daten.scale[, c(16, 17)])
daten$niv_geist_anf <- daten.scale[, 18]
daten$lernpot <- rowMeans(daten.scale[, c(19, 20)])
  
rm(daten.auswahl)
rm(daten.scale)

