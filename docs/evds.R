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
kfe_ist <- getDataSeries(c('TP.HKFE02'), CBRTKey = '5rUjrDHw0I', freq = 3, startDate="01-01-2013")
kfe_ank <- getDataSeries(c('TP.HKFE03'), CBRTKey = '5rUjrDHw0I', freq = 3, startDate="01-01-2013")
setnames(kfe_ist, "time", "Date")
setnames(kfe_ist, "TP.HKFE02", "Istanbul_House_Price_Index")
setnames(kfe_ank, "time", "Date")
setnames(kfe_ank, "TP.HKFE03", "Ankara_House_Price_Index")
konut_faiz <- getDataSeries("TP.KTF12", CBRTKey = '5rUjrDHw0I', freq = 5, startDate="01-01-2013")
setnames(konut_faiz, "time", "Date")
setnames(konut_faiz, "TP.KTF12", "Housing_Interest_Rate")
konut_satis_ist1 <- getDataSeries("TP.AKONUTSAT3.T40", CBRTKey = '5rUjrDHw0I', freq = 5, startDate="01-01-2013") 
setnames(konut_satis_ist1, "time", "Date")
setnames(konut_satis_ist1, "TP.AKONUTSAT3.T40", "Istanbul_First_Hand-House_Sales")
konut_satis_ist2 <- getDataSeries("TP.AKONUTSAT4.T40", CBRTKey = '5rUjrDHw0I', freq = 5, startDate="01-01-2013")
setnames(konut_satis_ist2, "time", "Date")
setnames(konut_satis_ist2, "TP.AKONUTSAT4.T40", "Istanbul_Second_Hand_House_Sales")
konut_satis_ank1 <- getDataSeries("TP.AKONUTSAT3.T7", CBRTKey = '5rUjrDHw0I', freq = 5, startDate="01-01-2013")
setnames(konut_satis_ank1, "time", "Date")
setnames(konut_satis_ank1, "TP.AKONUTSAT3.T7", "Ankara_First_Hand_House_Sales")
konut_satis_ank2 <- getDataSeries("TP.AKONUTSAT4.T7", CBRTKey = '5rUjrDHw0I', freq = 5, startDate="01-01-2013")
setnames(konut_satis_ank2, "time", "Date")
setnames(konut_satis_ank2, "TP.AKONUTSAT4.T7", "Ankara_Second_Hand_House_Sales")

merged_kfe <- merge(kfe_ist, kfe_ank, by = "Date", all = TRUE)
merged_ist_satis <- merge(konut_satis_ist1, konut_satis_ist2, by = "Date", all = TRUE)
merged_ank_satis <- merge(konut_satis_ank1, konut_satis_ank2, by = "Date", all = TRUE)
merged_satis <- merge(merged_ank_satis, merged_ist_satis, by = "Date", all = TRUE)
merged_satis_kfe <- merge(merged_kfe, merged_satis, by = "Date", all = TRUE)
merged <- merge(merged_satis_kfe, konut_faiz, by = "Date", all = TRUE)

model_1 <- lm(Ankara_First_Hand_House_Sales ~ Housing_Interest_Rate + Ankara_House_Price_Index, data=merged )
summary(model_1)

