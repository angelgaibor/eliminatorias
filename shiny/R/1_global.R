library(googlesheets4)

gs4_deauth()
li_ligas <- "https://docs.google.com/spreadsheets/d/1G9vbPS4sYwRbAcs-325NpIFgr9VTnffCwZYlEyucWig/"
lista_ligas <- read_sheet(li_ligas)

gs4_deauth()
ra <- "https://docs.google.com/spreadsheets/d/1XhPgP6gahj3XVAxT6MUTKYUwR6kV36cBW2m0GGo_K5w/"
info_registro <- read_sheet(ra)

gs4_deauth()
j <- "https://docs.google.com/spreadsheets/d/1MSyifURW5-OQJKcDbpISaJb6SdLMtCRz4xLidhmXulQ/"
jornadas <- read_sheet(j)

gs4_deauth()
k <- "https://docs.google.com/spreadsheets/d/1qnTprfZFP2p19_w3zq-opwtKGvJ6e_3-_2fTgk6HBgk/"
pre_jornadas_f <- read_sheet(k)
