#
ui_pronosticos <-
  tabItem("pronosticos",
          tags$style(
            ".container {
                          display: flex;
                          justify-content: space-around;
                          border-color: #666666;
                          background-color: #fff;
                          border-style: solid;
                          border-width: thin;
                          border-radius: 3px;
                          text-align: center;
                          margin: 14px;
                          min-height: 48px;
                          width: 336px;
                          }
                          .container-items {
                          width: 40px;
                          height: 34px;
                          margin: 7px;
                          text-align: center;
                          font-size: 18px;
                          vertical-align: baseline;
                          }
                          "
          ),
          fluidRow(width = 12,
                   column(width = 6, align = "center",
                          valueBox(value = paste0("Jornada ", unique(jornadas$Jornada[jornadas$Activa == 1])), color = "red", subtitle = NULL, width = 12),
                          div(
                            class = "container",
                            div(class = "container-items",
                                strong("Loc")),
                            div(class = "container-items",
                                strong("Gol")),
                            div(class = "container-items",
                                strong("Gol")),
                            div(class = "container-items",
                                strong("Vis"))
                          ),
                          div(
                            class = "container",
                            div(class = "container-items",
                                textOutput("nel1")),
                            div(class = "container-items",
                                span(textInput("gl1", label = NULL, value = "", width = "36px"))),
                            div(class = "container-items",
                                span(textInput("gv1", label = NULL, value = "", width = "36px"))),
                            div(class = "container-items",
                                span(textOutput("nev1")))
                          ),
                          div(
                            class = "container",
                            div(class = "container-items",
                                textOutput("nel2")),
                            div(class = "container-items",
                                span(textInput("gl2", label = NULL, value = "", width = "36px"))),
                            div(class = "container-items",
                                span(textInput("gv2", label = NULL, value = "", width = "36px"))),
                            div(class = "container-items",
                                span(textOutput("nev2")))
                          ),
                          div(
                            class = "container",
                            div(class = "container-items",
                                textOutput("nel3")),
                            div(class = "container-items",
                                span(textInput("gl3", label = NULL, value = "", width = "36px"))),
                            div(class = "container-items",
                                span(textInput("gv3", label = NULL, value = "", width = "36px"))),
                            div(class = "container-items",
                                span(textOutput("nev3")))
                          ),
                          div(
                            class = "container",
                            div(class = "container-items",
                                textOutput("nel4")),
                            div(class = "container-items",
                                span(textInput("gl4", label = NULL, value = "", width = "36px"))),
                            div(class = "container-items",
                                span(textInput("gv4", label = NULL, value = "", width = "36px"))),
                            div(class = "container-items",
                                span(textOutput("nev4")))
                          ),
                          div(
                            class = "container",
                            div(class = "container-items",
                                textOutput("nel5")),
                            div(class = "container-items",
                                span(textInput("gl5", label = NULL, value = "", width = "36px"))),
                            div(class = "container-items",
                                span(textInput("gv5", label = NULL, value = "", width = "36px"))),
                            div(class = "container-items",
                                span(textOutput("nev5")))
                          )
                   )
          ),
          fluidRow(width = 12,
                   column(width = 1),
                   column(width = 4, align = "center",
                          #valueBox(value = "Tu predicción:", color = "yellow", subtitle = NULL, width = 12),
                          #box(width = 12, tableOutput("tabla_cuartos")),
                          textInput("ingreso_usuario", label = "Ingresa tu nombre", value = "...",
                                    width = "168px"),
                          textInput("ingreso_clave", label = "Ingresa tu contraseña", value = "...",
                                    width = "168px"),
                          infoBoxOutput("ib_inf_jug", width = 12),
                          # comentamos boton para no poder enviar mas resultados
                          actionButton("pro_jor", "Envía tu pronóstico"),
                          br(), br(),
                          valueBoxOutput("ib_env_pro", width = 12)
                   ),
                   column(width = 1)
          )
  )