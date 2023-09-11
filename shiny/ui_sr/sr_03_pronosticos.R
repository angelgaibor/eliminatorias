#
#Input de equipos clasificados a octavos #####
output$nel1 <- renderText({
  jornadas$Local[jornadas$Activa == 1][1]
})

output$nev1 <- renderText({
  jornadas$Visitante[jornadas$Activa == 1][1]
})

output$nel2 <- renderText({
  jornadas$Local[jornadas$Activa == 1][2]
})

output$nev2 <- renderText({
  jornadas$Visitante[jornadas$Activa == 1][2]
})

output$nel3 <- renderText({
  jornadas$Local[jornadas$Activa == 1][3]
})

output$nev3 <- renderText({
  jornadas$Visitante[jornadas$Activa == 1][3]
})

output$nel4 <- renderText({
  jornadas$Local[jornadas$Activa == 1][4]
})

output$nev4 <- renderText({
  jornadas$Visitante[jornadas$Activa == 1][4]
})

output$nel5 <- renderText({
  jornadas$Local[jornadas$Activa == 1][5]
})

output$nev5 <- renderText({
  jornadas$Visitante[jornadas$Activa == 1][5]
})


pre_jornada <- reactive({
  req(input$gl1, input$gl2, input$gl3, input$gl4, input$gl5,
      input$gv1, input$gv2, input$gv3, input$gv4, input$gv5)
  
  data.frame(
    loc = jornadas$Local[jornadas$Activa == 1],
    vis = jornadas$Visitante[jornadas$Activa == 1],
    gl = c(input$gl1, input$gl2, input$gl3, input$gl4, input$gl5),
    gv = c(input$gv1, input$gv2, input$gv3, input$gv4, input$gv5)
  )
})

#Infobox: verificar si jugador y codigo existe
output$ib_inf_jug <- renderInfoBox({
  if(paste0(input$ingreso_usuario, input$ingreso_clave) %in% paste0(bdd1$Jugador, bdd1$Clave)){
    titulo = "Identificación"
    valor = paste0("Jugador: ", bdd1$Jugador[tolower(bdd1$Clave) == tolower(input$ingreso_clave)])
    subtitulo = paste0("Liga: ", bdd1$Liga[tolower(bdd1$Clave) == tolower(input$ingreso_clave)])
    colorib = "green"
    iconob = icon("ok", lib = "glyphicon")
  }else{
    titulo = "Usuario y/o contraseña"
    valor = "incorrectos"
    subtitulo = "contáctate con el administrador"
    colorib = "red"
    iconob = icon("remove", lib = "glyphicon")
  }
  infoBox(titulo, valor, subtitulo, color = colorib, icon = iconob, width = 12)
})
# Botón para envío de resultado
observeEvent(input$pro_jor, {
  v_c$guardado <- T
  pre_jf <- pre_jornada() %>%
    mutate(usuario = input$ingreso_usuario,
           clave = input$ingreso_clave) %>% 
    select(loc, vis, gl, gv, usuario, clave) %>% 
    ungroup() %>% 
    as.data.frame()
  v_c$pre_cuartos_fin <- agrega_prediccion_jornada(pre_jf, T)
})