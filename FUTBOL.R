#Bibliotecas
library(readxl)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(esquisse)

#Carregar dataset
futbr <- read_excel("C:/ARTUR/futebolBR/futbr.xlsx", 
                    col_types = c("text", "text", "text", "text", "numeric", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", "numeric", "numeric"))
#visualizar dataset
head(futbr)
#Filtrar
campeoes<-filter(futbr,place =="1")
#grafico histórico
historico<-ggplot(campeoes) +
 aes(x = season, fill = team, weight = won) +
 geom_bar(color="black") +
 scale_fill_manual(values = c(`Atletico-MG` = "#D2B30D", 
Corinthians = "#000000", Cruzeiro = "#0000FF", Flamengo = "#FF0000", Fluminense = "#006400", Palmeiras = "#69AE0F", 
Santos = "#FFFFFF", SaoPaulo = "#808080")) +
 labs(x = "temporada", y = "vitórias", title = "Campeões do brasileirão série A") +
 theme_minimal() +
 theme(plot.title = element_text(size = 18L, face = "bold", hjust = 0.5), axis.title.y = element_text(size = 14L, 
 face = "bold.italic"), axis.title.x = element_text(size = 14L, face = "bold.italic"))
#Deixando interativo
grafico1 = ggplotly(historico)
grafico1

#Filtrar temporada mais recente
recente<-filter(futbr,season=="2023")
top5<-filter(recente,place=="1":"5")
#campeoes 2023
ggplot(top5) +
 aes(x = place, y = points, fill = team) +
 geom_col(color="black") +
  geom_text(aes(label=points), vjust=3, colour="black",position=position_dodge(.9), size=5) +
  scale_fill_brewer(palette = "Blues", direction = 1) +
  labs(title = "TOP 5 campeões brasileirão 2023") +
  theme_classic()