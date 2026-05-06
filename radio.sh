#!/data/data/com.termux/files/usr/bin/bash

#
# Sinple Internet radio stream player for Termux.
#
# Uses Whiprail for menuing
# Uses mpv for playing the media
# 
# usage: radio.sh for continuous play or
# radio.sh n  where 'n' is the number of minutes to play for.
#
# Ctl-C will end the current stream abd bring you back to the menu
#
# My personal favourite colours (optionall)
#
export NEWT_COLORS='root=,black
border=green,black
title=black,white
roottext=red,black
window=red,black
textbox=white,black
button=black,green
compactbutton=white,black
listbox=white,black
actlistbox=black,white
actsellistbox=black,green
checkbox=yellow,black
actcheckbox=black,green
'
RUNNING=1
while [ $RUNNING ]; do

STREAM=$(whiptail --notags --title "Internet Radio Player" --radiolist \
"Choose a station:" 20 60 14 \
"https://fr.ah.fm/mobile" "After Hours FM" OFF \
"https://hard-trance.stream.laut.fm/hard-trance?pl=m3u" "Skyline EFM Hard Trance" OFF \
"https://somafm.com/nossl/beatblender.pls" "Soma FM Beat Blender" OFF \
"https://ice6.somafm.com/insound-256-mp3" "Soma FM The In-Sound" OFF \
"https://systrum.net:8443/SSR1" "Systrum Sistum 1 - Ambient" OFF \
"https://uk2.streamingpulse.com/ssl/vcr1" "Venice Classic Radio Auditorium" OFF \
3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then
  if [ .$1 == . ]; then
    PLAY="mpv "	
    echo "Continuous play ..."
  else
    seconds=$[60*$1]
    untiltime=$(date -d "$time + $seconds seconds" +%R)
    PLAY="mpv --length=${seconds} "
	 clear
    echo "Will stream for $1 minutes until $untiltime ..."
	 RUNNING=0
    echo ""
  fi

  if [ .$STREAM == . ]; then
    echo "No stream selected"
	 RUNNING=0
	 exit 1
  fi
  SECONDS=0
  ${PLAY} "$STREAM"
  duration=$SECONDS
  echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
else
  RUNNING=0
  echo "Bye!"
  exit
fi

done
exit 0

