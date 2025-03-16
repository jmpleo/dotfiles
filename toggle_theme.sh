#!/bin/bash
# Get the current GTK theme using xfconf-query as an indicator.
current_gtk=$(xfconf-query -c xsettings -p /Net/ThemeName)

if [ "$current_gtk" = "Gruvbox-Dark-BL" ]; then
    # Switching to WhiteSur-Light set:
    xfconf-query -c xsettings -p /Net/ThemeName -s "WhiteSur-Light"
    xfconf-query -c xsettings -p /Net/IconThemeName -s "WhiteSur-light"
    xfconf-query -c xfwm4 -p /general/theme -s "WhiteSur-light"  # Adjust if needed

    # Update Vim configuration: set background light.
    # This assumes that ~/.vimrc includes a line starting with "set background=".
    sed -i 's/^set background=.*/set background=light/' ~/.dotfiles/.vimrc
else
    # Switching to Gruvbox set:
    xfconf-query -c xsettings -p /Net/ThemeName -s "Gruvbox-Dark-BL"
    xfconf-query -c xsettings -p /Net/IconThemeName -s "Gruvbox-Plus-Dark"
    xfconf-query -c xfwm4 -p /general/theme -s "Gruvbox-Dark-BL-wm"  # Adjust if needed

    # Update Vim configuration: set background dark.
    sed -i 's/^set background=.*/set background=dark/' ~.dotfiles/.vimrc
fi

xfdesktop --reload
xfce4-panel -r
