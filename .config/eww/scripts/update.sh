#!/bin/bash

# Licensed under CC0. Please read the .yuck file for more information.

A=$(cat ~/.local/share/fish/fish_history | grep -B1 "sudo apt upgrade" | tail -2 | head -1 | awk '{print $2 }')

let DIFF=($(date +%s)-$A)/86400
echo $DIFF