## Required R file
source('https://raw.githubusercontent.com/kucukkoring/413P/main/docs/evds.R')

## Required Packages
if (!require(plotly)) install.packages('plotly')
library(plotly)
## Graph

graph1 <- ggplotly(
  ggplot(merged, aes(x=Housing_Interest_Rate, y=Ankara_First_Hand_House_Sales)) +
    geom_point(color = "black") +
    geom_smooth(formula = y ~ x, method = "lm", se = TRUE, color = "blue") +
    theme_minimal() +
    labs(title = "Ankara First Hand House Sales & Housing Interest Rate", x = "Ankara House Price Index", y = "Ankara First Hand House Sales") +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank())
)
graph1

graph2 <- ggplotly(
  ggplot(merged, aes(x=Ankara_House_Price_Index, y=Ankara_First_Hand_House_Sales)) +
    geom_point(color = "black") +
    geom_smooth(formula = y ~ x, method = "lm", se = TRUE, color = "blue") +
    theme_minimal() +
    labs(title = "Ankara First Hand House Sales & Ankara House Price Index", x = "Ankara House Price Index", y = "Ankara First Hand House Sales") +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank())
)
graph2

graph3 <- ggplotly(
  ggplot(merged, aes(x=Ankara_House_Price_Index, y=Ankara_Second_Hand_House_Sales)) +
    geom_point(color = "black") +
    geom_smooth(formula = y ~ x, method = "lm", se = TRUE, color = "blue") +
    theme_minimal() +
    labs(title = "Ankara Second Hand House Sales & Ankara House Price Index", x = "Ankara House Price Index", y = "Ankara First Hand House Sales") +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank())
)
graph3

graph4 <- ggplotly(
  ggplot(merged, aes(x=Housing_Interest_Rate, y=Ankara_Second_Hand_House_Sales)) +
    geom_point(color = "black") +
    geom_smooth(formula = y ~ x, method = "lm", se = TRUE, color = "blue") +
    theme_minimal() +
    labs(title = "Ankara Second Hand House Sales & Housing Interest Rate", x = "Ankara House Price Index", y = "Ankara First Hand House Sales") +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank())
)
graph4

graph5 <- ggplotly(
  ggplot(merged, aes(x=Istanbul_House_Price_Index, y=Istanbul_First_Hand_House_Sales)) +
    geom_point(color = "black") +
    geom_smooth(formula = y ~ x, method = "lm", se = TRUE, color = "blue") +
    theme_minimal() +
    labs(title = "Istanbul First Hand House Sales & Housing Interest Rate", x = "Istanbul House Price Index", y = "Istanbul First Hand House Sales") +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank())
)
graph5

graph6 <- ggplotly(
  ggplot(merged, aes(x=Istanbul_House_Price_Index, y=Istanbul_Second_Hand_House_Sales)) +
    geom_point(color = "black") +
    geom_smooth(formula = y ~ x, method = "lm", se = TRUE, color = "blue") +
    theme_minimal() +
    labs(title = "Istanbul Second Hand House Sales & Housing Interest Rate", x = "Istanbul House Price Index", y = "Istanbul Second Hand House Sales") +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank())
)
graph6

stargazer(model_1, model_2, type = "html")
