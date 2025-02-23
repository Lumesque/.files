ZIGFLAGS := "--summary all"
EDITOR := "nvim"
TERMINAL := "ghostty"
SHELL := "fish"


[group('a:fresh-install')]
install: install-editor install-terminal install-shell install-git
[group('a:fresh-install')]
clean: clean-editor clean-terminal clean-shell clean-git

[group('install-commands')]
install-editor:
    just editors/install {{EDITOR}}

[group('install-commands')]
install-terminal:
    just terminals/install {{TERMINAL}}

[group('install-commands')]
install-shell:
    just shells/install {{SHELL}}

[group('install-commands')]
install-git:
    [ ! -f ~/.gitconfig ] && cp ./.gitconfig ~ || echo "git config already installed"

[group('install-commands')]
install-desktop desktop:
    just desktop/install {{desktop}}

[group('install-commands')]
install-distro distro:
    just distros/install {{distro}}

[group('clean-commands')]
clean-editor:
    just editors/clean {{EDITOR}}

[group('clean-commands')]
clean-git:
    echo "Clean git is not recommended."

[group('clean-commands')]
clean-terminal:
    just terminals/clean {{TERMINAL}}

[group('clean-commands')]
clean-shell:
    just shells/clean {{SHELL}}

[group('clean-commands')]
clean-desktop desktop:
    just desktop/clean {{desktop}}

[group('clean-commands')]
clean-distros distro:
    just distros/clean {{distro}}

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

[group('sync')]
sync location name:
    just {{location}}/sync {{name}}

[group('gentoo')]
sync-gentoo:
    just setup-distro-pkgs gentoo 'equery check'
    just sync distros gentoo
    
[group('gentoo')]
install-gentoo: 
    just setup-distro-pkgs gentoo 'equery check'
    just install-distros gentoo

[group('gentoo')]
clean-gentoo: 
    just clean-distros gentoo

[group('hyprland')]
install-hyprland:
    just install-desktop hyprland

[group('hyprland')]
sync-hyprland:
    just sync desktop hyprland

[group('hyprland')]
clean-hyprland:
    just clean-desktop hyprland
