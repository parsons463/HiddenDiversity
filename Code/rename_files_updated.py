#! /usr/bin/env python
import os

cmd1 = 'for file in *.fa ; do mv "$file" "${file//cytochrome-b/cytb}" ; done'
cmd2 = 'for file in *.fa ; do mv "$file" "${file//cyt-b/cytb}" ; done'
cmd3 = 'for file in *.fa ; do mv "$file" "${file//Cytb/cytb}" ; done'
cmd4 = 'for file in *.fa ; do mv "$file" "${file//CYTB/cytb}" ; done'
cmd5 = 'for file in *.fa ; do mv "$file" "${file//cytB/cytb}" ; done'
cmd6 = 'for file in *.fa ; do mv "$file" "${file//CytB/cytb}" ; done'
cmd24 = 'for file in *.fa ; do mv "$file" "${file//cob/cytb}" ; done'
cmd25 = 'for file in *.fa ; do mv "$file" "${file//COB/cytb}" ; done'
cmd26 = 'for file in *.fa ; do mv "$file" "${file//Cyt-b/cytb}" ; done'
cmd29 = 'for file in *.fa ; do mv "$file" "${file//CYT-b/cytb}" ; done'
cmd27 = 'for file in *.fa ; do mv "$file" "${file//Cytochrome-b/cytb}" ; done'
cmd30 = 'for file in *.fa ; do mv "$file" "${file//CYB/cytb}" ; done'

cmd7 = 'for file in *.fa ; do mv "$file" "${file//CO1/COI}" ; done'
cmd8 = 'for file in *.fa ; do mv "$file" "${file//COX1/COI}" ; done'
cmd9 = 'for file in *.fa ; do mv "$file" "${file//cytochrome-c-oxidase-I/COI}" ; done'
cmd10 = 'for file in *.fa ; do mv "$file" "${file//Co1/COI}" ; done'
cmd11 = 'for file in *.fa ; do mv "$file" "${file//CoI/COI}" ; done'
cmd22 = 'for file in *.fa ; do mv "$file" "${file//cytochrome-oxidase-subunit-I/COI}" ; done'
cmd23 = 'for file in *.fa ; do mv "$file" "${file//cox1/COI}" ; done'
cmd28 = 'for file in *.fa ; do mv "$file" "${file//cytochrome-oxidase-subunit-1/COI}" ; done'


dirs1 = [os.path.abspath(name) for name in os.listdir(".") if os.path.isdir(name)]
#print dirs

for d1 in dirs1:
	os.chdir(d1)
	os.system(cmd1)
	os.system(cmd2)
	os.system(cmd3)
	os.system(cmd4)
	os.system(cmd5)
	os.system(cmd6)
	os.system(cmd7)
	os.system(cmd8)
	os.system(cmd9)
	os.system(cmd10)
	os.system(cmd11)
	os.system(cmd22)
	os.system(cmd23)
	os.system(cmd24)
	os.system(cmd25)
	os.system(cmd26)
	os.system(cmd27)
	os.system(cmd28)
	os.system(cmd29)
	os.system(cmd30)


