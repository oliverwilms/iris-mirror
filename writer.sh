#!/usr/bin/env bash
COUNT=1
output=output.txt
# create a file
touch $output

#Internal Field Separator (IFS) that is used for word splitting 
#after expansion and to split lines into words with the read builtin command
while IFS='' read -r LINE
do
  echo "LINE $COUNT: $LINE" >> $output
  ((COUNT++))
#$1 gets the file passed a parameter while running the script
done < "$1"

exit 0
