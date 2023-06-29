#!/usr/bin/env bash

# Licensed under CC0. Please read the .yuck file for more information.
# Does not work under DWM without an EWMH patch. Even then it is purely visual.

workspace() {
    wmctrl -d | awk '{ print $1 " " $2 " " $3 " " $9 }' | while read -r id active name; do
        name="${name#*_}"
        if [ "$active" == '*' ]; then
            btn_class="active_wsp"
            image="./icons/filled-circle.svg"
        else
            btn_class="inactive_wsp"
            image="./icons/circle.svg"
        fi
        echo -n '(button :onclick "wmctrl -s '"$id"'" :class "'"$btn_class"'" (image :image-width "14" :path "'"$image"'"))'
        #echo -n '(button :onclick "wmctrl -s '"$id"'" :class "'"$btn_class"'" "'"$id"'")'
    done
}

xprop -spy -root _NET_CURRENT_DESKTOP | while read -r; do
    echo '(box :orientation "h" :class "workspaces" :space-evenly "true" '$(workspace)')'
done