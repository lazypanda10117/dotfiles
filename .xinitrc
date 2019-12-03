systemctl --user import-environment DISPLAY
exec i3

export GTK_IM_MODULLE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
