#!/bin/bash

# set arrow cursor
xsetroot -cursor_name left_ptr &

# keyboard repeat delay and rate
xset r rate 300 30 &

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
xinput set-prop 'ETPS/2 Elantech Touchpad' 'Synaptics Finger' 20 30 255 &

# set random wallpaper
#wallpaper-randomize &
setroot -z ~/images/wallpapers/0.jpg &

#root-tail -color "#983327" -fn "-*-terminus-medium-r-normal-*-12-*-*-*-*-*-*-*" -i 1 -g 600x20+140+610 <(while :; do date; sleep 1; done) &

# hotkeys
sxhkd -f 100 &

# window manager
exec bspwm


