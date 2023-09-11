#
# lista de ligas
observeEvent(req(lista_ligas), {
  updateSelectizeInput(session, inputId = "liga", label = 'Selecciona tu Liga:', selected = NULL,
                       choices  = unique(lista_ligas$Liga))
  
  updateSelectizeInput(session, inputId = "liga1", label = 'Selecciona tu Liga:', selected = "Todos contra todos",
                       choices  = c("Todos contra todos", unique(lista_ligas$Liga)))
})

observeEvent(req(pr3, input$liga1), {
  if(input$liga1 == "Todos contra todos"){
    pr31 <- pr3 %>% 
      mutate(Jugador = paste0(toupper(substr(Liga, 1, 3)), " ", Jugador))
  }else{
    pr31 <- pr3 %>% 
      filter(Liga == input$liga1)
  }
  
  updateSelectizeInput(session, inputId = "jugador1", label = 'Selecciona al jugador:', selected = "Todos",
                       choices  = c("Todos", unique(pr31$Jugador)))
})
#
# prediccion del jugador
data <- reactive(
  data.frame(
    Jugador = input$nombre,
    Liga = input$liga,
    Clave = input$clave)
)  
#
# infobox - prediccion es correcta o no
output$ib_res_con <- renderInfoBox({
  if(input$nombre != "..." & input$liga != "..." & input$clave != "..."){
    colorib = "green"
    mensaje = "Envía tu información"
    iconob = icon("ok", lib = "glyphicon")
  }else if(input$nombre == "..."){
    colorib = "red"
    mensaje = "Ingresa tu nombre"
    iconob = icon("remove", lib = "glyphicon")
  }else if(input$liga == "..."){
    colorib = "red"
    mensaje = "Selecciona una Liga"
    iconob = icon("remove", lib = "glyphicon")
  }else if(input$clave == "..."){
    colorib = "red"
    mensaje = "Ingresa una contraseña diferente de ..."
    iconob = icon("remove", lib = "glyphicon")
  }else{
    colorib = "red"
    mensaje = "La la la la"
    iconob = icon("remove", lib = "glyphicon")
  }
  infoBox(
    HTML("Estado de tu registro"), 
    h6(mensaje), 
    icon = iconob,
    color = colorib, 
    fill = T
  )
})
#
# envía la predicción
observeEvent(input$pronostico, {
  # debug_msg("pronostico")
  # save the data and update summary data
  v$guardado <- T
  dato <- data() 
  v$info_registro1 <- agrega_prediccion(dato, T) #USING_GS4
  
})
#
# infobox de envío de resultados
output$ib_env_res <- renderValueBox({
  mensaje <- "Envía"
  subt <- "tu registro"
  colorib <- "red"
  if(v$guardado == T){
    mensaje <- v$codigo
    subt <- "Registro exitoso"
    colorib <- "green"
  }
  valueBox(
    mensaje,
    subt,
    icon = icon("cloud-upload", lib = "glyphicon"),
    color = colorib, 
    width = 12
  )
})