#!/bin/bash

# set arrow cursor
xsetroot -cursor_name left_ptr &

# keyboard repeat delay and rate
xset r rate 300 30 &

# touchpad
synclient VertEdgeScroll=1 &
synclient TapButton1=1 &

# disable touchpad acceleration
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Accel Profile' -1
xinput set-prop 'SynPS/2 Synaptics TouchPad' 'Device Accel Constant Deceleration' 2

# set random wallpaper
wallpaper-randomize &

# hotkeys
sxhkd -f 100 &

# window manager
exec bspwm

