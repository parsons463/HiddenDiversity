library(geosphere)
library(raster)
library(plyr)
library(rgdal)
library(tools)

#convert bioclim data to raster layers
	#NOTE: to convert a .bil file into a raster layer, the corresponding .hdr file must be in the same directory 
setwd("/Users/parsons.463/Desktop/Random_forest/BIOCLIM")
	
bio1w = raster("bio_1.bil")
bio2w = raster("bio_2.bil")
bio3w = raster("bio_3.bil")
bio4w = raster("bio_4.bil")
bio5w = raster("bio_5.bil")
bio6w = raster("bio_6.bil")
bio7w = raster("bio_7.bil")
bio8w = raster("bio_8.bil")
bio9w = raster("bio_9.bil")
bio10w = raster("bio_10.bil")
bio11w = raster("bio_11.bil")
bio12w = raster("bio_12.bil")
bio13w = raster("bio_13.bil")
bio14w = raster("bio_14.bil")
bio15w = raster("bio_15.bil")
bio16w = raster("bio_16.bil")
bio17w = raster("bio_17.bil")
bio18w = raster("bio_18.bil")
bio19w = raster("bio_19.bil")

#convert elevation DEM data and global coverage data into raster layers 
elevation = raster("GDEM-10km-BW.tif")
cover = raster("GLOBCOVER_L4_200901_200912_V2.3.tif")

#Set working directory to folder with species' files
setwd("/Users/parsons.463/Desktop/test")

#read in csv for individual species 
	#NOTE: be sure to take 'myfile.csv', 'output.csv', and 'geo.txt' out of directory before running this
filename <- list.files("./")

