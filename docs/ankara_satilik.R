#Satılık
#Istanbul

library(rvest)
library(stringr)
library(purrr)

# İlan verilerini çeken fonksiyon
get_ilan_verisi <- function(url) {
  page <- read_html(url)
  loc <- gsub("https://www.hepsiemlak.com/|\\W", "", url)
  ilan_etiketleri <- html_nodes(page, ".list-view-line")
  ilan_verisi <- data.frame(
    Baslik = html_text(html_nodes(ilan_etiketleri, "h3")),
    Oda_Sayisi = html_text(html_nodes(ilan_etiketleri, ".houseRoomCount")),
    Metrekare = html_text(html_nodes(ilan_etiketleri, ".squareMeter")),
    Bina_Yasi = html_text(html_nodes(ilan_etiketleri, ".buildingAge")),
    Fiyat = html_text(html_nodes(ilan_etiketleri, ".list-view-price")),
    Konum = loc
  )
  return(ilan_verisi)
}

# İlan sayfalarını çeken fonksiyon
get_ilan_sayfalari <- function(base_url) {
  page <- read_html(base_url)
  # Sayfa sayısını bul
  sayfa_sayisi <- as.numeric(html_text(html_nodes(page, ".page-info")))
  
  # Tüm sayfaları dolaş
  urls <- map_chr(1:50, function(page_num) {
    paste0(base_url, "&page=", page_num)
  })
  
  # Her bir sayfa için ilan verilerini çek
  ilanlar <- map_df(urls, function(url) {
    Sys.sleep(3)  # 5 saniye bekleme
    get_ilan_verisi(url)
  })
  
  return(ilanlar)
}


# İşlem yapılacak URL'leri tanımla
url_listesi_satilik <- #satilik
  
  # Gerekli kütüphaneleri yükleyelim
  library(rvest)
library(stringr)
library(purrr)
library(data.table)

# İlan verilerini çeken fonksiyon
get_ilan_verisi <- function(url) {
  page <- read_html(url)
  loc <- gsub("https://www.hepsiemlak.com/|\\W", "", url)
  ilan_etiketleri <- html_nodes(page, ".list-view-line")
  ilan_verisi <- data.table(
    Baslik = html_text(html_nodes(ilan_etiketleri, "h3")),
    Oda_Sayisi = html_text(html_nodes(ilan_etiketleri, ".houseRoomCount")),
    Metrekare = html_text(html_nodes(ilan_etiketleri, ".squareMeter")),
    Bina_Yasi = html_text(html_nodes(ilan_etiketleri, ".buildingAge")),
    Fiyat = html_text(html_nodes(ilan_etiketleri, ".list-view-price")),
    Konum = loc
  )
  return(ilan_verisi)
}

# İlan sayfalarını çeken fonksiyon
get_ilan_sayfalari <- function(base_url) {
  page <- read_html(base_url)
  # Sayfa sayısını bul
  sayfa_sayisi <- as.numeric(html_text(html_nodes(page, ".page-info")))
  
  # Tüm sayfaları dolaş
  urls <- map_chr(1:390, function(page_num) {
    paste0(base_url, "?page=", page_num)
  })
  
  # Her bir sayfa için ilan verilerini çek
  ilanlar <- map_df(urls, function(url) {
    Sys.sleep(3)  # 5 saniye bekleme
    get_ilan_verisi(url)
  })
  
  return(ilanlar)
}


# İşlem yapılacak URL'leri tanımla
url_listesi <- "https://www.hepsiemlak.com/ankara-satilik?p37=120403"

# Tüm URL'leri ve sayfaları döngü içinde işle
tum_ilanlar_ankara <- map_df(url_listesi, get_ilan_sayfalari)

library(dplyr)


# Fiyat ve Metrekare filtreleme
tum_ilanlar_filitreli <- tum_ilanlar %>%
  filter(
    between(as.numeric(str_replace_all(Fiyat, "\\D", "")), 10000, 100000000),
    between(as.numeric(str_replace_all(Metrekare, "\\D", "")), 30, 850)
  ) 


library(httr)

headers <- c(
  "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
)

response <- httr::GET(url, httr::add_headers(.headers=headers))

library(writexl)

write_xlsx(tum_ilanlar_filitreli, "tum_satilik_filitreli.xlsx")


# Tüm URL'leri ve sayfaları döngü içinde işle
tum_ilanlar <- map_df(url_listesi, get_ilan_sayfalari)
