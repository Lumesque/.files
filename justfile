ZIGFLAGS := "--summary all"
EDITOR := "nvim"
TERMINAL := "ghostty"
SHELL := "fish"

install: install-editor install-terminal install-shell
clean: clean-editor clean-terminal clean-shell

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
install-desktop:
    just desktop/install {{DESKTOP}}

[group('clean-commands')]
clean-editor:
    just editors/clean {{EDITOR}}

[group('clean-commands')]
clean-terminal:
    just terminals/clean {{TERMINAL}}

[group('clean-commands')]
clean-shell:
    just shells/clean {{SHELL}}

[group('clean-commands')]
clean-desktop:
    just desktop/clean {{DESKTOP}}

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
