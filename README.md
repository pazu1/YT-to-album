# YT to album

Shell script that makes using youtube-dl more convenient for downloading entire albums (or audiobooks) by splitting the downloaded track into individual audio files with ffmpeg.

## Installation

Just copy the script to some directory on your $PATH.

## Usage

```sh
$ yt-albums [url] [songlist] [outputdir]
```

Songlist contains timecodes and titles in the following format

```sh
00:00 First title
03:00 Second title
09:00 Third title
etc.
```

hh:mm:ss time format works too.

## Dependencies

- youtube-dl
- ffmpeg
