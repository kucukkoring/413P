## required Packages
if (!require(devtools)) install.packages('devtools')

library(devtools)

if (!require(CBRT)) install_github("etaymaz/CBRT")
library(CBRT)

if (!require(dplyr)) install.packages("dplyr")
library(dplyr)

if (!require(tidyr)) install.packages("tidyr")
library(tidyr)

## Veri çek
kfe <- getDataSeries(c('TP.HKFE01','TP.HKFE02','TP.HKFE03','TP.HKFE04','TP.HKFE05','TP.HKFE06','TP.HKFE07','TP.HKFE08','TP.HKFE09','TP.HKFE10','TP.HKFE11','TP.HKFE12','TP.HKFE13','TP.HKFE14','TP.HKFE15','TP.HKFE16','TP.HKFE17','TP.HKFE18','TP.HKFE19','TP.HKFE20','TP.HKFE21','TP.HKFE22','TP.HKFE23','TP.HKFE24','TP.HKFE25','TP.HKFE26','TP.HKFE27'), CBRTKey = '5rUjrDHw0I', freq = 3, startDate="01-01-2000")
nuts2_regions <- c("Tarih,", "Türkiye", "İstanbul", "Ankara", "İzmir", "Edirne, Kırklarelİ, Tekirdağ", "Balıkesir, Çanakkale", "Aydın, Denizli, Muğla", "Afyonkarahisar, Kütahya, Manisa, Uşak", "Bursa, Eskişehir, Bilecik", "Bolu, Kocaeli, Sakarya, Yalova, Düzce", "Konya, Karaman", "Antalya, Burdur, Isparta", "Adana, Mersin", "Hatay, Kahramanmaraş, Osmaniye", "Nevşehir, Niğde, Aksaray, Kırıkkale, Kırşehir", "Kayseri, Sivas, Yozgat", "Zonguldak, Bartın, Karabük", "Çankırı, Kastamonu, Sinop", "Samsun, Çorum, Amasya, Tokat", "Artvin, Giresun, Gümüşhane, Ordu, Rize, Trabzon", "Erzurum, Erzincan, Bayburt", "Ağrı, Ardahan, Kars, Iğdır", "Bingöl, Elazığ, Malatya, Tunceli", "Van, Bitlis, Hakkari, Muş", "Kilis, Adıyaman, Gaziantep", "Diyarbakır, Şanlıurfa", "Batman, Mardin, Siirt, Şırnak")
nuts2_regions
colnames(kfe) <- nuts2_regions
k_satis1 <- getDataSeries(c("TP.AKONUTSAT3.TOPLAM", "TP.AKONUTSAT3.T1", "TP.AKONUTSAT3.T2","TP.AKONUTSAT3.K3", "TP.AKONUTSAT3.T4", "TP.AKONUTSAT3.T5","TP.AKONUTSAT3.T6","TP.AKONUTSAT3.T7","TP.AKONUTSAT3.T8","TP.AKONUTSAT3.T9","TP.AKONUTSAT3.T10","TP.AKONUTSAT3.T11","TP.AKONUTSAT3.T12","TP.AKONUTSAT3.T13","TP.AKONUTSAT3.T14","TP.AKONUTSAT3.T15","TP.AKONUTSAT3.T16","TP.AKONUTSAT3.T17","TP.AKONUTSAT3.T18","TP.AKONUTSAT3.T19","TP.AKONUTSAT3.T20","TP.AKONUTSAT3.T21","TP.AKONUTSAT3.T22","TP.AKONUTSAT3.T23","TP.AKONUTSAT3.T24","TP.AKONUTSAT3.T25","TP.AKONUTSAT3.T26","TP.AKONUTSAT3.T27","TP.AKONUTSAT3.T28","TP.AKONUTSAT3.T29","TP.AKONUTSAT3.T30","TP.AKONUTSAT3.T31","TP.AKONUTSAT3.T32","TP.AKONUTSAT3.T33","TP.AKONUTSAT3.T34","TP.AKONUTSAT3.T35","TP.AKONUTSAT3.T36","TP.AKONUTSAT3.T37","TP.AKONUTSAT3.T38","TP.AKONUTSAT3.T39","TP.AKONUTSAT3.T40","TP.AKONUTSAT3.T41","TP.AKONUTSAT3.T42","TP.AKONUTSAT3.T43","TP.AKONUTSAT3.T44","TP.AKONUTSAT3.T45","TP.AKONUTSAT3.T46","TP.AKONUTSAT3.T47","TP.AKONUTSAT3.T48","TP.AKONUTSAT3.T49","TP.AKONUTSAT3.T50","TP.AKONUTSAT3.T51","TP.AKONUTSAT3.T52","TP.AKONUTSAT3.T53","TP.AKONUTSAT3.T54","TP.AKONUTSAT3.T55","TP.AKONUTSAT3.T56","TP.AKONUTSAT3.T57","TP.AKONUTSAT3.T58","TP.AKONUTSAT3.T59","TP.AKONUTSAT3.T60","TP.AKONUTSAT3.T61","TP.AKONUTSAT3.T62","TP.AKONUTSAT3.T63","TP.AKONUTSAT3.T64","TP.AKONUTSAT3.T65","TP.AKONUTSAT3.T66","TP.AKONUTSAT3.T67","TP.AKONUTSAT3.T68","TP.AKONUTSAT3.T69","TP.AKONUTSAT3.T70","TP.AKONUTSAT3.T71","TP.AKONUTSAT3.T72","TP.AKONUTSAT3.T73","TP.AKONUTSAT3.T74","TP.AKONUTSAT3.T75","TP.AKONUTSAT3.T76","TP.AKONUTSAT3.T77","TP.AKONUTSAT3.T78","TP.AKONUTSAT3.T79","TP.AKONUTSAT3.T80","TP.AKONUTSAT3.T81"), CBRTKey = '5rUjrDHw0I', freq = 3, startDate="01-01-2000")
k_satis2 <- getDataSeries(c("TP.AKONUTSAT4.TOPLAM", "TP.AKONUTSAT4.T1", "TP.AKONUTSAT4.T2","TP.AKONUTSAT4.T3", "TP.AKONUTSAT4.K4", "TP.AKONUTSAT4.T5","TP.AKONUTSAT4.T6","TP.AKONUTSAT4.T7","TP.AKONUTSAT4.T8","TP.AKONUTSAT4.T9","TP.AKONUTSAT4.T10","TP.AKONUTSAT4.T11","TP.AKONUTSAT4.T12","TP.AKONUTSAT4.T13","TP.AKONUTSAT4.T14","TP.AKONUTSAT4.T15","TP.AKONUTSAT4.T16","TP.AKONUTSAT4.T17","TP.AKONUTSAT4.T18","TP.AKONUTSAT4.T19","TP.AKONUTSAT4.T20","TP.AKONUTSAT4.T21","TP.AKONUTSAT4.T22","TP.AKONUTSAT4.T23","TP.AKONUTSAT4.T24","TP.AKONUTSAT4.T25","TP.AKONUTSAT4.T26","TP.AKONUTSAT4.T27","TP.AKONUTSAT4.T28","TP.AKONUTSAT4.T29","TP.AKONUTSAT4.T30","TP.AKONUTSAT4.T31","TP.AKONUTSAT4.T32","TP.AKONUTSAT4.T33","TP.AKONUTSAT4.T34","TP.AKONUTSAT4.T35","TP.AKONUTSAT4.T36","TP.AKONUTSAT4.T37","TP.AKONUTSAT4.T38","TP.AKONUTSAT4.T39","TP.AKONUTSAT4.T40","TP.AKONUTSAT4.T41","TP.AKONUTSAT4.T42","TP.AKONUTSAT4.T43","TP.AKONUTSAT4.T44","TP.AKONUTSAT4.T45","TP.AKONUTSAT4.T46","TP.AKONUTSAT4.T47","TP.AKONUTSAT4.T48","TP.AKONUTSAT4.T49","TP.AKONUTSAT4.T50","TP.AKONUTSAT4.T51","TP.AKONUTSAT4.T52","TP.AKONUTSAT4.T53","TP.AKONUTSAT4.T54","TP.AKONUTSAT4.T55","TP.AKONUTSAT4.T56","TP.AKONUTSAT4.T57","TP.AKONUTSAT4.T58","TP.AKONUTSAT4.T59","TP.AKONUTSAT4.T60","TP.AKONUTSAT4.T61","TP.AKONUTSAT4.T62","TP.AKONUTSAT4.T63","TP.AKONUTSAT4.T64","TP.AKONUTSAT4.T65","TP.AKONUTSAT4.T66","TP.AKONUTSAT4.T67","TP.AKONUTSAT4.T68","TP.AKONUTSAT4.T69","TP.AKONUTSAT4.T70","TP.AKONUTSAT4.T71","TP.AKONUTSAT4.T72","TP.AKONUTSAT4.T73","TP.AKONUTSAT4.T74","TP.AKONUTSAT4.T75","TP.AKONUTSAT4.T76","TP.AKONUTSAT4.T77","TP.AKONUTSAT4.T78","TP.AKONUTSAT4.T79","TP.AKONUTSAT4.T80","TP.AKONUTSAT4.T81"), CBRTKey = '5rUjrDHw0I', freq = 3, startDate="01-01-2000")
konut_faiz <- getDataSeries("TP.KTF12", CBRTKey = '5rUjrDHw0I', freq = 3, startDate="01-01-2000")
setnames(konut_faiz, "time", "Tarih")
setnames(konut_faiz, "TP.KTF12", "Bankalarca Açılan Kredilere Uygulanan Ağırlıklı Ortalama Faiz Oranları (Akım Veriler,%)(Haftalık)")
pös_adet <- getDataSeries("TP.OSGMPOS.ADET.Y01", CBRTKey = '5rUjrDHw0I', freq = 3, startDate="22-11-2019")
pös_tutar <- getDataSeries("TP.OSGMPOS.TUTAR.Y01", CBRTKey = '5rUjrDHw0I', freq = 3, startDate="22-11-2019")
il_isim_satis <- c("Tarih", "Toplam İlk El Satış", 
                                  "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Aksaray", "Amasya", "Ankara", "Antalya",
                                  "Ardahan", "Artvin", "Aydın", "Balıkesir", "Bartın", "Batman", "Bayburt", "Bilecik", 
                                  "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", 
                                  "Denizli", "Diyarbakır", "Düzce", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir",
                                  "Gaziantep", "Giresun", "Gümüşhane", "Hakkâri", "Hatay", "Iğdır", "Isparta", "İstanbul", 
                                  "İzmir", "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri", 
                                  "Kilis", "Kırıkkale", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya",
                                  "Malatya", "Manisa", "Mardin", "Mersin", "Muğla", "Muş", "Nevşehir", "Niğde", 
                                  "Ordu", "Osmaniye", "Rize", "Sakarya", "Samsun", "Şanlıurfa", "Siirt", "Sinop", 
                                  "Sivas", "Şırnak", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", 
                                  "Yalova", "Yozgat", "Zonguldak")


