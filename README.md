# Phthenotype
A quick and easy style changer. I've designed it with Sway, Waybar, Wofi, and Alacritty in mind; but it should be usuable for just about anything whose look can be changed by switching out a configuration file. 

# Installation
Clone the repo, `cd` into it and run
```
bash ptheno.sh install
``` 
(NOTE: Make sure that `~/.local/bin` is in the path). To enable autocompletion, add the following to your shell's config file (e.g`.bashrc`, `.zshrc`, etc.)
```
source $(ptheno home)/completion.sh
```

Then link whichever programs you would like synchronized with it as follows:

## Sway
```
cd ~/.config/sway
ptheno link style
```

Then add the following lines to your Sway config
```
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