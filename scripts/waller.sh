#!/bin/bash 
#A script 4 auto background setting.
#2020/07/17

#get directory containg wallpapers
DIR="$HOME/Pictures/wallpaper/"

#chnage directory 
cd $DIR

#make a list file 4 listing wallpapers
touch list.ccc

#select all jpg file
listjpg=`ls *.jpg`
#sleep all png files if needed.
listpng=`ls *.png`

#add filenames to list
echo "$listjpg" > list.ccc;
echo "$listpng" >> list.ccc

#make the array from list file
list=`cat list.ccc`

#set "\n" as seperator 4 each item. 
IFS=$'\n'

#the main loop
while :
	do
        #suffle files 4 better result :)
		shuffle=`shuf -n1 -e $list`
		#set wallpaper with feh
        feh --bg-fill $shuffle
        #notification 4 wallpaper change
		#notify-send -u low -i ~/scripts/icons/biohazard.png "wallpaper change alert" "$shuffle is set as wallpaper."
        #pause between wallpaper change.
        sleep 4h
	done
