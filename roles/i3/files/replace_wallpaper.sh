wget -O ~/.config/wallpaper.jpg https://unsplash.it/3840/2400?random

# convert jpg to png for lock screen adjust accordingly to screen resolution
convert -scale 3840x2400 ~/.config/wallpaper.jpg ~/.config/wallpaper.png

# reload i3
i3-msg restart
