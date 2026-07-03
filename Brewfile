# Brewfile — the single source of truth for installed tools.
# Rebuild any machine with:  brew bundle --file=~/dotfiles/Brewfile
# Homebrew works on Linux too (Linuxbrew); casks are macOS-only and guarded.

# ── Core ──────────────────────────────────────────────────────────────
brew "stow"          # dotfile symlink manager
brew "fish"          # interactive shell
brew "starship"      # prompt
brew "tmux"          # terminal multiplexer
brew "neovim"        # editor
brew "git"           # version control

# ── Modern CLI stack ──────────────────────────────────────────────────
brew "fzf"           # fuzzy finder
brew "ripgrep"       # grep, but fast (rg)
brew "fd"            # find, but sane
brew "zoxide"        # cd, but smart (z)
brew "bat"           # cat with syntax highlighting
brew "eza"           # ls, but modern
brew "git-delta"     # diffs worth reading
brew "lazygit"       # terminal git UI
brew "glow"          # markdown renderer

# ── Neovim build/runtime deps ─────────────────────────────────────────
brew "node"          # some LSP servers need it
brew "stylua"        # lua formatter used by conform.nvim

# ── Containers ────────────────────────────────────────────────────────
brew "colima"
brew "docker"        # CLI only; colima is the runtime

# ── macOS only ────────────────────────────────────────────────────────
if OS.mac?
  cask "ghostty"
  cask "nikitabobko/tap/aerospace"
  cask "font-jetbrains-mono-nerd-font"
end
