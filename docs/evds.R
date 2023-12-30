## required Packages
if (!require(devtools)) install.packages('devtools')

library(devtools)

if (!require(CBRT)) install_github("etaymaz/CBRT")
library(CBRT)


## Veri çek
## doviz
doviz = getDataSeries('TP.DK.USD.A.YTL' , CBRTKey = '5rUjrDHw0I', freq = 3, startDate="01-01-2000")
colnames(doviz) = c('tarih','doviz')
## kko

kko = getDataSeries('TP.KKO2.IS.TOP' , CBRTKey = '5rUjrDHw0I', freq = 5, startDate="01-01-2000")
colnames(kko) = c('tarih','kko')


