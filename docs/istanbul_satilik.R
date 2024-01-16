#İstanbul satilik

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
  urls <- map_chr(1:10, function(page_num) {
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
url_listesi <- c(
  "https://www.hepsiemlak.com/adalar-satilik?p37=120403",
  "https://www.hepsiemlak.com/arnavutkoy-satilik?p37=120403",
  "https://www.hepsiemlak.com/atasehir-satilik?p37=120403",
  "https://www.hepsiemlak.com/avcilar-satilik?p37=120403",
  "https://www.hepsiemlak.com/bagcilar-satilik?p37=120403",
  "https://www.hepsiemlak.com/bahcelievler-satilik?p37=120403",
  "https://www.hepsiemlak.com/bakirkoy-satilik?p37=120403",
  "https://www.hepsiemlak.com/basaksehir-satilik?p37=120403",
  "https://www.hepsiemlak.com/bayrampasa-satilik?p37=120403",
  "https://www.hepsiemlak.com/besiktas-satilik?p37=120403",
  "https://www.hepsiemlak.com/beykoz-satilik?p37=120403",
  "https://www.hepsiemlak.com/beylikduzu-satilik?p37=120403",
  "https://www.hepsiemlak.com/beyoglu-satilik?p37=120403",
  "https://www.hepsiemlak.com/buyukcekmece-satilik?p37=120403",
  "https://www.hepsiemlak.com/catalca-satilik?p37=120403",
  "https://www.hepsiemlak.com/cekmekoy-satilik?p37=120403",
  "https://www.hepsiemlak.com/esenler-satilik?p37=120403",
  "https://www.hepsiemlak.com/esenyurt-satilik?p37=120403",
  "https://www.hepsiemlak.com/eyupsultan-satilik?p37=120403",
  "https://www.hepsiemlak.com/fatih-satilik?p37=120403",
  "https://www.hepsiemlak.com/gaziosmanpasa-satilik?p37=120403",
  "https://www.hepsiemlak.com/gungoren-satilik?p37=120403",
  "https://www.hepsiemlak.com/kadikoy-satilik?p37=120403",
  "https://www.hepsiemlak.com/kagithane-satilik?p37=120403",
  "https://www.hepsiemlak.com/kartal-satilik?p37=120403",
  "https://www.hepsiemlak.com/kucukcekmece-satilik?p37=120403",
  "https://www.hepsiemlak.com/maltepe-satilik?p37=120403",
  "https://www.hepsiemlak.com/pendik-satilik?p37=120403",
  "https://www.hepsiemlak.com/sancaktepe-satilik?p37=120403",
  "https://www.hepsiemlak.com/sariyer-satilik?p37=120403",
  "https://www.hepsiemlak.com/sile-satilik?p37=120403",
  "https://www.hepsiemlak.com/silivri-satilik?p37=120403",
  "https://www.hepsiemlak.com/sisli-satilik?p37=120403",
  "https://www.hepsiemlak.com/sultanbeyli-satilik?p37=120403",
  "https://www.hepsiemlak.com/sultangazi-satilik?p37=120403",
  "https://www.hepsiemlak.com/tuzla-satilik?p37=120403",
  "https://www.hepsiemlak.com/umraniye-satilik?p37=120403",
  "https://www.hepsiemlak.com/uskudar-satilik?p37=120403",
  "https://www.hepsiemlak.com/zeytinburnu-satilik?p37=120403"
)

# Tüm URL'leri ve sayfaları döngü içinde işle
tum_ilanlar <- map_df(url_listesi, get_ilan_sayfalari)

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