#!/usr/bin/env sh

######################################################################
# @author      : gengchen (gengchen@$HOSTNAME)
# @file        : autorun
# @created     : Saturday Sep 26 2020 19:58:05 EDT
#
# @description : 
######################################################################
run(){
    if ! pgrep -f $1 ;
    then
        $@ &
    fi
}
sh ~/.screenlayout/single_4k.sh
run    ff-theme-util
run    fix_xcursor
run    xset r rate 260 60
run    picom --config ~/.config/picom.conf
run    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run    nitrogen --restore
run    nm-applet
run    xfce4-power-manager
run    pamac-tray
run    clipit
run    fcitx5
run    guake -v
#for i in ${commands[@]}; do
    #echo $i
#done
