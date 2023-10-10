
#
# lista de jornadas
observeEvent(req(r_jornadas()), {
  updateSelectizeInput(session, inputId = "jornada", label = 'Selecciona la jornada:',
                       selected = min(unique(r_jornadas()$Jornada[r_jornadas()$Activa != 0])),
                       choices  = unique(r_jornadas()$Jornada[r_jornadas()$Activa != 0]))
})

# Gráfico de barritas
bdd_gra_jug_pun <- reactive({
  bdd2 <- r_predicciones() %>%
    rename(Jugador = usuario, Clave = clave) %>%
    left_join(r_registro(), by = c("Jugador", "Clave")) %>%
    group_by(Local = loc, Visitante = vis, Liga, Jugador, Clave) %>%
    summarise(gl = last(gl),
              gv = last(gv)) %>%
    ungroup() %>%
    left_join(r_jornadas(), by = c("Local", "Visitante")) %>%
    select(-Fecha, -Hora) %>%
    # Cálculo de los puntajes
    mutate(gl = as.numeric(gl),
           gv = as.numeric(gv),
           cp1 = ifelse(sign(gl - gv) == sign(GolLocal - GolVisita), 1, 0),
           cp2 = ifelse(gl - gv == GolLocal - GolVisita, 1, 0),
           cp3 = ifelse(gl == GolLocal & gv == GolVisita, 2, 0),
           pi = cp1 + cp2 + cp3,
           desempate = case_when(pi == 4 ~ 0.1,
                                 pi == 2 ~ 0.01,
                                 T ~ 0),
           puntaje = pi + desempate) %>%
    # Suma de puntaje por jugador y liga
    group_by(Liga, Jornada, Jugador) %>%
    summarise(Puntaje = sum(puntaje, na.rm = T))
  
  if(input$liga1 == "Todos contra todos"  | is.null(input$liga1)){
    bdd2 %>% 
      filter(Jornada == input$jornada) %>% 
      mutate(Jugador = paste0(toupper(substr(Liga, 1, 3)), "\n", Jugador)) %>% 
      arrange(Puntaje, Jugador) %>% 
      mutate(puntos1 = str_pad(Puntaje, 2, "left", "0"),
             Jugador = factor(paste0(puntos1, Jugador), levels = paste0(puntos1, Jugador), labels = Jugador))
  }else{
    bdd2 %>% 
      filter(Jornada == input$jornada) %>% 
      filter(Liga == input$liga1) %>% 
      arrange(Puntaje, Jugador, Liga) %>% 
      mutate(puntos1 = str_pad(Puntaje, 2, "left", "0"),
             Jugador = factor(x = paste0(puntos1, Jugador, Liga), levels = paste0(puntos1, Jugador, Liga), labels = Jugador))
  }
})
#
# grafico de puntos por jugador/liga
output$gra_lig_jug <- renderPlot({
  validate(
    need(input$liga1, "Por favor, selecciona una Liga.")
  )
  
  # if(dim(bdd_gra_jug_pun())[1]>10){
  #   li <- bdd_gra_jug_pun()[(dim(bdd_gra_jug_pun())[1] - 9) :dim(bdd_gra_jug_pun())[1], ]
  # }else{
  #   li <- bdd_gra_jug_pun()
  # }
  
  
    bdd_gra_jug_pun() %>% 
    ggplot(aes(y = Jugador, x = Puntaje, fill = Jugador, col = Jugador)) +
    geom_bar(stat = "identity") +
    geom_text(aes(label = Puntaje), position = position_dodge(width = 0.9), hjust = 1, size = 3.5, col = "white") +
    #scale_fill_manual(values = c("#FC8D62", "#F6D55C", "#3CAEA3", "#20639B", "#173F5F")) +
    theme(panel.background = element_blank(),
          panel.grid.minor = element_blank(),
          panel.grid.major.y = element_blank(),
          strip.background = element_rect(fill="white"),
          axis.text = element_text(size=7),
          axis.title = element_blank(),
          axis.title.x = element_blank(),
          legend.box = "vertical",
          legend.box.spacing = unit(0.5, "cm"),
          legend.direction = "vertical", 
          legend.position = "none",
          legend.text = element_text(size=7),
          legend.title = element_text(size=8),
          legend.title.align = 0.5,
          panel.border = element_rect(colour = "black", fill = NA))
})



