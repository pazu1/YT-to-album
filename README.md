# YT Albums

Shell script that makes using youtube-dl more convenient for downloading entire albums by splitting the downloaded track into individual audio files with ffmpeg.

## Installation

Just copy the script to some directory on your $PATH.

## Usage

```sh
$ yt-albums [url] [songlist]
```

Songlist contains timecodes and titles in the following format

```sh
00:00 First song title
03:00 Second song title
09:00 Third song title
etc.
```

hh:mm:ss time format works too.

## Dependencies

- youtube-dl
- ffmpeg
