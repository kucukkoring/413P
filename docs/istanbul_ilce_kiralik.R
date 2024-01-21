##İstanbul Kiralık

# Load necessary libraries
library(rvest)
library(httr)
library(xml2)
library(writexl)
library(dplyr)
library(readr)

rm(list = ls())

istanbul_ilceler <- c("adalar", "arnavutkoy", "atasehir", "avcilar", "bagcilar", "bahcelievler", "bakirkoy", "basaksehir", "bayrampasa", "besiktas", "beykoz", "beylikduzu", "beyoglu", "buyukcekmece", "catalca", "cekmekoy", "esenler", "esenyurt", "eyup", "fatih", "gaziosmanpasa", "gungoren", "kadikoy", "kagithane", "kartal", "kucukcekmece", "maltepe", "pendik", "sancaktepe", "sariyer","silivri", "sultanbeyli", "sultangazi", "sisli", "tuzla", "umraniye", "uskudar", "zeytinburnu")

# User agent to mimic a browser request
user_agent <- "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7"

# Initialize data storage
istanbul_ilce_kiralik <- data.frame()

# Loop through the provinces
for (i in istanbul_ilceler) {
  try({
    Sys.sleep(5)
    
    # Construct the URL
    url <- paste0("https://www.hepsiemlak.com/en/", i, "-kiralik")
    
    # Perform the HTTP request
    page <- GET(url, user_agent(user_agent))
    content <- read_html(page)
    
    # Find the last page number
    scroller <- html_nodes(content, "ul.he-pagination__links")
    last_page <- html_nodes(scroller, "li:last-child a") %>% html_attr("href")
    last_page <- as.numeric(strsplit(last_page, "=")[[1]][2])
    pages <- 2:last_page
    
    # Extract listings
    list_view <- html_nodes(content, "ul.list-items-container")
    list_items <- html_nodes(list_view, "li")
    
    for (q in 1:length(list_items)) {
      try({
        price <- html_nodes(list_items[q], "span.list-view-price") %>% html_text() %>% trimws()
        size <- html_nodes(list_items[q], "span.celly.squareMeter.list-view-size") %>% html_text() %>% trimws()
        rooms <- html_nodes(list_items[q], "span.celly.houseRoomCount") %>% html_text() %>% trimws()
        date <- html_nodes(list_items[q], "span.list-view-date") %>% html_text() %>% trimws()
        
        istanbul_ilce_kiralik <- rbind(istanbul_ilce_kiralik, data.frame(Price = price, Size = size, Rooms = rooms, Province = i, Date = date))
      }, silent = TRUE)
    }
    
    # Print status
    print(paste(i, "page 1 is done >>>", last_page))
    
    # Loop through additional pages
    for (f in pages) {
      print(paste(i, "page", f, "is done of", last_page))
      Sys.sleep(5)
      
      url <- paste0("https://www.hepsiemlak.com/en/", i, "-kiralik?page=", f)
      page <- GET(url, user_agent(user_agent))
      content <- read_html(page)
      list_view <- html_nodes(content, "ul.list-items-container")
      list_items <- html_nodes(list_view, "li")
      
      for (j in 1:length(list_items)) {
        try({
          price <- html_nodes(list_items[j], "span.list-view-price") %>% html_text() %>% trimws()
          size <- html_nodes(list_items[j], "span.celly.squareMeter.list-view-size") %>% html_text() %>% trimws()
          rooms <- html_nodes(list_items[j], "span.celly.houseRoomCount") %>% html_text() %>% trimws()
          date <- html_nodes(list_items[q], "span.list-view-date") %>% html_text() %>% trimws()
          
          istanbul_ilce_kiralik <- rbind(istanbul_ilce_kiralik, data.frame(Price = price, Size = size, Rooms = rooms, Province = i, Date = date))
        }, silent = TRUE)
      }
    }
    
    print(paste(i, "is done"))
  }, silent = TRUE)
}

# Output the data
istanbul_ilce_kiralik$Price <- as.numeric(gsub("TRY|\\.", "", istanbul_ilce_kiralik$Price))
summary(istanbul_ilce_kiralik$Price)
istanbul_ilce_kiralik <- istanbul_ilce_kiralik[istanbul_ilce_kiralik$Price >= 500 & ankara_kiralik$Price <= 300000, ]
summary(istanbul_ilce_kiralik$Price)
istanbul_ilce_kiralik$Size <- as.numeric(gsub("m²|\\.", "", istanbul_ilce_kiralik$Size))
summary(istanbul_ilce_kiralik$Size)
istanbul_ilce_kiralik$Price_Per_Size <- istanbul_ilce_kiralik$Price / istanbul_ilce_kiralik$Size
summary(istanbul_ilce_kiralik$Price_Per_Size)
istanbul_ilce_kiralik$Date <- as.Date(istanbul_ilce_kiralik$Date)
istanbul_ilce_kiralik$Month <- format(istanbul_ilce_kiralik$Date, "%m")
istanbul_ilce_kiralik$Year <- format(istanbul_ilce_kiralik$Date, "%Y")
result1 <- aggregate(Price_Per_Size ~ Year + Month, data = istanbul_ilce_kiralik, FUN = mean)
result1


write_csv(istanbul_ilce_kiralik, "Istanbul_Kiralik.csv")
