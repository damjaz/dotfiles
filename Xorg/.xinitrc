#!/bin/bash

# bring up default network interface
sudo ifup wlan0 &

# set arrow cursor
xsetroot -cursor_name left_ptr -fg '#d42228' -bg 'black'

# keyboard repeat delay and rate
xset r rate 300 30 &

# disable caps lock
#setxkbmap -option caps:none &

# set caps lock to behave like esc when tapped
setxkbmap -option 'caps:ctrl_modifier' &
xcape -e 'Caps_Lock=Escape' &

# disable F5, keyboard is freaking out and randomly spamming this key
#xmodmap -e 'keycode 71=' &

xset +fp /usr/share/fonts/local
xset +fp ~/.fonts
xset fp rehash

# touchpad
synclient VertEdgeScroll=1 &
synclient TapButton1=1 &

# disable touchpad acceleration
# hp laptop
#xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Accel Profile' -1 &
#xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Accel Constant Deceleration' 2 &

# asus laptop
xinput set-prop 'ETPS/2 Elantech Touchpad' 'Device Accel Constant Deceleration' 1.5 &
xinput set-prop 'ETPS/2 Elantech Touchpad' 'Device Accel Profile' -1 &
# decrease sensitivity
#xinput set-prop 'ETPS/2 Elantech Touchpad' 'Synaptics Finger' 20 30 255 &

# set random wallpaper
#wallpaper-randomize &
# lightning theme
#setroot -z "$(shuf -n1 -e ~/images/wallpapers/lightning/*)"
# set static wallpaper
setroot -z ~/images/wallpapers/current &

#root-tail -color "#983327" -fn "-*-terminus-medium-r-normal-*-12-*-*-*-*-*-*-*" -i 1 -g 600x20+140+610 <(while :; do date; sleep 1; done) &

# night vision
redshift &

# reload rss feeds silently
newsbeuter -x reload &

# monitor battery power
notify-battery &

# hotkeys
sxhkd > ~/.sxhkd.log 2>&1 &

# window manager
exec bspwm > ~/.bspwm.log 2>&1 


