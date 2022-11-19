# Phthenotype
A quick and easy style changer for Sway, Waybar, Wofi, and Alacritty (and possibly more to come!)

# Installation
Clone the repo, `cd` into it and execute `./install.sh`. Then link whichever programs you would like synchronized with it as follows

## Sway
```
cd ~/.config/sway
ptheno link style
ptheno link wallpaper.jpg
```

Then add the following lines to your Sway config
```
output * bg wallpaper.jpg
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

## Usage
You may edit your configs as you normally would. To save your current style, execute `ptheno save <name>` with a name of your choice. To see a list of availible styles, execute `ptheno ls`, and choose one using `ptheno load <name>`.

