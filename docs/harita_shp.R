library(sf)
library(plotly)

# Load the shapefile
ankara <- st_read("C:/Users/LENOVO/Desktop/413 Proje/proje/MAP_SHP/ankara.shp")



shp_map <- plot_ly(ankara, split = ~ILCEADI, color = ~Rent, span = I(1.5), showlegend = FALSE,   
        text = ~Rent, 
        hoverinfo = "text")
shp_map

shp_map1 <- plot_ly(ankara, split = ~ILCEADI, color = ~Sale, span = I(1.5), showlegend = FALSE,   
                   text = ~Sale, 
                   hoverinfo = "text")
shp_map1

?plot_ly
