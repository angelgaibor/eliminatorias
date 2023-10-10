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
source("ui_sr/ui_04_jornadas.R", local = T)
source("ui_sr/ui_05_tabla_posiciones.R", local = T)
source("ui_sr/ui_06_puntaje.R", local = T)

# autorizacion en google sheet
gs4_auth(cache = ".secrets", email = "endi.dm.inec1@gmail.com")

ui <- dashboardPage(skin="black",
                    
                    dashboardHeader(title = "Polla eliminatorias CGB - Conmebol", titleWidth = 480
                    ),
                    
                    # panel lateral
                    dashboardSidebar(width = 240,
                                     sidebarMenu(menuItem("Juega conmigo", startExpanded = T,
                                                          icon = icon("screenshot", lib = "glyphicon"),
                                                          menuSubItem("¿Cómo jugar?", tabName = "info", selected = T),
                                                          menuSubItem("Regístrate", tabName = "registro"),
                                                          menuSubItem("Pronóstico", tabName = "pronosticos")
                                     ),
                                     menuItem("Resultados Eliminatorias 2026",
                                              icon = icon("tasks", lib = "glyphicon"),
                                              menuSubItem("Jornadas", tabName = "res_jornadas"),
                                              menuSubItem("Tabla de posiciones", tabName = "tabla_posiciones")),
                                     menuItem("Puntaje", tabName = "puntaje",
                                              icon = icon("signal", lib = "glyphicon"))
                                     )
                    ),
                    
                    # cuerpo
                    dashboardBody(
                      tabItems(
                        ui_info,
                        ui_registro,
                        ui_pronosticos,
                        ui_jornadas,
                        ui_tabla_posiciones,
                        ui_puntaje
                      )
                    )
)

# revisar la ui y sr 03

