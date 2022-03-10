#!/bin/bash

cat ./**/*_cytb_*.fa >cytb.fasta
cat ./**/*_COI_*.fa >COI.fasta

/Users/parsons.463/Applications/muscle3.8.31_i86darwin64 -in cytb.fasta -out cytb.fas
/Users/parsons.463/Applications/muscle3.8.31_i86darwin64 -in COI.fasta -out COI.fas

python2.7 /Volumes/Seagate\ Expansion\ Drive/misc_orders_scripts/remove_dups.py

python2.7 /Volumes/Seagate\ Expansion\ Drive/misc_orders_scripts/convert_file3.py

awk '/^>/{print ">" ++i; next}{print}' < cytb.fas >cytb_n.fas
awk '/^>/{print ">" ++i; next}{print}' < COI.fas >COI_n.fas

awk '/^>/{print ">" ++i; next}{print}' < cytb_unique.fas >cytb_unique_n.fas
awk '/^>/{print ">" ++i; next}{print}' < COI_unique.fas >COI_unique_n.fas

awk '/^>/{print ">" ++i; next}{print}' < clear_cytb_unique.fas >clear_cytb_unique_n.fas
awk '/^>/{print ">" ++i; next}{print}' < clear_COI_unique.fas >clear_COI_unique_n.fas

#python /Users/tara/Desktop/BATS/scripts/1_Sequence_Data/convert_file2.py



#python /Users/Tara/Dropbox/IBDE/SCRIPTS/1_Get_and_parse_GBIF_data/stable.py "+name+".fasta "+name+"_temp.afa > "+name+".afa