colnames(k_satis1) <- il_isim_satis
colnames(k_satis2) <- il_isim_satis


View(pös_adet)
View(pös_tutar)




k_satis1_bolge <- k_satis1 %>%
  mutate(
    Edirne_Kırklareli_Tekirdağ = Edirne + Kırklareli + Tekirdağ,
    Balıkesir_Çanakkale = Balıkesir + Çanakkale,
    Aydın_Denizli_Muğla = Aydın + Denizli + Muğla,
    Manisa_Afyonkarahisar_Kütahya_Uşak = Manisa + Afyonkarahisar + Kütahya + Uşak,
    Bursa_Eskişehir_Bilecik = Bursa + Eskişehir + Bilecik,
    Kocaeli_Sakarya_Düzce_Bolu_Yalova = Kocaeli + Sakarya + Düzce + Bolu + Yalova,
    Kırıkkale_Aksaray_Niğde_Nevşehir_Kırşehir = Kırıkkale + Aksaray + Niğde + Nevşehir + Kırşehir,
    Zonguldak_Karabük_Bartın = Zonguldak + Karabük + Bartın,
    Samsun_Tokat_Çorum_Amasya = Samsun + Tokat + Çorum + Amasya,
    Erzurum_Erzincan_Bayburt = Erzurum + Erzincan + Bayburt,
    Malatya_Elazığ_Bingöl_Tunceli = Malatya + Elazığ + Bingöl + Tunceli,
    Gaziantep_Adiyaman_Kilis = Gaziantep + Adıyaman + Kilis,
    Mardin_Batman_Şırnak_Siirt = Mardin + Batman + Şırnak + Siirt,
    Konya_Karaman = Konya + Karaman,
    Antalya_Isparta_Burdur = Antalya + Isparta + Burdur,
    Adana_Mersin = Adana + Mersin,
    Hatay_Kahramanmaraş_Osmaniye = Hatay + Kahramanmaraş + Osmaniye,
    Kayseri_Sivas_Yozgat = Kayseri + Sivas + Yozgat,
    Kastamonu_Çankırı_Sinop = Kastamonu + Çankırı + Sinop,
    Trabzon_Ordu_Giresun_Rize_Artvin_Gümüşhane = Trabzon + Ordu + Giresun + Rize + Artvin + Gümüşhane,
    Ağrı_Kars_Iğdır_Ardahan = Ağrı + Kars + Iğdır + Ardahan,
    Van_Muş_Bitlis_Hakkâri = Van + Muş + Bitlis + Hakkâri,
    Şanlıurfa_Diyarbakır = Şanlıurfa + Diyarbakır,
    İstanbul = İstanbul,
    İzmir = İzmir,
    Ankara = Ankara
  ) %>%
  select("Tarih", "Toplam İlk El Satış", Edirne_Kırklareli_Tekirdağ, Balıkesir_Çanakkale, Aydın_Denizli_Muğla, Manisa_Afyonkarahisar_Kütahya_Uşak, Bursa_Eskişehir_Bilecik, Kocaeli_Sakarya_Düzce_Bolu_Yalova, Kırıkkale_Aksaray_Niğde_Nevşehir_Kırşehir, Zonguldak_Karabük_Bartın, Samsun_Tokat_Çorum_Amasya, Erzurum_Erzincan_Bayburt, Malatya_Elazığ_Bingöl_Tunceli, Gaziantep_Adiyaman_Kilis, Mardin_Batman_Şırnak_Siirt, Konya_Karaman, Antalya_Isparta_Burdur, Adana_Mersin, Hatay_Kahramanmaraş_Osmaniye, Kayseri_Sivas_Yozgat, Kastamonu_Çankırı_Sinop, Trabzon_Ordu_Giresun_Rize_Artvin_Gümüşhane, Ağrı_Kars_Iğdır_Ardahan, Van_Muş_Bitlis_Hakkâri, Şanlıurfa_Diyarbakır, İstanbul, İzmir, Ankara)
         
