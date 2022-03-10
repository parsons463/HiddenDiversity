#! /usr/bin/env python

from Bio import SeqIO
from Bio.SeqUtils.CheckSum import seguid

def remove_dup_seqs(records):
    """"SeqRecord iterator to removing duplicate sequences."""
    checksums = set()
    for record in records:
        checksum = seguid(record.seq)
        if checksum in checksums:
            print ("Ignoring %s") % record.id
            continue
        checksums.add(checksum)
        yield record

file1="cytb.fas"
file2="COI.fas"

print ("-------")

try:
	records1 = remove_dup_seqs(SeqIO.parse(file1, "fasta"))
	count1 = SeqIO.write(records1, "cytb_unique.fas", "fasta")
	print ("Saved %i cytb records") % count1
	
	records2 = remove_dup_seqs(SeqIO.parse(file2, "fasta"))
	count2 = SeqIO.write(records2, "COI_unique.fas", "fasta")
	print ("Saved %i COI records") % count2

except: "Some fas files did not exist"