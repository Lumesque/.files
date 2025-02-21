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

[group('clean-commands')]
clean-editor:
    just editors/clean {{EDITOR}}

[group('clean-commands')]
clean-terminal:
    just terminals/clean {{TERMINAL}}

[group('clean-commands')]
clean-shell:
    just shells/clean {{SHELL}}
