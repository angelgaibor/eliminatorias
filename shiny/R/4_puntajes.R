#
library(tidyverse)
# Tratamiento información de registro
bdd1 <- info_registro %>% 
  group_by(Jugador, Liga) %>% 
  summarise(Clave = last(Clave)) %>% 
  ungroup()


bdd2 <- pre_jornadas_f %>% 
  rename(Jugador = usuario, Clave = clave) %>% 
  left_join(info_registro, by = c("Jugador", "Clave")) %>% 
  group_by(Local = loc, Visitante = vis, Liga, Jugador, Clave) %>% 
  summarise(gl = last(gl),
            gv = last(gv)) %>% 
  ungroup() %>% 
  left_join(jornadas, by = c("Local", "Visitante")) %>% 
  select(-Fecha, -Hora) %>% 
  # Cálculo de los puntajes
  mutate(gl = as.numeric(gl),
         gv = as.numeric(gv),
         cp1 = ifelse(sign(gl - gv) == sign(GolLocal - GolVisita), 1, 0),
         cp2 = ifelse(gl - gv == GolLocal - GolVisita, 1, 0),
         cp3 = ifelse(gl == GolLocal & gv == GolVisita, 2, 0),
         puntaje = cp1 + cp2 + cp3) %>% 
# Suma de puntaje por jugador y liga
  group_by(Liga, Jugador) %>% 
  summarise(Puntaje = sum(puntaje, na.rm = T))


# aumentar lo del web scrapping
