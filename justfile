ZIGFLAGS := "--summary all"
EDITOR := "nvim"
TERMINAL := "ghostty"

install: install-editor install-terminal
clean: clean-editor clean-terminal

[group('install-commands')]
install-editor:
    just editors/install {{EDITOR}}

[group('install-commands')]
install-terminal:
    just terminals/install {{TERMINAL}}

[group('clean-commands')]
clean-editor:
    just editors/clean {{EDITOR}}

[group('clean-commands')]
clean-terminal:
    just terminals/clean {{TERMINAL}}
