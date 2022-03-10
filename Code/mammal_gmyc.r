library(ape)
library(geiger)
library(splits)
library(phangorn)

setwd("/Users/parsons/Desktop/GMYC/Carnivora/Ailuridae")
#read in COI maximum clade credibility tree
tree <- read.nexus("COI.tre")

#check that the tree is strictly bifurcating
is.binary.tree(tree)

#check that the tree is ultrametric
is.ultrametric(tree)

#### MULTIPLE THRESHOLD MODEL ####
#run multiple threshold model
delim1 <- gmyc(tree, method="multiple", quiet=T)

#show summary results and save to output file
summary(delim1)

out<-capture.output(summary(delim1))
cat(out, file="COI_multiple.txt", append=TRUE)

#Write table of GMYC species
sm<-spec.list(delim1)
write.table(sm, file="COI_gmyc_species_multiple.txt", sep="\t", row.names=FALSE, quote=FALSE)

#### SINGLE THRESHOLD MODEL ####
#run single threshold model
delim2 <- gmyc(tree, method="single", quiet=T)

#show summary results and save to output file
summary(delim2)   

out<-capture.output(summary(delim2))
cat(out, file="COI_single.txt", append=TRUE)

#Write table of GMYC species
ss<-spec.list(delim2)
write.table(ss, file="COI_gmyc_species_single.txt", sep="\t", row.names=FALSE, quote=FALSE)


####repeat for cytochrome-b####


#read in cytb maximum clade credibility tree
tree <- read.nexus("cytb.tre")

#check that the tree is strictly bifurcating
is.binary.tree(tree)

#check that the tree is ultrametric
is.ultrametric(tree)

#### MULTIPLE THRESHOLD MODEL ####
#run multiple threshold model
delim3 <- gmyc(tree, method="multiple", quiet=T)

#show summary results and save to output file
summary(delim3)

out<-capture.output(summary(delim3))
cat(out, file="cytb_multiple.txt", append=TRUE)

#Write table of GMYC species
sm<-spec.list(delim3)
write.table(sm, file="cytb_gmyc_species_multiple.txt", sep="\t", row.names=FALSE, quote=FALSE)

#### SINGLE THRESHOLD MODEL ####
#run single threshold model
delim4 <- gmyc(tree, method="single", quiet=T)

#show summary results and save to output file
summary(delim4)   

out<-capture.output(summary(delim4))
cat(out, file="cytb_single.txt", append=TRUE)

#Write table of GMYC species
ss<-spec.list(delim4)
write.table(ss, file="cytb_gmyc_species_single.txt", sep="\t", row.names=FALSE, quote=FALSE)






