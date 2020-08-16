#!/bin/bash

action=${1:-`echo -e "Lock\nSuspend\nShutdown\nReboot" | dmenu`}
[[ -z "$action" ]] && exit

case ${action} in
    Lock) gnome-screensaver-command -l;;
    Suspend) systemctl suspend;;
    Shutdown) systemctl poweroff;;
    Reboot) systemctl reboot;;
esac

