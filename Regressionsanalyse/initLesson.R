# swirl-Motivations-Nachrichten unterdrücken
options(swirl_is_fun = FALSE)
options(swirl_language = "german")

require("foreign")
# SPSS-Daten von einer URL einlesen - Warnung kann ignoriert werden. Die Daten werden als Daten-Frame gespeichert.

alter = c(21, 24, 25, 37, 22, 29, 31)
#alter2 = alter^2
einkommen = c(27000, 28000, 25000, 55000, 21000, 35000, 42000)


# options(warn=-1)
# daten <- read.spss(
#   "http://www.hogrefe.de/fileadmin/redakteure/hogrefe_de/Psychlehrbuchplus/Multivariate_Verfahren/02_Regressionsanalyse/Berufskompetenz.sav",
#   to.data.frame = TRUE,
#   max.value.labels = Inf, 
#   trim.factor.names = FALSE)[-25,] 
# # Den Objekten des Datensatzes als Namen die Variablen-Labels der SPSS Daten geben
# names(daten) <- attributes(daten)$variable.labels  
# options(warn=0)
