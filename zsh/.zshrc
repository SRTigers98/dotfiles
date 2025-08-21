# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "${ZINIT_HOME}" ]; then
  mkdir -p "$(dirname ${ZINIT_HOME})"
  git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
fi
source "${ZINIT_HOME}/zinit.zsh"

# zsh theme
zinit ice depth=1; zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.p10k_ext.zsh ]] || source ~/.p10k_ext.zsh

# ls_colors theme
source "${HOME}/.config/dircolors/nord"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
if type brew &>/dev/null; then
  fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi
fpath=($HOME/.zfunc $fpath)
autoload -U compinit
compinit

# Completion styling
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=${HISTSIZE}
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word # delete previous word with ctrl+backspace
bindkey '^[[Z' undo # Shift+tab undo last action

# Edit current command in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line # Ctrl-X+Ctrl-E

# Aliases
alias vim="nvim"
alias ls="eza"
alias ll="eza --icons -la"
alias cat="bat"
alias find="fd"
alias rm="rm -i"
alias cd..="cd .."
alias gr='cd "$(git rev-parse --show-toplevel)"' # cd to git repository root
alias gg="lazygit"
alias k="kubectl"

# Copy and Paste
if command -v xclip &>/dev/null; then
  alias copy="xclip -selection clipboard"
  alias paste="xclip -selection clipboard -o"
fi

# Environment
export EDITOR="nvim"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# Configure fzf
source "${HOME}/.config/fzf/config.sh"

# Configure podman
if type "podman" &>/dev/null; then
  alias docker="podman"
  export DOCKER_HOST="unix://$(podman info -f "{{.Host.RemoteSocket.Path}}")"
fi

# Highlight man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Highlight --help messages
alias -g -- -h="-h 2>&1 | bat --language=help --style=plain"
alias -g -- --help="--help 2>&1 | bat --language=help --style=plain"

# Additional scripts
export PATH="${PATH}:${HOME}/.scripts"

# Local configuration
if [ -e "${HOME}/.zsh_local" ]; then
  source "${HOME}/.zsh_local"
fi
