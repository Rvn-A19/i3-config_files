#!/bin/bash

cd "`dirname $(realpath $0)`"

i3config_dir="$HOME/.config/i3/"

if [ ! -d "$i3config_dir" ]; then
  echo "No i3 config dir. Create."
  mkdir -p "$i3config_dir"
fi

if [ ! -d "$HOME/.fonts" ]; then
  mkdir "$HOME/.fonts"
fi

cd bin
for fontfile in *.otf; do
  if [ ! -f "$HOME/.fonts/$fontfile" ]; then
    cp -v "$fontfile" "$HOME/.fonts/"
  else
    echo "Omit $fontfile: already exist."
  fi
done
cd ..

if [ ! -d "$HOME/scripts" ]; then
  mkdir "$HOME/scripts"
fi

cp onmouse_touchpad_off.sh "$HOME/scripts/"

if [ ! -d "$HOME/wallpaper" ]; then
  mkdir "$HOME/wallpaper"
fi

cp bin/Grass-Wallpaper-green-19784909-2560-1600.jpg "$HOME/wallpaper"

for f in config i3blocks.conf; do
  
  if [ -f "$i3config_dir$f" ]; then
    echo "Backup $f"
    cp -v "$i3config_dir$f" "$i3config_dir$f.bak"
  fi
  cp -v $f "$i3config_dir"

done

