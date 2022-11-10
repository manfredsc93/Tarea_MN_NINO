install.packages("readr")
install.packages("tidyverse")
install.packages("data.table")
install.packages("plotly")
library(readr)
library(tidyverse)
library(data.table)
library(plotly)

# Cargar CSV
# https://rsanchezs.gitbooks.io/rprogramming/content/chapter9/filter.html
# con la función read_delim() de readr
enso <-
  read_delim(
    file = "ENSO.csv"
  )
enso_ind <-
  read_delim(
    file = "enso_inx.csv"
  )
##filtrar datos días de lleuvia con menos de 1mm
enso_fil <- 
enso |>
 filter(PPGY_GPC >= 0.9, PPGY_OB >= 0.9,TURR_OB >= 0.9, TURR_GP  >=0.9, TURR_TT  >=0.9, JACO_TT >=0.9 )

grafico_ppgc <-
  enso |>
  ggplot(aes(x = fecha, y = PPGY_GPC))+
  geom_col(color= "cadetblue4", fill= "cadetblue3") +
  ggtitle("Precipitación estimadda por la misión GPCM, Estación Papagayo") +
  xlab("Fecha") +
  ylab("Precipitación mm") 
grafico_ppgc 
#
grafico_ppgd <- grafico_ppgc + geom_point(data=enso_fil,aes(x = fecha, y= PPGY_GPC, color="blue"))+
  scale_color_manual(name = "Días con precipitación mayor a 1mm", values = c("PPGY_GPC"= "blue"))
 
 grafico_ppgd
###

grafico_tur <-
  enso |>
  ggplot(aes(x = fecha, y = TURR_GP))+
  geom_col(color= "cadetblue4", fill= "cadetblue3") +
  ggtitle("Precipitación estimada por la misión GPCM, estación Turrialba") +
  xlab("Fecha") +
  ylab("Precipitación mm") 
grafico_tur 

grafico_turdos <-
  enso |>
  ggplot(aes(x = fecha, y = TURR_TT))+
  geom_col(color= "cadetblue4", fill= "cadetblue3") +
  ggtitle("Precipitación estimada por la misión TRMM, estación Turrialba") +
  xlab("Fecha") +
  ylab("Precipitación mm") 
grafico_turdos 

grafico_jactt <-
  enso |>
  ggplot(aes(x = fecha, y = JACO_TT))+
  geom_col(color= "cadetblue4", fill= "cadetblue3") +
  ggtitle("Precipitación estimada por la misión TT, estación Jacó") +
  xlab("Fecha") +
  ylab("Precipitación mm") 
grafico_jactt

  
### Gráfico interactivo
ggplotly(grafico_barras) |> 
  config(locale = 'es')

