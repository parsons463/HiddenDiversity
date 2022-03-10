#read in geographic and environmental variables
var<-read.table("/Users/parsons.463/Desktop/test/env_var.txt", header=FALSE, sep="\t")
geo<-read.table("/Users/parsons.463/Desktop/test/geo.txt", header=FALSE, sep="\t")

#read in panTHERIA data and tranform all -999 values to NA
morph<-read.table("/Users/parsons.463/Desktop/Random_forest/PanTHERIA_1-0_WR05_Aug2008.txt", header=TRUE, sep="\t")
morph[morph == -999] <-NA

#merge geographic and environmental variables and write out a combined table
d1<-merge(geo, var, by.x=c("V1", "V2", "V3"), by.=c("V1", "V2", "V3"))

colnames(d1)<-c("species", "n_gps", "area", "max_lat", "min_lat", "median_lat", "abs_max_lat", "abs_min_lat", "length_lat", "max_lon", "min_lon", "median_lon", "length_lon", "bio1m", "bio1r", "bio1v", "bio2m", "bio2r", "bio2v", "bio3m", "bio3r", "bio3v", "bio4m", "bio4r", "bio4v", "bio5m", "bio5r", "bio5v", "bio6m", "bio6r", "bio6v", "bio7m", "bio7r", "bio7v", "bio8m", "bio8r", "bio8v", "bio9m", "bio9r", "bio9v", "bio10m", "bio10r", "bio10v", "bio11m", "bio11r", "bio11v", "bio12m", "bio12r", "bio12v", "bio13m", "bio13r", "bio13v", "bio14m", "bio14r", "bio14v", "bio15m", "bio15r", "bio15v", "bio16m", "bio16r", "bio16v", "bio17m", "bio17r", "bio17v", "bio18m", "bio18r", "bio18v", "bio19m", "bio19r", "bio19v", "evm", "evr", "evv", "cvm", "cvr", "cvv")
write.table(d1, file="spatial_var.txt", sep="\t", quote=FALSE, row.names=FALSE)

#merge combined geographic/environmental variables with panTHERIA data and write out a combined table
d2<-merge(d1, morph, by.x="species", by.y="MSW05_Binomial")
write.table(d2, file="all_var.txt", sep="\t", quote=FALSE, row.names=FALSE)


