## A screenshot tool for linux

## Installation

> Install dependencies

For Arch Based Distro

```
sudo pacman -S xdotool xclip maim
```

For Debian Based Distro

```
sudo apt install xdotool xclip maim
```

For RPM Based Distro

```
sudo dnf install xdotool xclip maim
```

> Clone the repository

```
git clone https://github.com/warmdev17/warmshot.git
```

> Makes the script executable

```
cd warmshot
chmod +x warmshot.sh
```

> Makes the script executable from any location on the system

```
sudo mv warmshot.sh /usr/local/bin/warmshot
```

## Usage

```
Usage:
  warmshot [option]
option:
  --f     Fullscreen screenshot saved to file
  --a     Area screenshot saved to file
  --w     Window screenshot saved to file
  --cf    Fullscreen screenshot to clipboard
  --ca    Area screenshot to clipboard
  --cw    Window screenshot to clipboard
  --help, -h    Display this help message
```

> Example usage on i3wm

```
# Screenshots
bindsym Print exec --no-startup-id warmshot --f
bindsym $mod+Print exec --no-startup-id warmshot --w
bindsym Shift+Print exec --no-startup-id warmshot --a

# Clipboard Screenshots
bindsym Ctrl+Print exec --no-startup-id warmshot --cf
bindsym Ctrl+$mod+Print exec --no-startup-id warmshot --cw
bindsym Ctrl+Shift+Print exec --no-startup-id warmshot --ca
```
