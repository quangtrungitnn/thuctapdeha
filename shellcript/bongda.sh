#!/bin/bash

cd shellCript ; pwd ; ls -d */ | while read dir ; do
   find . ! -name bongda.sh ! -name idol.txt -delete
   #rm -r "$dir"
done

random=$((RANDOM%20+1))
DAY=`date +%u`

for i in `seq 1 7`
do
  A=`expr "$i" - "$DAY"`
  GETDAY=`date -d "$A"day +"%d_%m_%Y"`

  GetKeyWord=$(sed -n $i'p' idol.txt) 

    GetImageLink=$(wget --user-agent 'Mozilla/5.0' -qO - "https://www.google.com/search?q=$GetKeyWord\&tbm=isch" | sed 's/</\n</g' | grep '<img' | tail -"$random" | head -1 | sed 's/.*src="\([^"]*\)".*/\1/')

    mkdir $GETDAY
    wget "$GetImageLink" -O "$GETDAY/$GetKeyWord.jpg"


done
