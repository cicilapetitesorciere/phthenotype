# Phthenotype
A quick and easy style changer. I've designed it with Sway, Waybar, Wofi, and Alacritty in mind; but it should be usuable for just about anything whose look can be changed by switching out a configuration file. You can see a quick demo here https://youtu.be/irEh6uH5V30

# Installation
Clone the repo, `cd` into it and execute `./install.sh` (NOTE: Make sure that `~/.local/bin` is in the path). Then link whichever programs you would like synchronized with it as follows

## Sway
```
cd ~/.config/sway
ptheno link style
ptheno link wallpaper.jpg
```

Then add the following lines to your Sway config
```
output * bg wallpaper.jpg fill
include style
```

## Waybar
```
cd ~/.config/waybar
ptheno link style.css
```

## Wofi
```
cd ~/.config/wofi
ptheno link style.css
```

## Alacritty
```
cd ~/.config/alacritty
ptheno link alacritty.yml
```

## Finishing Touches (Recommended)
Back up your current style using
```
ptheno save my-style
```


## Usage
### `ptheno link <file>` 
Moves `<file>` to a directory in `phthenotype/active` and replaces the original file with a symbolic link to the file's new location.

### `ptheno unlink <file>`
Undoes `ptheno link`

### `ptheno save [name]`
Copies the contents of `phthenotype/active` into a directory in `phthenotype/styles` so that they can be loaded later.

### `ptheno load <name>`
Replaces the contents of `phthenotype/active` with those of `phthenotype/styles/<name>` and reloads Sway. 

### `ptheno status`
Prints the name of the current style (e.g. the content of `phthenotype/active/name`)

### `ptheno ls`
Lists availible styles (e.g. the directories in `phthenotype/styles`)

### `ptheno rm <name>`
Removes a directory in `phthenotype/styles`

