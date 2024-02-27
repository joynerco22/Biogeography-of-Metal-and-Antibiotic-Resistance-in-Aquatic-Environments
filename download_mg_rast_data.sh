#!/bin/bash


## list the names of the project IDs to be downloaded


## run API server and download to ~/MG-RAST_RAW_DATA directory 

# while read line; do mg-download.py --project $line --dir ~/MG-RAST_RAW_DATA  --file 050.1; done 

echo "$1"
while IFS= read -r id || [ -n "$id" ]; do
id=$(echo "$id" | tr -d '\r')
if [ -n "$id" ]; then
mg-download.py --project "$id" --dir ~/MG-RAST_RAW_DATA
fi

done < "$1"
