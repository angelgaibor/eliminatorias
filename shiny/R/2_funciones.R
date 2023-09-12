#
# agregar prediccion jornada
agrega_prediccion_jornada <- function(data_pj, gs4 = TRUE) {
  
  if (gs4) {
    sheet_append(k, data_pj, "pre_jornadas")
    cum_data <- read_sheet(k, "pre_jornadas")
  } else {
    old_data <- read.xlsx("data/predicciones_octavos.xlsx", "Hoja1")
    cum_data <- bind_rows(old_data, data_pj)
    write.xlsx(cum_data, "data/predicciones_octavos.xlsx", "Hoja1")
  }
  
  cum_data
}

#
# agregar prediccion
agrega_prediccion <- function(data, gs4 = TRUE) {
  
  if (gs4) {
    sheet_append(ra, data, "info_registro")
    sum_data <- read_sheet(ra, "info_registro")
  } else {
    old_data <- read.xlsx("data/info_registro.xlsx", "info_registro")
    sum_data <- bind_rows(old_data, data)
    write.xlsx(sum_data, "data/info_registro.xlsx", "info_registro")
  }
  
  sum_data
}