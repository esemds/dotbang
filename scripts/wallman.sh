#!/bin/bash 
#this script will set background images with time period :)
LOGFILE="/tmp/wallman.log"
DIR="$HOME/Pictures/wallpaper/"
#echo $DIR;
cd $DIR
#touch zzz.cc

LISTMAN () {
    #A function 4 setting things ready
    listjpg=`ls *.jpg`
    listpng=`ls *.png`
    echo "$listjpg" > zz.ccc;
    echo "$listpng" >> zz.ccc

    list=`cat zz.ccc`
    shuffle=`shuf -e $list`
    echo $shuffle > zzz.ccc
    list=`cat zzz.ccc`
    echo "END_OF_LIST" >> zzz.ccc
}

LOGINFO=`date`

#The init part. (First run)
LISTMAN

while :
do
    HOUR="$(date +'%H')"
    if [ $HOUR -ge 10 -a $HOUR -lt 22 ] ;then 
        echo "$LOGINFO --- wallman is going to start tasks (init part)... " > $LOGFILE
        notify-send -u low -i ~/scripts/icons/biohazard.png "It's $HOUR and wallman started task." "Yes, It should work :)"
        for item in `cat zzz.ccc`;do
            if [ $item == "END_OF_LIST" ]; then
                LISTMAN                
                continue
            else
                HOUR="$(date +'%H')"
                if [ $HOUR -ge 10 -a $HOUR -lt 22 ] ;then 
                    #notify-send -u low -i ~/scripts/icons/biohazard.png "It's $HOUR :)" "It is work time & wallman is ready to set background"
                    echo "$LOGINFO --- It is work time & wallman is ready to set background ... " > $LOGFILE
                    date="$(date +'%H:%M:%S')"
                    notify-send -u low -i "$DIR/$item" "wallpaper changed at $date" "$item is set as wallpaper."
                    feh --bg-fill $item
                    sleep 2h
                else
                    echo "$LOGINFO --- wallman is in postpone mode \_(*_*)_/ ... " > $LOGFILE
                    sleep 2h
                fi
            fi
        done
    else 
        notify-send -u low -i ~/scripts/icons/biohazard.png "It's $HOUR [Not work time :( ]" "You need to wait till work time"
        echo "$LOGINFO --- wallman is not going to start yet :) ... " > $LOGFILE
        sleep 2h
    fi
done
