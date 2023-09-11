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
    sheet_append(registro_archivo, data, "info_registro")
    sum_data <- read_sheet(registro_archivo, "info_registro")
  } else {
    old_data <- read.xlsx("data/info_registro.xlsx", "info_registro")
    sum_data <- bind_rows(old_data, data)
    write.xlsx(sum_data, "data/info_registro.xlsx", "info_registro")
  }
  
  sum_data
}

# agregar prediccion octavos
agrega_prediccion_octavos <- function(data_oct, gs4 = TRUE) {
  
  if (gs4) {
    sheet_append(pre_oct, data_oct, "pre_oct")
    cum_data <- read_sheet(pre_oct, "pre_oct")
  } else {
    old_data <- read.xlsx("data/predicciones_octavos.xlsx", "Hoja1")
    cum_data <- bind_rows(old_data, data_oct)
    write.xlsx(cum_data, "data/predicciones_octavos.xlsx", "Hoja1")
  }
  
  cum_data
}

# agregar prediccion cuartos
agrega_prediccion_cuartos <- function(data_cua, gs4 = TRUE) {
  
  if (gs4) {
    sheet_append(pre_cua, data_cua, "pre_cua")
    cum_data <- read_sheet(pre_cua, "pre_cua")
  } else {
    old_data <- read.xlsx("data/predicciones_cuartos.xlsx", "Hoja1")
    cum_data <- bind_rows(old_data, data_oct)
    write.xlsx(cum_data, "data/predicciones_cuartos.xlsx", "Hoja1")
  }
  
  cum_data
}

# agregar prediccion semis
agrega_prediccion_semis <- function(data_sem, gs4 = TRUE) {
  
  if (gs4) {
    sheet_append(pre_sem, data_sem, "pre_sem")
    cum_data <- read_sheet(pre_sem, "pre_sem")
  } else {
    old_data <- read.xlsx("data/predicciones_semis.xlsx", "Hoja1")
    cum_data <- bind_rows(old_data, data_oct)
    write.xlsx(cum_data, "data/predicciones_semis.xlsx", "Hoja1")
  }
  
  cum_data
}

# agregar prediccion final
agrega_prediccion_final <- function(data_fin, gs4 = TRUE) {
  
  if (gs4) {
    sheet_append(pre_fin, data_fin, "pre_fin")
    cum_data <- read_sheet(pre_fin, "pre_fin")
  } else {
    old_data <- read.xlsx("data/predicciones_final.xlsx", "Hoja1")
    cum_data <- bind_rows(old_data, data_oct)
    write.xlsx(cum_data, "data/predicciones_final.xlsx", "Hoja1")
  }
  
  cum_data
}