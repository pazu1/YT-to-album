#!/bin/bash

URL=$1

[ ! -f "$2" ] ||
! youtube-dl -o "dwnld.%(ext)s" --no-playlist --audio-format mp3 -x $URL &&
echo "Invalid arguments. 
First argument: url to a youtube video.
Second argument: file containing timecodes and titles." && exit 1

FILE=$2
    
prevtime=00:00:00
prevtitle=
while read line
do
    # Match hh:mm:ss starting from the beginning
    time=$(echo $line | egrep -o "^[0-9]{2}:[0-9]{2}:?[0-9]{2}?")
    # Match everything after first space 
    title=$(echo $line | egrep -o "[[:space:]].*" | sed 's/^ *//g')
    
    ! [ -z "$prevtitle" ] && echo $prevtitle $prevtime $time &&
    ffmpeg -nostdin -loglevel error -i dwnld.mp3 -ss "$prevtime" -to "$time" -c copy "$prevtitle".mp3 &&
    prevtime=$time
    prevtitle=$title
done <<<$(cat $FILE)

# Last one is outside of the loop
ffmpeg -nostdin -loglevel error -i dwnld.mp3 -ss "$prevtime" -c copy "$prevtitle".mp3
echo $prevtitle $prevtime to end
exit 0 

