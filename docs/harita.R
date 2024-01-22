library(leaflet)
library(sf)
library(dplyr)
library(rnaturalearth)

# Download Turkey boundaries
turkey <- ne_states(country = "Turkey", returnclass = "sf")

# Extract Ankara from Turkey data
ankara <- turkey %>% filter(admin == "Ankara")

# Project the data to a suitable coordinate system
ankara <- st_transform(ankara, crs = st_crs(4326))

# Create a basic leaflet map
ankara_map <- leaflet() %>%
  addTiles() %>%
  setView(lng = 32.8597, lat = 39.9334, zoom = 7)  # Set the initial view to Ankara

# Add the Ankara shapefile data to the map
ankara_map <- ankara_map %>%
  addPolygons(data = ankara, fillOpacity = 0.5, color = "black", weight = 1)

# Display the map
ankara_map

# District data with Average Rental and Sale Prices
district_data <- data.frame(
  District = c("Altındağ", "Gölbaşı", "Çankaya", "Çubuk", "Etimesgut", "Keçiören", 
               "Mamak", "Polatlı", "Pursaklar", "Sincan", "Yenimahalle"),
  Longitude = c(32.8544, 32.6223, 32.8644, 33.0099, 32.8556, 32.9164, 
                32.8639, 31.4060, 32.6211, 32.6251, 32.7836),
  Latitude = c(39.9182, 39.8925, 39.9334, 40.1382, 39.9508, 39.9847, 
               39.9956, 39.9836, 40.0741, 39.9820, 39.9708),
  Average_Rental_Price = c(13165, 33657, 24984, 8170, 16839, 14052, 12469, 9502, 15729, 13017, 18214),
  Average_Sale_Price = c(2350437, 2997151, 3385259, 1961788, 3480111, 2668895, 2081773, 1980181, 2815986, 2212316, 3540097)
)

# Create a spatial data frame
district_sf <- st_as_sf(district_data, coords = c("Longitude", "Latitude"), crs = 4326)

# Create a basic leaflet map
ankara_map <- leaflet() %>%
  addTiles() %>%
  setView(lng = 32.8597, lat = 39.9334, zoom = 10)  # Adjust zoom level as needed

# Add markers for each district to the map
ankara_map <- ankara_map %>%
  addMarkers(data = district_sf, 
             popup = ~paste("District: ", District, 
                            "<br>Avg Rental Price: TL", Average_Rental_Price,
                            "<br>Avg Sale Price: TL", Average_Sale_Price))

# Display the map
ankara_map


shp <- st_read("C:\\Users\\LENOVO\\Desktop\\413 Proje\\proje\\shp_file")

