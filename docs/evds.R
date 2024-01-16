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
kfe <- getDataSeries(c('TP.HKFE02','TP.HKFE03'), CBRTKey = '5rUjrDHw0I', freq = 3, startDate="01-01-2000")
kfe_columns <- c("Tarih", "İstanbul", "Ankara")
colnames(kfe) <- kfe_columns 
konut_faiz <- getDataSeries("TP.KTF12", CBRTKey = '5rUjrDHw0I', freq = 3, startDate="01-01-2000")
setnames(konut_faiz, "time", "Tarih")
setnames(konut_faiz, "TP.KTF12", "Bankalarca Açılan Kredilere Uygulanan Ağırlıklı Ortalama Faiz Oranları (Akım Veriler,%)(Haftalık)")

