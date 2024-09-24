wget -O ~/.config/wallpaper.jpg https://unsplash.it/1920/1080?random

# convert jpg to png for lock screen adjust accordingly to screen resolution
convert -scale 3840x2160 ~/.config/wallpaper.jpg ~/.config/wallpaper.png

# reload i3
i3-msg restart
