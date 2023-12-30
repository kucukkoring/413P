## Required R file
source('https://raw.githubusercontent.com/kucukkoring/413P/main/docs/evds.R')

## Required Packages
if (!require(plotly)) install.packages('plotly')
## Graph

fig <- plot_ly(doviz, x = ~tarih, y = ~doviz, type = 'scatter', mode = 'lines')

