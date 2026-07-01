# dotfiles

One repo. macOS (primary) + Linux. Windows deliberately out of scope.

**Stack:** fish (interactive) · bash (scripts) · Ghostty · tmux · Neovim (kickstart-style) · Starship · Stow · Brewfile · AeroSpace (macOS) · Colima · lazygit · delta · fzf/rg/fd/zoxide/bat/eza

## Install (fresh machine)

```bash
git clone <your-remote> ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

Idempotent — re-run whenever. Then follow the printed manual steps.

## How it works

**Stow.** Each top-level directory is a "package" mirroring `$HOME`.
`stow fish` symlinks `fish/.config/fish/*` → `~/.config/fish/*`. Edit the
file in the repo, the live config changes instantly (it's a symlink), commit
when happy. To adopt an existing config file into the repo: move it into the
matching package path, then `stow --restow <pkg>`.

**Per-OS divergence: one branch, runtime checks.** No OS branches — divergence
lives inline where it occurs (`if test (uname) = Darwin` in fish,
`OS.mac?` in the Brewfile, `IgnoreUnknown` in ssh config, package list in
`bootstrap.sh`). Fix a bug once, every machine gets it on next pull.

**Secrets: out of repo.** Three untracked local files, sourced/included if present:

| File | Holds |
|---|---|
| `~/.config/fish/secrets.fish` | API keys, tokens, work env vars |
| `~/.gitconfig.local` | git name/email |
| `~/.ssh/config.local` | machine-specific SSH hosts |

SSH **keys** are never in the repo, ever. Only the config is.

**fish vs bash rule.** fish is the interactive shell only. Anything scripted,
committed, or run on a server is `#!/usr/bin/env bash`. The shebang decides
the interpreter, not your login shell — so fish's non-POSIX syntax never
bites you in scripts.

## Repo layout

```
dotfiles/
├── Brewfile            # every installed tool, declared
├── bootstrap.sh        # fresh machine → working setup
├── fish/               # shell config, aliases, functions
├── ghostty/            # terminal (minimal — Ghostty defaults are good)
├── nvim/               # single init.lua, kickstart-style. READ IT.
├── tmux/               # multiplexer
├── git/                # gitconfig (delta pager) + global ignore
├── starship/           # prompt
├── aerospace/          # macOS tiling WM (not stowed on Linux)
└── ssh/                # ssh config template (keys NEVER here)
```

## The keyboard-native learning path

Everything installs at once, but *habits* come one at a time:

1. **Week 1 — Ghostty + fish + CLI stack.** Use `z dir` instead of cd paths,
   `Ctrl-R` (fzf history), `Ctrl-T` (fzf files), `lg` for git.
2. **Week 2 — tmux.** `t` starts/attaches your main session. Learn:
   `C-b |` / `C-b -` split, `C-b h/j/k/l` move. Mouse is ON as training
   wheels — turn it off in `.tmux.conf` when ready.
3. **Week 3+ — Neovim.** `vimtutor` in a terminal first (30 min, twice).
   Then live in nvim. `Space ff` = Cmd+P, `Space fg` = project search,
   `gd` = go to definition, `Space e` = file explorer. `which-key` pops
   up after `Space` to remind you what exists.
4. **Ongoing — AeroSpace.** `alt-h/j/k/l` focus, `alt-1..5` workspaces,
   `alt-shift-…` to move windows. Suggested: 1=terminal, 2=browser, 3=chat.
5. **Browser.** Install Vimium extension: `f` to click links by keyboard,
   `j/k` scroll, `H/L` history.

Rule while learning: when you catch your hand on the mouse, ask "what's the
keyboard way?" once, do it the keyboard way, move on. Don't stop to optimize.

## Maintenance

- New tool? Add to `Brewfile`, run `brew bundle`, commit.
- New config? Create the package dir mirroring `$HOME`, `stow <pkg>`, commit.
- Second machine drifted? `git pull && ./bootstrap.sh`.
- Neovim plugin updates: `:Lazy sync` inside nvim.