View(k_satis1_bolge)

k_satis2_bolge <- k_satis2 %>%
  mutate(
    Edirne_Kırklareli_Tekirdağ = Edirne + Kırklareli + Tekirdağ,
    Balıkesir_Çanakkale = Balıkesir + Çanakkale,
    Aydın_Denizli_Muğla = Aydın + Denizli + Muğla,
    Manisa_Afyonkarahisar_Kütahya_Uşak = Manisa + Afyonkarahisar + Kütahya + Uşak,
    Bursa_Eskişehir_Bilecik = Bursa + Eskişehir + Bilecik,
    Kocaeli_Sakarya_Düzce_Bolu_Yalova = Kocaeli + Sakarya + Düzce + Bolu + Yalova,
    Kırıkkale_Aksaray_Niğde_Nevşehir_Kırşehir = Kırıkkale + Aksaray + Niğde + Nevşehir + Kırşehir,
    Zonguldak_Karabük_Bartın = Zonguldak + Karabük + Bartın,
    Samsun_Tokat_Çorum_Amasya = Samsun + Tokat + Çorum + Amasya,
    Erzurum_Erzincan_Bayburt = Erzurum + Erzincan + Bayburt,
    Malatya_Elazığ_Bingöl_Tunceli = Malatya + Elazığ + Bingöl + Tunceli,
    Gaziantep_Adiyaman_Kilis = Gaziantep + Adıyaman + Kilis,
    Mardin_Batman_Şırnak_Siirt = Mardin + Batman + Şırnak + Siirt,
    Konya_Karaman = Konya + Karaman,
    Antalya_Isparta_Burdur = Antalya + Isparta + Burdur,
    Adana_Mersin = Adana + Mersin,
    Hatay_Kahramanmaraş_Osmaniye = Hatay + Kahramanmaraş + Osmaniye,
    Kayseri_Sivas_Yozgat = Kayseri + Sivas + Yozgat,
    Kastamonu_Çankırı_Sinop = Kastamonu + Çankırı + Sinop,
    Trabzon_Ordu_Giresun_Rize_Artvin_Gümüşhane = Trabzon + Ordu + Giresun + Rize + Artvin + Gümüşhane,
    Ağrı_Kars_Iğdır_Ardahan = Ağrı + Kars + Iğdır + Ardahan,
    Van_Muş_Bitlis_Hakkâri = Van + Muş + Bitlis + Hakkâri,
    Şanlıurfa_Diyarbakır = Şanlıurfa + Diyarbakır,
    İstanbul = İstanbul,
    İzmir = İzmir,
    Ankara = Ankara
  ) %>%
  select("Tarih", "Toplam İlk El Satış", Edirne_Kırklareli_Tekirdağ, Balıkesir_Çanakkale, Aydın_Denizli_Muğla, Manisa_Afyonkarahisar_Kütahya_Uşak, Bursa_Eskişehir_Bilecik, Kocaeli_Sakarya_Düzce_Bolu_Yalova, Kırıkkale_Aksaray_Niğde_Nevşehir_Kırşehir, Zonguldak_Karabük_Bartın, Samsun_Tokat_Çorum_Amasya, Erzurum_Erzincan_Bayburt, Malatya_Elazığ_Bingöl_Tunceli, Gaziantep_Adiyaman_Kilis, Mardin_Batman_Şırnak_Siirt, Konya_Karaman, Antalya_Isparta_Burdur, Adana_Mersin, Hatay_Kahramanmaraş_Osmaniye, Kayseri_Sivas_Yozgat, Kastamonu_Çankırı_Sinop, Trabzon_Ordu_Giresun_Rize_Artvin_Gümüşhane, Ağrı_Kars_Iğdır_Ardahan, Van_Muş_Bitlis_Hakkâri, Şanlıurfa_Diyarbakır, İstanbul, İzmir, Ankara)

