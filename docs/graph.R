## Required R file
source('evds.R')

## Required Packages
if (!require(plotly)) install.packages('plotly')
## Graph

fig <- plot_ly(doviz, x = ~tarih, y = ~doviz, type = 'scatter', mode = 'lines')

