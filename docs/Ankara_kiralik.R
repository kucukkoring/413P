##Ankara Kiralık

# Load necessary libraries
library(rvest)
library(httr)
library(xml2)
library(writexl)

rm(list = ls())

english_provinces <- c("ankara")

# User agent to mimic a browser request
user_agent <- "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7"

# Initialize data storage
data <- data.frame()

# Loop through the provinces
for (i in english_provinces) {
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
        
        data <- rbind(data, data.frame(Price = price, Size = size, Rooms = rooms, Province = i, Date = date))
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
          
          data <- rbind(data, data.frame(Price = price, Size = size, Rooms = rooms, Province = i, Date = date))
        }, silent = TRUE)
      }
    }
    
    print(paste(i, "is done"))
  }, silent = TRUE)
}

# Output the data

