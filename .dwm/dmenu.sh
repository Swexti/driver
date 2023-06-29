#!/bin/bash

j4-dmenu-desktop --term="alacritty" --dmenu="(cat ; (stest -flx $(echo $PATH | tr : ' ') | sort -u)) | dmenu -p 'Run:' -F -i -c -l 15 -nb '#fafbfc' -nf '#565869' -sb '#f767bb' -sf '#fafbfc' -fn 'Inconsolata'"
