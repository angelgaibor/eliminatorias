#
ui_puntaje <-
  tabItem("puntaje",
          selectizeInput("liga1", label = NULL, choices = "",
                         multiple = F,
                         options = list(placeholder = "...", 
                                        onInitialize = I('function() { this.setValue("");}'))),
          box(title = "Puntaje general", status = "warning", solidHeader = T, plotOutput("gra_lig_jug")),
          box(title = NULL, status = "warning", solidHeader = F, '\"Tu envidia es mi bendición.\"',
              br(),  '\"Y todo por no estudiar.\"')
          
  )