#!/bin/bash

OPTION=''
case ${1} in
    up)     OPTION+="-A" ;;
    down)   OPTION+="-U" ;;
esac

sudo light $OPTION $2
pkill -RTMIN+11 i3block


