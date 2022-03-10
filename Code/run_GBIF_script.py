#! /usr/bin/env python

#written by Tara Pelletier
#https://sites.google.com/site/taraapelletier/home/cv

import os
import glob
import re

root = os.getcwd()

dirs = [os.path.abspath(name) for name in os.listdir(".") if os.path.isdir(name)]
#print dirs

for d in dirs:
	os.chdir(d)
	cwd = os.getcwd()
	print (cwd)
	cmd = ("perl /Users/parsons/Downloads/0017095-181108115102211/GBIF.pl")
	os.system(cmd)
	
    