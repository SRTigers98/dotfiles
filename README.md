# dotfiles

Management software: [stow](https://www.gnu.org/software/stow/)

## Installation

Below are the instructions for the complete shell setup along with the dotfiles.

Before that, you need to install stow and apply the dotfiles.
For convenience you can use the [tasks](https://github.com/go-task/task)
defined in the `Taskfile`.

```bash
task stow
```

### Packages

To install all required packages, run the `install-packages` script:

```sh
task install-packages
```

Supported package managers are

- Pacman
- Homebrew

### Emulator Setup

The recommended (and not yet configured) terminal emulator is [Ghostty](https://github.com/ghostty-org/ghostty).
Ghostty is installed along with the packages and is configured in the dotfiles.

### NeoVim Configuration

You can find the NeoVim configuration along with the documentation [here](https://github.com/SRTigers98/nvim-config).

### Terminal Multiplexer

The recommended and configured terminal multiplexer is [tmux](https://github.com/tmux/tmux).

To start a new tmux session, run the following command:

```sh
tmux new-session -A -s default
```

Initially you have to setup the [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).
To install it run the following command:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then you can install all plugins by pressing `Ctrl+a+I` while tmux is running.