#make loop
#####RANGE AND VARIANCE######
for (i in filename) {
  
  g<-read.csv(i, header=FALSE, sep=",")
  g<-g[,c(4,3)]
  g<-unique(g)
  n<-nrow(g)
  ch <- chull(g)
  coords <-g[c(ch, ch[1]), ]
  sp_poly <- SpatialPolygons(list(Polygons(list(Polygon(coords)), ID=1)))
  area<-areaPolygon(sp_poly)
  area<-format(area, scientific = FALSE)
  
  species<-file_path_sans_ext(i)
  
  if (area > 0) {
  sample<-spsample(sp_poly, 1000, type="regular")
  } else {
    sample<-sp_poly
  }
  
  e1<-extract(bio1w, sample)
  e1<-as.numeric(unlist(e1))
  bio1r<-max(e1, na.rm=TRUE)-min(e1, na.rm=TRUE)
  bio1v<-var(e1, na.rm=TRUE)
  bio1m<-mean(e1, na.rm=TRUE)
  
  e2<-extract(bio2w, sample)
  e2<-as.numeric(unlist(e2))
  bio2r<-max(e2, na.rm=TRUE)-min(e2, na.rm=TRUE)
  bio2v<-var(e2, na.rm=TRUE)
  bio2m<-mean(e2, na.rm=TRUE)
  
  e3<-extract(bio3w, sample)
  e3<-as.numeric(unlist(e3))
  bio3r<-max(e3, na.rm=TRUE)-min(e3, na.rm=TRUE)
  bio3v<-var(e3, na.rm=TRUE)
  bio3m<-mean(e3, na.rm=TRUE)
  
  e4<-extract(bio4w, sample)
  e4<-as.numeric(unlist(e4))
  bio4r<-max(e4, na.rm=TRUE)-min(e4, na.rm=TRUE)
  bio4v<-var(e4, na.rm=TRUE)
  bio4m<-mean(e4, na.rm=TRUE)
  
  e5<-extract(bio5w, sample)
  e5<-as.numeric(unlist(e5))
  bio5r<-max(e5, na.rm=TRUE)-min(e5, na.rm=TRUE)
  bio5v<-var(e5, na.rm=TRUE)
  bio5m<-mean(e5, na.rm=TRUE)
  
  e6<-extract(bio6w, sample)
  e6<-as.numeric(unlist(e6))
  bio6r<-max(e6, na.rm=TRUE)-min(e6, na.rm=TRUE)
  bio6v<-var(e6, na.rm=TRUE)
  bio6m<-mean(e6, na.rm=TRUE)
  
  e7<-extract(bio7w, sample)
  e7<-as.numeric(unlist(e7))
  bio7r<-max(e7, na.rm=TRUE)-min(e7, na.rm=TRUE)
  bio7v<-var(e7, na.rm=TRUE)
  bio7m<-mean(e7, na.rm=TRUE)
  
  e8<-extract(bio8w, sample)
  e8<-as.numeric(unlist(e8))
  bio8r<-max(e8, na.rm=TRUE)-min(e8, na.rm=TRUE)
  bio8v<-var(e8, na.rm=TRUE)
  bio8m<-mean(e8, na.rm=TRUE)
  
  e9<-extract(bio9w, sample)
  e9<-as.numeric(unlist(e9))
  bio9r<-max(e9, na.rm=TRUE)-min(e9, na.rm=TRUE)
  bio9v<-var(e9, na.rm=TRUE)
  bio9m<-mean(e9, na.rm=TRUE)
  
  e10<-extract(bio10w, sample)
  e10<-as.numeric(unlist(e10))
  bio10r<-max(e10, na.rm=TRUE)-min(e10, na.rm=TRUE)
  bio10v<-var(e10, na.rm=TRUE)
  bio10m<-mean(e10, na.rm=TRUE)
  
  e11<-extract(bio11w, sample)
  e11<-as.numeric(unlist(e11))
  bio11r<-max(e11, na.rm=TRUE)-min(e11, na.rm=TRUE)
  bio11v<-var(e11, na.rm=TRUE)
  bio11m<-mean(e11, na.rm=TRUE)
  
  e12<-extract(bio12w, sample)
  e12<-as.numeric(unlist(e12))
  bio12r<-max(e12, na.rm=TRUE)-min(e12, na.rm=TRUE)
  bio12v<-var(e12, na.rm=TRUE)
  bio12m<-mean(e12, na.rm=TRUE)
  
  e13<-extract(bio13w, sample)
  e13<-as.numeric(unlist(e13))
  bio13r<-max(e13, na.rm=TRUE)-min(e13, na.rm=TRUE)
  bio13v<-var(e13, na.rm=TRUE)
  bio13m<-mean(e13, na.rm=TRUE)
  
  e14<-extract(bio14w, sample)
  e14<-as.numeric(unlist(e14))
  bio14r<-max(e14, na.rm=TRUE)-min(e14, na.rm=TRUE)
  bio14v<-var(e14, na.rm=TRUE)
  bio14m<-mean(e14, na.rm=TRUE)

  e15<-extract(bio15w, sample)
  e15<-as.numeric(unlist(e15))
  bio15r<-max(e15, na.rm=TRUE)-min(e15, na.rm=TRUE)
  bio15v<-var(e15, na.rm=TRUE)
  bio15m<-mean(e15, na.rm=TRUE)
  
  e16<-extract(bio16w, sample)
  e16<-as.numeric(unlist(e16))
  bio16r<-max(e16, na.rm=TRUE)-min(e16, na.rm=TRUE)
  bio16v<-var(e16, na.rm=TRUE)
  bio16m<-mean(e16, na.rm=TRUE)
  
  e17<-extract(bio17w, sample)
  e17<-as.numeric(unlist(e17))
  bio17r<-max(e17, na.rm=TRUE)-min(e17, na.rm=TRUE)
  bio17v<-var(e17, na.rm=TRUE)
  bio17m<-mean(e17, na.rm=TRUE)
  
  e18<-extract(bio18w, sample)
  e18<-as.numeric(unlist(e18))
  bio18r<-max(e18, na.rm=TRUE)-min(e18, na.rm=TRUE)
  bio18v<-var(e18, na.rm=TRUE)
  bio18m<-mean(e18, na.rm=TRUE)
  
  e19<-extract(bio19w, sample)
  e19<-as.numeric(unlist(e19))
  bio19r<-max(e19, na.rm=TRUE)-min(e19, na.rm=TRUE)
  bio19v<-var(e19, na.rm=TRUE)
  bio19m<-mean(e19, na.rm=TRUE)
  
  ev<-extract(elevation, sample)
  ev<-as.numeric(unlist(ev))
  evr<-max(ev, na.rm=TRUE)-min(ev, na.rm=TRUE)
  evv<-var(ev, na.rm=TRUE)
  evm<-mean(ev, na.rm=TRUE)
  
  cv<-extract(cover, sample)
  cv<-as.numeric(unlist(cv))
  cvr<-max(cv, na.rm=TRUE)-min(cv, na.rm=TRUE)
  cvv<-var(cv, na.rm=TRUE)
  cvm<-mean(cv, na.rm=TRUE)
  
  y<-data.frame(species, n, area, bio1m, bio1r, bio1v, bio2m, bio2r, bio2v, bio3m, bio3r, bio3v, bio4m, bio4r, bio4v, bio5m, bio5r, bio5v, bio6m, bio6r, bio6v, bio7m, bio7r, bio7v, bio8m, bio8r, bio8v, bio9m, bio9r, bio9v, bio10m, bio10r, bio10v, bio11m, bio11r, bio11v, bio12m, bio12r, bio12v, bio13m, bio13r, bio13v, bio14m, bio14r, bio14v, bio15m, bio15r, bio15v, bio16m, bio16r, bio16v, bio17m, bio17r, bio17v, bio18m, bio18r, bio18v, bio19m, bio19r, bio19v, evm, evr, evv, cvm, cvr, cvv)
  
write.table(y, file="env_var.txt", quote=FALSE, row.names=FALSE, col.names=FALSE, sep="\t", append=TRUE)
}
