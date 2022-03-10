library(geosphere)
library(raster)
library(plyr)
library(rgdal)
library(tools)

#set working dorectory to folder with sepcies files

setwd("/Users/parsons.463/Desktop/test")

#read in csv for individual species 
	#NOTE: be sure to take 'myfile.csv', 'output.csv', and 'env_var.txt' out of directory before running this
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
  
  max_lat<-max(g[,2])
  min_lat<-min(g[,2])
  median_lat <- median(g[,2])
  abs_max_lat <- abs(max_lat)
  abs_min_lat <- abs(min_lat)
 
  length_lat <- max_lat - min_lat
  
  max_lon<-max(g[,1])
  min_lon<-min(g[,1])
  median_lon <- median(g[,1])
  length_lon <- max_lon - min_lon
  
  species<-file_path_sans_ext(i)

  y<-data.frame(species, n, area, max_lat,min_lat,median_lat,abs_max_lat,abs_min_lat,length_lat, max_lon,min_lon,median_lon,length_lon)
  
write.table(y, file="geo.txt", quote=FALSE, row.names=FALSE, col.names=FALSE, sep="\t", append=TRUE)
}

	