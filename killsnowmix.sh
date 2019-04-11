#!/bin/bash
basename=recording
timestamp="$(date +"%T")"
type=.avi
outname="$basename$timestamp$type"
ps axf | grep shmsrc | grep -v grep | awk '{print "kill -2 " $1}' | sh
#ffmpeg -i testout.avi -f avi -c:v copy -preset slow -crf 22 -c:a copy -ss 00:00:13 output.avi
#mv output.avi "$outname"
pkill rtsp2feed
ps axf | grep snowscene | grep -v grep | awk '{print "kill -9 " $1}' | sh
pkill sleep
pkill snowmix
pkill bash
ps axf | grep out2 | grep -v grep | awk '{print "kill -9 " $1}' | sh

