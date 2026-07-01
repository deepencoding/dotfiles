# ~/.config/fish/conf.d/aliases.fish
# Aliases / abbreviations. conf.d files are auto-sourced by fish.

# ── Modern replacements ───────────────────────────────────────────────
alias ls  'eza --group-directories-first'
alias ll  'eza -l --group-directories-first --git'
alias la  'eza -la --group-directories-first --git'
alias lt  'eza --tree --level=2'
alias cat 'bat --paging=never'
alias grep 'rg'
alias find_ 'fd'          # keep real find intact; use fd directly anyway
alias vim 'nvim'
alias vi  'nvim'

# ── Git ───────────────────────────────────────────────────────────────
alias g   'git'
alias gs  'git status -sb'
alias gd  'git diff'
alias gl  'git log --oneline --graph -20'
alias lg  'lazygit'

# ── tmux ──────────────────────────────────────────────────────────────
alias t   'tmux new -A -s main'   # attach to "main" or create it
alias tls 'tmux ls'

# ── Clipboard (per-OS divergence) ─────────────────────────────────────
if test (uname) = Darwin
    alias copy  'pbcopy'
    alias paste 'pbpaste'
else
    if type -q wl-copy
        alias copy  'wl-copy'
        alias paste 'wl-paste'
    else
        alias copy  'xclip -selection clipboard'
        alias paste 'xclip -selection clipboard -o'
    end
end

# ── Containers ────────────────────────────────────────────────────────
alias d  'docker'
alias dc 'docker compose'
