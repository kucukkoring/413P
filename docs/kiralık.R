#Istanbul-ankara haftalık Kiralık

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
  urls <- map_chr(1:6, function(page_num) {
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
  "https://www.hepsiemlak.com/adalar-kiralik?p37=120403",
  "https://www.hepsiemlak.com/arnavutkoy-kiralik?p37=120403",
  "https://www.hepsiemlak.com/atasehir-kiralik?p37=120403",
  "https://www.hepsiemlak.com/avcilar-kiralik?p37=120403",
  "https://www.hepsiemlak.com/bagcilar-kiralik?p37=120403",
  "https://www.hepsiemlak.com/bahcelievler-kiralik?p37=120403",
  "https://www.hepsiemlak.com/bakirkoy-kiralik?p37=120403",
  "https://www.hepsiemlak.com/basaksehir-kiralik?p37=120403",
  "https://www.hepsiemlak.com/bayrampasa-kiralik?p37=120403",
  "https://www.hepsiemlak.com/besiktas-kiralik?p37=120403",
  "https://www.hepsiemlak.com/beykoz-kiralik?p37=120403",
  "https://www.hepsiemlak.com/beylikduzu-kiralik?p37=120403",
  "https://www.hepsiemlak.com/beyoglu-kiralik?p37=120403",
  "https://www.hepsiemlak.com/buyukcekmece-kiralik?p37=120403",
  "https://www.hepsiemlak.com/catalca-kiralik?p37=120403",
  "https://www.hepsiemlak.com/cekmekoy-kiralik?p37=120403",
  "https://www.hepsiemlak.com/esenler-kiralik?p37=120403",
  "https://www.hepsiemlak.com/esenyurt-kiralik?p37=120403",
  "https://www.hepsiemlak.com/eyupsultan-kiralik?p37=120403",
  "https://www.hepsiemlak.com/fatih-kiralik?p37=120403",
  "https://www.hepsiemlak.com/gaziosmanpasa-kiralik?p37=120403",
  "https://www.hepsiemlak.com/gungoren-kiralik?p37=120403",
  "https://www.hepsiemlak.com/kadikoy-kiralik?p37=120403",
  "https://www.hepsiemlak.com/kagithane-kiralik?p37=120403",
  "https://www.hepsiemlak.com/kartal-kiralik?p37=120403",
  "https://www.hepsiemlak.com/kucukcekmece-kiralik?p37=120403",
  "https://www.hepsiemlak.com/maltepe-kiralik?p37=120403",
  "https://www.hepsiemlak.com/pendik-kiralik?p37=120403",
  "https://www.hepsiemlak.com/sancaktepe-kiralik?p37=120403",
  "https://www.hepsiemlak.com/sariyer-kiralik?p37=120403",
  "https://www.hepsiemlak.com/sile-kiralik?p37=120403",
  "https://www.hepsiemlak.com/silivri-kiralik?p37=120403",
  "https://www.hepsiemlak.com/sisli-kiralik?p37=120403",
  "https://www.hepsiemlak.com/sultanbeyli-kiralik?p37=120403",
  "https://www.hepsiemlak.com/sultangazi-kiralik?p37=120403",
  "https://www.hepsiemlak.com/tuzla-kiralik?p37=120403",
  "https://www.hepsiemlak.com/umraniye-kiralik?p37=120403",
  "https://www.hepsiemlak.com/uskudar-kiralik?p37=120403",
  "https://www.hepsiemlak.com/zeytinburnu-kiralik?p37=120403",
  "https://www.hepsiemlak.com/ankara-kiralik?p37=120403"
)

# Tüm URL'leri ve sayfaları döngü içinde işle
tum_ilanlar <- map_df(url_listesi, get_ilan_sayfalari)

library(dplyr)


# Fiyat ve Metrekare filtreleme
tum_ilanlar_filitreli <- tum_ilanlar %>%
  filter(
    between(as.numeric(str_replace_all(Fiyat, "\\D", "")), 500, 100000),
    between(as.numeric(str_replace_all(Metrekare, "\\D", "")), 30, 450)
  ) 


library(httr)

headers <- c(
  "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
)

response <- httr::GET(url, httr::add_headers(.headers=headers))

