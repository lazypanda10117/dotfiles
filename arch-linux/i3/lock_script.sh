#!/usr/bin/env bash

# Enable compton's fade-in effect so that the lockscreen gets a nice fade-in
# effect.
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:false

# If disable unredir_if_possible is enabled in compton's config, we may need to
# disable that to avoid flickering. YMMV. To try that, uncomment the following
# two lines and the last two lines in this script.
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:false

# Suspend dunst and lock, then resume dunst when unlocked.
pkill -u $USER -USR1 dunst

~/.config/i3/lock_core.sh

pkill -u $USER -USR2 dunst

# Revert compton's config changes.
sleep 0.2
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:true
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:true


