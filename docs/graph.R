## Required R file
source('https://raw.githubusercontent.com/kucukkoring/413P/main/docs/evds.R')

## Required Packages
if (!require(plotly)) install.packages('plotly')
library(plotly)
## Graph

graph1 <- ggplotly(
  ggplot(merged, aes(x=Housing_Interest_Rate, y=Ankara_First_Hand_House_Sales)) +
    geom_point(color = "purple") +
    geom_smooth(formula = y ~ x, method = "lm", se = TRUE, color = "blue") +
    theme_minimal() +
    labs(title = "Ankara First Hand House Sales & Housing Interest Rate", x = "Ankara House Price Index", y = "Ankara First Hand House Sales") +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank())
)
graph1

graph2 <- ggplotly(
  ggplot(merged, aes(x=Ankara_House_Price_Index, y=Ankara_First_Hand_House_Sales)) +
    geom_point(color = "purple") +
    geom_smooth(formula = y ~ x, method = "lm", se = TRUE, color = "blue") +
    theme_minimal() +
    labs(title = "Ankara First Hand House Sales & Ankara House Price Index", x = "Ankara House Price Index", y = "Ankara First Hand House Sales") +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank())
)
graph2














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
