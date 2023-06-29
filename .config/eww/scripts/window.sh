#!/usr/bin/env bash

# Licensed under CC0. Please read the .yuck file for more information.
xprop -spy -root _NET_ACTIVE_WINDOW | while read -r; do
    xprop -id $(xprop -root '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) WM_CLASS | awk '{ print $3 }' | tr -d '",'
done