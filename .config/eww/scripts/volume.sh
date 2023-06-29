#!/bin/bash

# Licensed under CC0. Please read the .yuck file for more information.

# My right ear is a little quieter than the right (it varies, actually), so I need to set the volume respectively.

volume() {
    volume=`amixer sget Master | tail -n1 | awk '{print $5}' | tr -d '[]%'`
    echo "$volume"
}

volume_icon() {
    volume="$(volume)"
    cur=`amixer sget Master | tail -1 | grep -wo 'on'`
    
    if [[ "$cur" == "on" ]]; then
        if [[ "$volume" == "0" ]]; then
            echo "./icons/coolicons/volume-off.svg"
        elif [[ ("$volume" -ge "0") && ("$volume" -le "50" ) ]]; then
            echo "./icons/coolicons/volume-min.svg"
        elif [[ "$volume" -ge "50" ]]; then
            echo "./icons/coolicons/volume-max.svg"
        else
            echo "./icons/coolicons/volume-off.svg"
        fi
    else
        echo "./icons/coolicons/volume-off.svg"
    fi
}

toggle() {
    cur=`amixer sget Master | tail -1 | grep -wo 'on'`

    if [[ "$cur" == "on" ]]; then
        amixer sset Master toggle
    else
        amixer sset Master toggle
    fi
}

diff() {
    right=`amixer sget Master | tail -1 | awk '{print $5}' | tr -d '[]%'`
    left=`amixer sget Master | tail -2 | head -1 | awk '{print $5}' | tr -d '[]%'`

    let DIFF=($left-$right)
    echo $DIFF
}

set_volume() {
    arg1=$1
    let vol=($arg1-4)

    amixer -q sset Master $vol%,$arg1%

    #echo $arg1
    #echo $vol
    #echo $1
}

if [[ "$1" == "--get" ]]; then
    volume
elif [[ "$1" == "--icon" ]]; then
    volume_icon
elif [[ "$1" == "--toggle" ]]; then
    toggle
elif [[ "$1" == "--diff" ]]; then
    diff
elif [[ "$1" == "--set" ]]; then
    set_volume $2
elif [[ "$1" == "--help" ]]; then
    echo -e "Swexti's Volume Script V1.0"
    echo -e "Meant to be edited to fit your config. \n"
    echo -e "USAGE: --flag [value] \n"
    echo -e "--get Gets the current volume from the Right Master channel. \n"
    echo -e "--icon Gets a matching icon (for EWW) for the current volume. \n"
    echo -e "--toggle Toggles mute/unmute. \n"
    echo -e "--set [0..100] Sets the volume between 0 and 100. Balanced with a 4% volume difference because my ears are wrecked (remove ',\$arg1%' to disable). \n"
    echo -e "(debug) --diff Gets the difference between the left and right channel."
else
    echo "No or incorrect flag provided. --help for help."
fi