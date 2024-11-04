# dotfiles

Management software: [chezmoi](https://github.com/twpayne/chezmoi)

## Configured Applications

- [zsh](https://github.com/zsh-users/zsh)
- [tmux](https://github.com/tmux/tmux)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [yamllint](https://github.com/adrienverge/yamllint)
- [Zellij](https://github.com/zellij-org/zellij)
- [Wez's Terminal](https://github.com/wez/wezterm)

## Installation

Below are the instructions for the complete shell setup along with the dotfiles.

Before that, you need to install chezmoi and apply the dotfiles.

```bash
chezmoi init --apply https://github.com/srtigers98/dotfiles.git
```

### Packages

To install all required packages, run the `install-packages` script:

```sh
install-packages
```

Supported package managers are

- Pacman
- Homebrew

The script should be available globally via `.zshrc`.
If not, you can find it in the `.scripts` directory.

### Emulator Setup

The recommended and configured terminal emulator is [wezterm](https://wezfurlong.org/wezterm/index.html).
Wezterm is installed along with the packages and is configured in the dotfiles.

### NeoVim Configuration

You can find the NeoVim configuration along with the documentation [here](https://github.com/SRTigers98/nvim-config).

### Terminal Multiplexer

You can use either [tmux](https://github.com/tmux/tmux)
or [ZelliJ](https://github.com/zellij-org/zellij) as terminal multiplexer.

#### tmux (recommended)

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

#### Zellij

To start a new ZelliJ session, run the following command:

```sh
zellij attach --create default
```
