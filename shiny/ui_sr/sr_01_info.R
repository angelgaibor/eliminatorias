#
# contador de tiempo para el mundial
output$tiempo <- renderValueBox({
  invalidateLater(1000, session)
  
  t1 <- difftime(as.POSIXlt.character("2026-06-09 12:00:00 -05"), Sys.time(), units = "days") + 5/24
  t2 <- difftime(as.POSIXlt.character("2026-07-19 12:00:00 -05"), Sys.time(), units = "days") + 5/24
  if(as.numeric(t1)<0){
    t <- t2
    debajo <- "restantes para la final del mundial 2026"
  }else{
    t <- t1
    debajo <- "restantes para el mundial 2026"
  }
  t <- as.numeric(t)
  dias <- floor(t)
  horas <- floor((t - floor(t))*24)
  minutos <- floor(((t - floor(t))*24 - horas)*60)
  segundos <- floor(t*24*60*60 - (dias*24*60*60 + horas*60*60 + minutos*60))
  minutos <- str_pad(minutos, 2, "left", "0")
  segundos <- str_pad(segundos, 2, "left", "0")
  mensaje <- paste0(dias, " días ", horas, ":", minutos, ":", segundos)
  valueBox(mensaje, debajo, icon = icon("time", lib = "glyphicon"), color = "yellow")
})