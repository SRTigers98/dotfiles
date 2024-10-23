#!/bin/zsh

# colorscheme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#2E3440,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#2E3440,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

# fzf-tab styling
zstyle ":fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest" fzf-preview 'brew info $word'
zstyle ":fzf-tab:complete:*:*" fzf-preview 'bat --color=always $realpath 2>/dev/null || eza -la --color=always --icons $realpath'
zstyle ":fzf-tab:*" fzf-min-height 50

# Shell integrations
eval "$(fzf --zsh)"
