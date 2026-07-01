#!/usr/bin/env bash
# bootstrap.sh — fresh machine → working setup.
# Bash, not fish: scripts are POSIX-ish and portable, fish is interactive-only.
# Idempotent: safe to re-run any time.

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname)"

info()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
ok()    { printf '\033[1;32m ✓ \033[0m %s\n' "$*"; }

# ── 1. Homebrew ───────────────────────────────────────────────────────
if ! command -v brew >/dev/null 2>&1; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ "$OS" = "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
  else
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
fi
ok "Homebrew present"

# ── 2. Packages ───────────────────────────────────────────────────────
info "Installing packages from Brewfile..."
brew bundle --file="$DOTFILES/Brewfile"
ok "Packages installed"

# ── 3. Stow the dotfiles ──────────────────────────────────────────────
# Shared packages on both OSes; aerospace only on macOS.
PACKAGES=(fish ghostty nvim tmux git starship ssh)
[ "$OS" = "Darwin" ] && PACKAGES+=(aerospace)

info "Symlinking configs with stow: ${PACKAGES[*]}"
cd "$DOTFILES"
for pkg in "${PACKAGES[@]}"; do
  stow --restow --target="$HOME" "$pkg"
done
ok "Dotfiles linked"

# ── 4. fish as default shell ──────────────────────────────────────────
FISH_PATH="$(command -v fish)"
if ! grep -q "$FISH_PATH" /etc/shells; then
  info "Adding fish to /etc/shells (needs sudo)"
  echo "$FISH_PATH" | sudo tee -a /etc/shells >/dev/null
fi
if [ "$SHELL" != "$FISH_PATH" ]; then
  info "Setting fish as login shell (needs password)"
  chsh -s "$FISH_PATH"
fi
ok "fish is the login shell"

# ── 5. Out-of-repo local files (never committed) ──────────────────────
touch_if_missing() {
  if [ ! -f "$1" ]; then
    printf '%s\n' "$2" > "$1"
    ok "Created $1 (untracked — put private values here)"
  fi
}
mkdir -p "$HOME/.config/fish" "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
touch_if_missing "$HOME/.config/fish/secrets.fish" "# API keys / tokens go here. NEVER commit this file."
touch_if_missing "$HOME/.gitconfig.local"          "[user]
    name = YOUR NAME
    email = YOUR@EMAIL"
touch_if_missing "$HOME/.ssh/config.local"         "# Machine-specific SSH hosts go here."
chmod 600 "$HOME/.ssh/config.local"

# ── 6. Post-install notes ─────────────────────────────────────────────
echo
info "Done. Manual steps remaining:"
echo "  1. Edit ~/.gitconfig.local with your real name/email"
echo "  2. Open a NEW terminal (Ghostty on macOS) so fish + starship load"
echo "  3. First 'nvim' launch installs plugins automatically — let it finish, then :Mason to watch LSPs install"
[ "$OS" = "Darwin" ] && echo "  4. Launch AeroSpace once from /Applications and grant Accessibility permission"
[ "$OS" = "Darwin" ] && echo "  5. Quit Rectangle and remove it from Login Items (it will fight AeroSpace)"
echo "  6. colima start   # when you need containers"
