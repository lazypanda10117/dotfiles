#!/bin/bash

action=${1:-`echo -e "Lock\nSuspend\nShutdown\nReboot" | dmenu`}
[[ -z "$action" ]] && exit

case ${action} in
    Lock) ~/.config/i3/lock_script.sh;;
    Suspend) systemctl suspend;;
    Shutdown) systemctl poweroff;;
    Reboot) systemctl reboot;;
esac

