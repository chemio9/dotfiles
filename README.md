##  A repo stored my config files

### Configs Contained
* Neovim ( v0.9+ or beta version recommended )
* Wayland Desktop Environment
  * Hyprland
  * waybar
  * eww ( still working, not pushed yet :P )
* aria2 download manager
* wezterm
* paru & systemd ( on Archlinux )
* rofi launcher
* zathura pdf reader
* lsd ( ls replacement )
* zsh ( powerlevel10k and zimfw )

## Neovim Config Install instructions
Install requires Neovim 0.9+. Always review the code before installing a configuration.
Clone the repository and install plugins
```bash
git clone git@github.com:chenrry666/dotfiles ~/.config/chenrry666/dotfiles
NVIM_APPNAME=chenrry666/dotfiles/.config/nvim nvim --headless +"Lazy! sync" +qa
```
Open Neovim with this configuration
```bash
NVIM_APPNAME=chenrry666/dotfiles/.config/nvim nvim
```

### Something have to mention
Always check the config files before you install! Use at your own risk!
