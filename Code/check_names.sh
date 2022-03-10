#generate species list from filenames
ls -1 | sed -e 's/\.csv$//' | egrep -v '^(check_names.sh|geo_data_prep.py|Pantheria_names.txt|file_names.txt|myfile|output)$' >file_names.txt

#returns any species names not listed in PanTHERIA taxonomy (Wilson and Reeder 2008)
grep -Fxv -f /Users/parsons.463/Desktop/Data_prep_randomForest/Pantheria_names.txt file_names.txt