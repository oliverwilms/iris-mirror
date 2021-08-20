#!/usr/bin/env bash
dummy=0
flag=0
output=output.txt
empty=""
pattern="?MapMirrors.IRISMIRROR?"
next="?MirrorMember?"
# create a file
rm $output
touch $output

#Internal Field Separator (IFS) that is used for word splitting 
#after expansion and to split lines into words with the read builtin command
while IFS='' read -r LINE
do
  match=0
  newLine="" 
  case $LINE in
    $pattern) ((flag++));;
    $next) ((flag++));;
    "$empty") ((dummy++));;
    *) ((match++));;
  esac
  if [ $flag -eq 1 ];
  then
    if [ $match -eq 1 ];
    then
      newLine=" **UPDATE";
      LINE=$newLine;
    fi
  fi
  echo "$newLine $LINE" >> $output
#$1 gets the file passed as a parameter while running the script
done < "$1"

exit 0
