#!/bin/bash

null=$'\0'
text=$(playerctl metadata title)

#while :; do
if [ "${#text}" -le 5 ]; then
    printf "${text}"
   else
    #while true; doz12
      for (( i = 0; i < "${#text}"; i++ )); do
        #printf "\r%s" "${text:$i:5-${#text}+i}"
        echo "${text:$i&${#text}:5}-${text:0:5-${#text:$i&${#text}:5}}"
        sleep 0.2
      done
    #done
fi

#done
echo
