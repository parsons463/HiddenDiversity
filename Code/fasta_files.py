#! /usr/bin/env python

from Bio import SeqIO
import os
import sys
import itertools
import glob
import re

###gets .fa files for each sequence. they are labeled as accession#_gene_species.fa
filename = "sequence.gb"

filebase = os.path.splitext(filename)[0]

handle = open(filename, 'rU')

all_genes = []

for record in SeqIO.parse(handle, 'genbank') :
	
	seq = str(record.seq)
	
	for feature in record.features:
		#print feature.type
		#print feature.location
	
		if feature.type == 'CDS': #or feature.type == 'rRNA':
				
			if 'gene' in feature.qualifiers:
				geneName = feature.qualifiers['gene'][0]
			elif 'product' in feature.qualifiers:
				geneName = feature.qualifiers['product'][0]
			else:
				print 'ERROR when parsing feature:'
				print feature.qualifiers
				
			
			geneName = geneName.replace(' ', '-')
			geneName = geneName.replace('/', '-')
			geneName = geneName.replace("'", '') 
			geneName = geneName.replace(".", '') #THIS
			all_genes.append(geneName)
			#print geneName
			
			speciesName = record.annotations["organism"]
			speciesName = speciesName.replace('/', ' ')
			
			geneFile = open(record.name + '_' + geneName + '_' + speciesName +'.fa', 'w')
			geneFile.write('>')
			geneFile.write(os.path.basename(record.name) + '_' + geneName + '_' + speciesName + "\n")
			geneFile.write(seq[feature.location.start.position:feature.location.end.position])
			geneFile.write("\n")
		

print "------ fasta files retrieved"


###uses the third part of the file name (id_gene_species.fa) to make directories and put files there
#subroutine that gets directory name
def get_dir_name(filename):
    pos1 = filename.rfind('_')
    pos2 = filename.find('.')
    return filename[pos1+1:pos2]

#makes folder and puts .fa files in right place
for f in glob.glob('*.fa'):
    cwd = os.getcwd()
    dir_name = os.path.join(cwd+'/'+get_dir_name(f))
#    print dir_name
    if not os.path.exists(dir_name):
        os.mkdir(dir_name)
    os.rename(f, dir_name+'/'+f)
  
print "------ fasta files put into folers"	