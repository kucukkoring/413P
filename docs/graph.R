## Required R file
source('https://raw.githubusercontent.com/kucukkoring/413P/main/docs/evds.R')

## Required Packages
if (!require(plotly)) install.packages('plotly')
library(plotly)
## Graph

graph_2 <- plot_ly(kfe, x= ~Tarih, y = ~Ankara, type = 'scatter', mode = 'lines')
graph_2
graph_1 <- plot_ly(kfe, x = ~Tarih, y = ~Edirne_Kırklarelİ_Tekirdağ, type = 'scatter' , mode = 'lines')
graph_1
