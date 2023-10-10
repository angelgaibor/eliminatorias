#
# Define server logic required to draw a histogram
#
source("R/1_global.R",local = T)

# verifica si estamos usando googlesheets
USING_GS4 <- "googlesheets4" %in% (.packages()) && gs4_has_token()

# autorizacion en google sheet
gs4_auth(cache = ".secrets", email = "endi.dm.inec@gmail.com")

server <- function(input, output, session){
  
  # reactive values
  v <- reactiveValues()
  v_j <- reactiveValues()
  
  # Inicialización de objetos
  v$guardado <- F
  v_j$guardado <- F
  
  # Creación reactivos googlesheet
  r_ligas <- reactive({
    read_sheet(enlace_ligas)
  
  })
  
  r_registro <- reactive({
    read_sheet(enlace_registro)
  })
  
  r_jornadas <- reactive({
    read_sheet(enlace_jornadas)
  })
  
  r_predicciones <- reactive({
    read_sheet(enlace_predicciones)
  })
  # server tab info
  source("ui_sr/sr_01_info.R", local = T)
  
  # server tab: registro
  source("ui_sr/sr_02_registro.R", local = T)
  
  # server tab: pronosticos
  source("ui_sr/sr_03_pronosticos.R", local = T)
  
  # server tab: puntajes
  source("ui_sr/sr_06_puntaje.R", local = T)
  

  
  
  
}


