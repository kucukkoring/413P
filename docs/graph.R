## Required R file
source('https://github.com/kucukkoring/413P/blob/main/docs/evds.R')

## Required Packages
if (!require(plotly)) install.packages('plotly')
## Graph

fig <- plot_ly(doviz, x = ~tarih, y = ~doviz, type = 'scatter', mode = 'lines')

fig2 <- plot_ly(kko, x = ~tarih, y = ~kko, type = 'scatter', mode = 'lines')
