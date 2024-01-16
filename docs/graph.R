## Required R file
source('https://raw.githubusercontent.com/kucukkoring/413P/main/docs/evds.R')

## Required Packages
if (!require(plotly)) install.packages('plotly')
## Graph


fig <- plot_ly(kfe, x = ~Tarih, y = ~İstanbul, type = 'scatter', mode = 'lines')

fig2 <- plot_ly(konut_faiz, x = ~Tarih, y = ~XD, type = 'scatter', mode = 'lines')

graph_1 <- plot_ly(kfe, x = ~Tarih, y = ~İstanbul , type = 'scatter' , mode = 'lines')
graph_1

graph_2 <- plot_ly(konut_faiz, x = ~Tarih, y = ~XD, type = 'scatter', mode = 'lines')
graph_2


graph_3 <- plot_ly(kfe, x = ~Tarih, y = ~Ankara , type = 'scatter' , mode = 'lines')
graph_3

graph_1 <- plot_ly(kfe, x = ~Tarih, y = ~İstanbul, type = 'scatter', mode = 'lines', name = 'İstanbul') %>%
  add_trace(x = ~Tarih, y = ~Ankara, type = 'scatter', mode = 'lines', name = 'Ankara')

graph_1

fig











# Plotting the scatter plot for İstanbul with adjusted x-axis
graph_1 <- plot_ly(kfe, x = ~Tarih, y = ~İstanbul, type = 'scatter', mode = 'lines', name = 'İstanbul') %>%
  layout(
    xaxis = list(
      tickvals = seq(min(kfe$Tarih), max(kfe$Tarih), by = "1 year"),  # Set ticks for each year
      tickmode = 'array',
      range = c(min(kfe$Tarih), max(kfe$Tarih))  # Set the x-axis range to cover the entire dataset
    )
  )

# Adding a second trace for Ankara
graph_1 <- graph_1 %>% add_trace(x = ~Tarih, y = ~Ankara, type = 'scatter', mode = 'lines', name = 'Ankara')

# Show the modified scatter plot with both İstanbul and Ankara
graph_1

## konut faiz graph


graph_31 <- plot_ly(konut_faiz, x = ~Tarih, y = ~KFO, type = 'scatter', mode = 'lines')
graph_31
