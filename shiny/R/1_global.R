library(googlesheets4)
gs4_deauth()
qatar22 <- "https://docs.google.com/spreadsheets/d/13qZaElTnoTFK1f40lKW9geqS6dsbqkJOzMAbIoLs8IU/"
equipos <- read_sheet(qatar22)

gs4_deauth()
resultados <- "https://docs.google.com/spreadsheets/d/10bKKPH_tYS6OBK4ucWGHznx5RlkXCc7jVA0FBo4-vCc/"
predicciones <- read_sheet(resultados)

gs4_deauth()
li_ligas <- "https://docs.google.com/spreadsheets/d/1G9vbPS4sYwRbAcs-325NpIFgr9VTnffCwZYlEyucWig/"
lista_ligas <- read_sheet(li_ligas)

# resultados de eliminacion directa
# octavos
gs4_deauth()
pre_oct <- "https://docs.google.com/spreadsheets/d/1dYPW05FQ5qm78IwOggcbK9ygTEkYYFeibA8GLN2GGOA/"
pre_octavos_ini <- read_sheet(pre_oct)

# cuartos
gs4_deauth()
pre_cua <- "https://docs.google.com/spreadsheets/d/19eOYeNW3PC5BKN1G274Ub581mMutNd4l1Y6e48vaVgo/"
pre_cuartos_ini <- read_sheet(pre_cua)

# semis
gs4_deauth()
pre_sem <- "https://docs.google.com/spreadsheets/d/1cybQLx_XC3hE5IuJqjYSKckUqCkKYTafH8xLylVSAEs/"
pre_semis_ini <- read_sheet(pre_sem)

# finales
gs4_deauth()
pre_fin <- "https://docs.google.com/spreadsheets/d/1ZmGACsUFLKEjyyX3nnXG0qhokc6P8nUOOghLfVatcmw/"
pre_final_ini <- read_sheet(pre_fin)

# predicciones eliminacion directa
gs4_deauth()
r_elim_directa <- "https://docs.google.com/spreadsheets/d/1U_H63SWVT6K1whlKql07nXXrXu0e5mi7R5SR4UP8-NA/"
res_elim_directa <- read_sheet(r_elim_directa)

