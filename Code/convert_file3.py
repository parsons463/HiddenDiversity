#! /usr/bin/env python

from Bio import AlignIO
from Bio import Alphabet

try:
	AlignIO.convert("cytb.fas", "fasta", "cytb.nexus", "nexus", alphabet=Alphabet.generic_dna)
except:
	print "no fas file"
	
try:
	AlignIO.convert("COI.fas", "fasta", "COI.nexus", "nexus", alphabet=Alphabet.generic_dna)
except:
	print "no fas file"
	
try:
	AlignIO.convert("cytb_unique.fas", "fasta", "cytb_unique.nexus", "nexus", alphabet=Alphabet.generic_dna)
except:
	print "no fas file"
	
try:
	AlignIO.convert("COI_unique.fas", "fasta", "COI_unique.nexus", "nexus", alphabet=Alphabet.generic_dna)
except:
	print "no fas file"
