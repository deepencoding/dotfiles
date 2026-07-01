# ~/.config/fish/config.fish
# Interactive shell config. Scripts live in bash — fish is for the prompt only.

# ── Homebrew (per-OS divergence handled at runtime) ──────────────────
if test (uname) = Darwin
    # Apple Silicon default; Intel Macs use /usr/local
    if test -x /opt/homebrew/bin/brew
        eval (/opt/homebrew/bin/brew shellenv)
    else if test -x /usr/local/bin/brew
        eval (/usr/local/bin/brew shellenv)
    end
else
    # Linuxbrew
    if test -x /home/linuxbrew/.linuxbrew/bin/brew
        eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    end
end

# ── PATH extras ───────────────────────────────────────────────────────
fish_add_path -g ~/.local/bin

# ── Environment ───────────────────────────────────────────────────────
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx MANPAGER 'nvim +Man!'   # read man pages inside neovim

# fzf: use fd, respect .gitignore
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# ── Interactive-only setup ────────────────────────────────────────────
if status is-interactive
    # Prompt
    starship init fish | source

    # Smarter cd (z / zi)
    zoxide init fish | source

    # fzf keybindings: Ctrl-T files, Ctrl-R history, Alt-C cd
    fzf --fish | source

    # No greeting
    set -g fish_greeting
end

# ── Secrets: OUT OF REPO ──────────────────────────────────────────────
# Put API keys / tokens in ~/.config/fish/secrets.fish (git-ignored, never
# stowed, never committed). Sourced only if present.
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end
