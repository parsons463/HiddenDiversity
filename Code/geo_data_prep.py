import os 
from glob import glob
path ="./"

#rename occurences file from GBIF to "myfile.csv"
f = glob(os.path.join(path,"*.csv"))[0]
os.rename(f, "myfile.csv")

#delete unwanted columns from occurence data
import pandas, sys
df = pandas.read_csv('myfile.csv', sep="	")
df.drop(['gbifID', 'datasetKey', 'occurrenceID', 'kingdom', 'phylum', 'class', 'order', 'genus', 'infraspecificEpithet', 'taxonRank', 'scientificName', 'countryCode', 'locality', 'publishingOrgKey', 'coordinateUncertaintyInMeters', 'coordinatePrecision', 'elevation', 'elevationAccuracy', 'depth', 'depthAccuracy', 'eventDate', 'day', 'month', 'year', 'taxonKey', 'speciesKey', 'basisOfRecord', 'institutionCode', 'collectionCode', 'catalogNumber', 'identifiedBy', 'dateIdentified', 'license', 'rightsHolder', 'recordedBy', 'typeStatus', 'establishmentMeans', 'lastInterpreted', 'mediaType', 'issue', 'recordNumber'], axis=1)
df = df[['species', 'family', 'decimalLatitude', 'decimalLongitude']]
df.to_csv('output.csv', index=None)

#create a separate csv for each species
import pandas as pd
df = pd.read_csv('output.csv')
for i, g in df.groupby('species'):
    g.to_csv('{}.csv'.format(i), header=False, index=False)