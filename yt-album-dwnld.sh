#!/bin/bash

# Check to see if a pipe exists on stdin.
url=$1
timecodes=$2
[[ $url ]] && [[ $timecodes ]] &&
echo $url $timecodes  ||

# Invalid input, check if something was piped

if [ -p /dev/stdin ]; then
        echo "Data was piped to this script!"
        # If we want to read the input line by line
        while IFS= read line; do
                echo "Line: ${line}"
        done
        # Or if we want to simply grab all the data, we can simply use cat instead
        # cat
else
    echo "Invalid input. 
    First argument is a url to a youtube video.
    Second argument is a file containing the timecodes."
fi
#
# TODO: 
# take yt. URL as argument, 
# take lines of timecodes and titles as second argument
# download the audio from url using youtube-dl
# split the audio using ffmpeg
# Later: 
#       add an interface script
#       python crawler that returns youtube Tracklist as readable input
