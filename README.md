# Dotfile repository

-----

## Table of Contents
- [About](#about)
- [Installing](#installing)
- [Syncing](#syncing)
- [Desktop](#desktop)
- [Distros](#distros)
- [Editors](#editors)
- [Terminals](#terminals)
- [Shells](#shells)


### About
Currently these dotfiles are setup to run and generate softlinks for mainly hyprland and gentoo.
The justfile is made to be able to install from any of the folders to your willingness, and the dotfile repository is made to stay on your system except for cases of desktops and initial setups for distros


### Installing
Currently there are 5 installations that are present, each meant to represent one installation, and each have either one of two types, that being:
1. Those that are softlinked
    * These are ones that are softlinked directly to this repository, the main reason for this is so that it is auto-updated.
2. Those that are hard-copied, with syncing capability
    * This is done for distros and desktops, as any period without them can be a bit chaotic when setting up
In order to run any installation, make sure you have just installed, and run
`just install 'category' 'program'`
For instance, to install ghostty:
`just install terminals ghostty`

> [!NOTE]
> For a full default installation, use `just install-default` as a step.
> The defaults for this can be seen at the top of the just file, made to be
> overwritten for a default installation.
>
> If you are looking for one with desktop included, use `just install-full` 

### Syncing
Due to some softlinks being unable to be ran, you can run
`just sync 'category' 'program'`
in order to sync what is currently in the location with what is in the repository.

### Desktop
The current supported desktops are:
1. Hyprland
    * In order to install, it uses the following other packages
        1. Waybar
        2. Fuzzel
    * See `desktop/hyprland/hypr/keybindings.conf` to get more understanding of what keybinds come with the program
    * Currently, backgrounds will have to be set up manually after install

### Distros
The current supported distros are:
1. Gentoo
    * In order for the requirements to be set up correctly, this assumes that you have `gentoolkit` downloaded onto your system
    * These use files are specifically made for hyprland, it is probably better to not use these, but these serve as just an example to what I have done so that I can look into it later

### Editors
The current supported editors are:
1. Neovim
    * This uses the 'Lazy' package manager
    * Some highlights include:
        1. space-t-t for opening up a terminal
        2. ctrl-w esc for leaving that terminal
        3. space-l-g for lazygit
    * neovim does not install lazygit for you, you must do this per your package manager specifically
    * See `editors/nvim/lua/plugins` for a full list of what is used/supported

### Terminals
The current supported terminals are:
1. Ghostty
    * The only non-defaults that I changed are removing the top layer window, and changing the theme
2. Kitty
    * Similar to ghostty, not much was changed
    * Features key bindings to map copy paste

### Shells
The current supported shells are:
1. Fish
    * This uses 'pure' for prompt
    * This uses 'fzf' for setting up search-history
    * This comes with some functions for git pushing, ls overrides, neovim with fzf, and some common commands with 'fd'
    * See `shells/fish/functions` to see more
        1. This may seem very large, but any of the self-made functions do not have a '_' appendedto them except for the 'fzf_configure' and the 'fish_' ones
