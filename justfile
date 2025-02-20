ZIGFLAGS := "--summary all"
EDITOR := "nvim"

install: install-editor
clean: clean-editor

[group('install-commands')]
install-editor:
    just editors/install {{EDITOR}}

[group('clean-commands')]
clean-editor:
    just editors/clean {{EDITOR}}

[group('test')]
something:
	echo "Hello!"
