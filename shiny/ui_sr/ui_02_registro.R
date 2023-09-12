#
ui_registro <- 
  tabItem("registro", h1("Ingresa tus datos"),
          fluidRow(
            column(width = 12,
                   textInput("nombre", "Ingresa tu nombre/apodo", value = "..."),
                   selectizeInput("liga", label = NULL, choices = "",
                                  multiple = F,
                                  options = list(placeholder = "...", 
                                                 onInitialize = I('function() { this.setValue("");}'))),
                   textInput("clave", "Ingresa tu contraseña", value = "...")
            )
          )
          ,
          fluidRow(align = "center",
                   column(width = 4,
                          infoBoxOutput("ib_res_con", width = 12),
                          actionButton("ab_registro", "Envía tu registro"),
                          br(), br(),
                          valueBoxOutput("ib_env_res", width = 12)
                   )
          )
  )
