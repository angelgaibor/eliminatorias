#
ui_info <- 
  tabItem("info", 
          fluidRow(column(width = 12, valueBoxOutput("tiempo", width = 12)),
                   column(width = 6,
                          box(title = "Mundial 2026", status = "danger", solidHeader = T, width = 12,
                              "Esto copiamos de Wikipedia: La Copa Mundial de la 
                              FIFA México/Estados Unidos/Canadá 2026 (en inglés: 
                              2026 FIFA World Cup Canada/United States/Mexico; en 
                              francés: Coupe du Monde de la FIFA-Canada/États-Unis/Mexique 
                              2026) será la vigésima tercera edición de la Copa Mundial de 
                              Fútbol organizada por la FIFA, y se desarrollará del 9 de junio
                              al 19 de julio de 2026 en Canadá, Estados Unidos y México.",
                              br(), br(),
                              "La sede triple fue escogida el 13 de junio de 2018, 
                              durante el 68.º Congreso de la FIFA en Moscú, Rusia. 
                              Es la primera vez que se otorga la sede a tres países. 
                              México será el primer país en organizar tres copas del mundo 
                              (1970 y 1986), en tanto Estados Unidos será el sexto en 
                              albergar al menos dos (1994) y Canadá sería sede por primera vez.",
                              br(), br(),
                              "PD. En Ecuador no está convocado Leito Campana :( (dos fechas
                              y contando)",
                              br(), br(),
                              "PD2. Si Ecuador puede clasificar a la Copa del Mundo, Las Muestritas
                              también pueden al cuadrangular final. A ganar equipo...!!!",
                              # br(), br(),
                              # HTML('<iframe 
                              #      src="https://www.youtu.be/embed/XN-rQ0DvKVQ" frameborder="0" 
                              #      allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                              #      picture-in-picture" allowfullscreen></iframe>'),
                              br()),
                          box(title = "Reglas del juego", status = "danger", solidHeader = T, width = 12,
                              strong("Registro:"), br(),
                              "- En la pestaña Juega conmigo, ingresa tu nombre, liga y contraseña.", br(),
                              "- Luego, da click en el botón enviar para registrate.",br(),
                              br(),
                              strong("Enviar pronóstico:"), br(),
                              "- Introduce los marcadores de los partidos de cada fecha.", br(),
                              "- Antes de enviar tus resultados deberás introducir tu contraseña asociada a tu jugador y liga.", br(),
                              "- Para enviar tus pronósticos da click en el botón ", strong("Envía tu pronóstico"), ".",br(),
                          ),
                          box(title = "Sistema de puntos", status = "danger", solidHeader = T, width = 12,
                              "- Si aciertas al ganador (o empate) del partido recibes ", strong("1 punto"), ".", br(),
                              "- Además, si aciertas a la diferencia de goles recibes ", strong("1 punto extra"), ".", br(),
                              "- Por último, si aciertas el marcador exacto recibirás ", strong("2 puntos extra"), ".", br(),
                              strong("Criterios de desempate:"), br(),
                              "- Mayor número de aciertos a resultados exactos,", br(),
                              "- Mayor número de aciertos a diferencias de goles,", br(),
                              "- Si el empate persiste me quedo con su dinero.",
                              br(), br(),
                              strong("Nota:"), br(),
                              "Si perdiste tu código contacta a los administradores (javier.ns87@gmail.com y/o angleito2112@gmail.com).",
                          )
                   ),
                   column(width = 6, img(src = "logo.jpg", style = "width:336px"), align = "center")
          )
  )
