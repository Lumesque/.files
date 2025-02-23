EDITOR := "nvim"
TERMINAL := "ghostty"
SHELL := "fish"


[group('install')]
install location name:
    just {{location}}/install {{name}}

[group('clean')]
clean location name:
    just {{location}}/clean {{name}}

[group('sync')]
sync location name:
    just {{location}}/sync {{name}}

[group('fresh-install')]
install-default:
    just install terminals {{TERMINAL}}
    just install shells {{SHELL}}
    just install editors {{EDITOR}}

[group('fresh-install')]
install-full desktop distro:
    just install-default
    just install-{{desktop}}
    just install-{{distro}}

# This is a work in progress, need a better merge/sync
[group('install')]
install-git:
    [ ! -f ~/.gitconfig ] && cp ./.gitconfig ~ || echo "git config already installed"

[group('clean-commands')]
clean-git:
    echo "Clean git is not recommended."

[group('setup')]
setup-for-install category config_to_copy:
    #!/usr/bin/env bash
    if [ ! -d ./{{category}} ] ; then
        mkdir -p ./{{category}}
        cp ./editors/justfile ./{{category}}/justfile
    #lineNum=$(grep "group('setup')" | head -n 1 | awk -F ':' '{print $1}')
    #upperCategory=$(echo {{category}} | tr '[[:lower:]]' '[[:upper:]]')
    #let "lineNum--"
        sed -i 's/editor/{{category}}/g' ./{{category}}/justfile
    fi
    if ! [ -d {{config_to_copy}} -o -f {{config_to_copy}} ] ; then
        echo "Directory {{config_to_copy}} does not exist to copy" >&2
        exit 2
    fi
    cp -r {{config_to_copy}} ./{{category}}/

[group('setup')]
setup-distro-pkgs distro cmd:
    [ -d ./distros/{{distro}} ]
    -rm -f ./distros/{{distro}}/requirements.txt
    for i in $(cat ./requirements.txt | tr '|' '\n') ; do \
        if {{cmd}} $i ; then \
            echo "$i" >> ./distros/{{distro}}/requirements.txt ; \
        fi \
    done

[group('gentoo')]
sync-gentoo:
    just setup-distro-pkgs gentoo 'equery check'
    just sync distros gentoo
    
[group('gentoo')]
install-gentoo: 
    just setup-distro-pkgs gentoo 'equery check'
    just install distros gentoo

[group('gentoo')]
clean-gentoo: 
    just clean distros gentoo

[group('hyprland')]
install-hyprland:
    just install desktop hyprland

[group('hyprland')]
sync-hyprland:
    just sync desktop hyprland

[group('hyprland')]
clean-hyprland:
    just clean desktop hyprland
