#!/bin/bash 
#this script will set background images with time perid :)

DIR="$HOME/Pictures/wallpaper/"
#echo $DIR;
cd $DIR
#touch zzz.cc

listjpg=`ls *.jpg`
listpng=`ls *.png`
echo "$listjpg" > zz.ccc;
echo "$listpng" >> zz.ccc

list=`cat zz.ccc`
shuffle=`shuf -e $list`
echo $shuffle > zzz.ccc
list=`cat zzz.ccc`
echo "END_OF_LIST" >> zzz.ccc


while :
do
	for item in `cat zzz.ccc`;do
		if [ $item == "END_OF_LIST" ]; then
			#echo "end of list" updaing the list. ;)
			listjpg=`ls *.jpg`
			listpng=`ls *.png`
			echo "$listjpg" > zz.ccc;
			echo "$listpng" >> zz.ccc
			list=`cat zz.ccc`
			shuffle=`shuf -e $list`
			echo $shuffle > zzz.ccc
			list=`cat zzz.ccc`
			echo "END_OF_LIST" >> zzz.ccc
			continue
		else 	
			date=`date +%H:%m:%S`
			notify-send -u low -i ~/scripts/icons/biohazard.png "wallpaper changed at $date" "$item is set as wallpaper."
        	#echo $item
			feh --bg-fill $item
			sleep 2h
		fi
	done
done
