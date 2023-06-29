#!/bin/bash

# Debug file. Not meant for usage. Can be removed.
set_volume() {
    arg1=$1
    let vol=($arg1-4)

    amixer -q sset Master $vol%,$arg1%

    #echo $arg1
    #echo $vol
    #echo $1
}

set_volume $1