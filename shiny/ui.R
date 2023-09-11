#
# Interfaz de usuario

# carga de paquetes
library(openxlsx)
library(rvest)
library(shiny)
library(shinydashboard)
library(tidyverse)
library(glue)
library(stringi)

source("ui_sr/ui_01_info.R", local = T)
source("ui_sr/ui_02_registro.R", local = T)
source("ui_sr/ui_03_pronosticos.R", local = T)

# autorizacion en google sheet
gs4_auth(cache = ".secrets", email = "endi.dm.inec@gmail.com")

ui <- dashboardPage(skin="black",
                    
                    dashboardHeader(title = "Polla eliminatorias CGB - Conmebol", titleWidth = 480
                    ),
                    
                    # panel lateral
                    dashboardSidebar(width = 240,
                                     sidebarMenu(menuItem("Juega conmigo", startExpanded = T,
                                                          icon = icon("screenshot", lib = "glyphicon"),
                                                          menuSubItem("¿Cómo jugar?", tabName = "info", selected = T),
                                                          menuSubItem("Regístrate", tabName = "registro"),
                                                          menuSubItem("Octavos de final", tabName = "juega_octavos"),
                                                          menuSubItem("Cuartos de final", tabName = "juega_cuartos"),
                                                          menuSubItem("Semifinales", tabName = "juega_semis"),
                                                          menuSubItem("Finales", tabName = "juega_final")
                                     ),
                                     menuItem("Resultados Qatar 2022",
                                              icon = icon("tasks", lib = "glyphicon"),
                                              menuSubItem("Fase de grupos", tabName = "res_grupos"),
                                              menuSubItem("Fase final", tabName = "res_elim_directa")),
                                     menuItem("Puntaje", tabName = "puntaje",
                                              icon = icon("signal", lib = "glyphicon"))
                                     )
                    ),
                    
                    # cuerpo
                    dashboardBody(
                      tabItems(
                        ui_info,
                        ui_registro,
                        ui_pronosticos
                      )
                    )
)


