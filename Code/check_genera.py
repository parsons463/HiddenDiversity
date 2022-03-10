##### Script to find genus names in multiple family folders #####

import glob
import os
import re

families = glob.glob('*/') # get family directory names
families = [x.replace('/', '') for x in families] # get rid of / at end of directory
genera = list()

### Get genera names in each family folder ###
for fam in families:
	
	os.chdir(fam) # move into family directory
	sp = glob.glob('*/') # get species directory names
	sp = [x.replace('/', '') for x in sp] # get rid of / at end of directory
	sp = [x.split(' ')[0] for x in sp] # get genus name only
	
	genera.append(sp) # add list of genera names to genera list
	
	os.chdir('..') # go back to families directory

### Identify genera present in more than one family ###
seen = set()
repeated = set()
for f in genera: # for each family
	
	for g in set(f): # for each genus
		if g in seen: # if genus had been recorded
			repeated.add(g) # add genus to repeated list
		else:
			seen.add(g) # add genus to recorded list
	
### Identify which families have overlapping genera ###
for gen in repeated: # for each repeated genus

	grps = list()
	for z in range(0, len(families)): # for each family
		if gen in genera[z]: # if the genus is included in the family
			grps.append(families[z]) # record family name
	print(gen + ': ' + ', '.join(grps))
	
	
	