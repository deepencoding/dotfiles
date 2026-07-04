# Daily Driver Cheatsheet

Until it's muscle memory. `Note`: on your Ghostty, **Option = Alt**, so
AeroSpace's `alt-*` bindings are pressed with the ⌥ Option key.

---

## Layer 1 — AeroSpace (window tiling)  ·  modifier = ⌥ Option

### Focus (move your attention between windows)
| Key | Action |
|---|---|
| `⌥ h / j / k / l` | Focus window left / down / up / right |
| `⌥ tab` | Jump to previous workspace (toggle back-and-forth) |

### Move (rearrange the tiled windows)
| Key | Action |
|---|---|
| `⌥ ⇧ h / j / k / l` | Move focused window left / down / up / right |

### Workspaces (your virtual desktops)
| Key | Action |
|---|---|
| `⌥ 1..5` | Jump to workspace 1–5 |
| `⌥ ⇧ 1..5` | Send focused window to workspace 1–5 (it follows if you `⌥ number` after) |

### Layout & size
| Key | Action |
|---|---|
| `⌥ /` | Tiles layout (side-by-side ↔ stacked) |
| `⌥ ,` | Accordion layout (windows fan out) |
| `⌥ f` | Fullscreen the focused window |
| `⌥ ⇧ space` | Toggle focused window floating ↔ tiling |
| `⌥ -` | Shrink focused window |
| `⌥ =` | Grow focused window |

### Service mode (maintenance)
| Key | Action |
|---|---|
| `⌥ ⇧ ;` | Enter service mode, then… |
| &nbsp;&nbsp;`esc` | reload config + exit |
| &nbsp;&nbsp;`r` | flatten layout to default + exit |
| &nbsp;&nbsp;`backspace` | close all windows but current + exit |

**Suggested workspace assignment** (a convention to adopt, not a setting):
`1` = Ghostty · `2` = Firefox · `3` = Slack · `4` = this cheatsheet / notes · `5` = scratch

---

## Layer 2 — tmux (panes inside the terminal)  ·  prefix = `Ctrl-b`

Everything is `Ctrl-b` **then** the key (release, then press). Start your day
with `t` (your alias) — it attaches to session "main" or creates it.

### Sessions / windows
| Key | Action |
|---|---|
| `t` (shell alias) | Start or re-attach session "main" |
| `tls` (shell alias) | List sessions |
| `Ctrl-b c` | New window (opens in current dir) |
| `Ctrl-b 1..9` | Jump to window by number |
| `Ctrl-b n / p` | Next / previous window |
| `Ctrl-b ,` | Rename current window |
| `Ctrl-b d` | Detach (session keeps running — reattach with `t`) |
| `Ctrl-b w` | Interactive window/session picker |

### Panes (splits)
| Key | Action |
|---|---|
| `Ctrl-b \|` | Split vertically (side by side) |
| `Ctrl-b -` | Split horizontally (stacked) |
| `Ctrl-b h / j / k / l` | Move to pane left / down / up / right |
| `Ctrl-b H / J / K / L` | Resize pane (hold, repeatable) |
| `Ctrl-b z` | Zoom pane to fullscreen (toggle) |
| `Ctrl-b x` | Kill pane |
| `Ctrl-b space` | Cycle pane layouts |

### Copy mode (scroll + select with vim keys)
| Key | Action |
|---|---|
| `Ctrl-b [` | Enter copy mode (now you can scroll with `k/j`, `Ctrl-u/d`) |
| `v` | Begin selection |
| `y` | Copy selection and exit |
| `/` then text | Search up in scrollback |
| `q` | Quit copy mode |

### Maintenance
| Key | Action |
|---|---|
| `Ctrl-b r` | Reload tmux config |

> Mouse is currently **on** — you can click panes and scroll while learning.
> When ready to force keyboard habits, set `mouse off` in `~/dotfiles/tmux/.tmux.conf`.

---

## Layer 3 — Ghostty (the terminal itself)  ·  modifier = ⌘ Cmd

Ghostty runs your shell; you'll mostly let tmux handle splits. But these are
native and always available:
| Key | Action |
|---|---|
| `⌘ t` | New tab |
| `⌘ 1..9` | Jump to tab |
| `⌘ n` | New window |
| `⌘ ⇧ [ / ]` | Previous / next tab |
| `⌘ +` / `⌘ -` / `⌘ 0` | Font bigger / smaller / reset |
| `⌘ k` | Clear scrollback |
| `⌘ ,` | Open Ghostty config |
| `⌘ ⇧ ,` | Reload Ghostty config |

> You have `⌥` set as Alt (`macos-option-as-alt = true`), which is why AeroSpace
> and tmux/vim Alt-bindings work. Trade-off: you can't type Option-special
> characters (µ, ∆) — a fair price for the keybinds.

---

## The shell (fish + your aliases)

### Navigation & search — the highest-ROI habits
| Command | What it does |
|---|---|
| `z partial-name` | Jump to a directory by frecency (learns as you use it) |
| `zi` | Interactive directory jump (fuzzy) |
| `Ctrl-r` | Fuzzy-search command history (fzf) |
| `Ctrl-t` | Fuzzy-find a file, insert its path into the current command |
| `⌥ c` | Fuzzy-cd into a subdirectory |
| `Ctrl-a` / `Ctrl-e` | Jump to start / end of line |
| `⌥ ← / →` | Move by word |
| `Ctrl-w` | Delete previous word |

### Your aliases
| Alias | Runs |
|---|---|
| `ll` / `la` | Detailed / all-files listing with git status (eza) |
| `lt` | Directory tree, 2 levels |
| `cat file` | Syntax-highlighted view (bat) |
| `gs` | `git status -sb` |
| `gd` | `git diff` |
| `gl` | `git log` graph, last 20 |
| `lg` | **lazygit** — full terminal git UI (stage/commit/push by keyboard) |
| `t` / `tls` | tmux attach-or-create / list |
| `d` / `dc` | docker / docker compose |
| `copy` / `paste` | clipboard (works cross-platform) |
| `mkcd name` | make dir and cd into it |

---

## macOS keyboard shortcuts worth internalizing

### System / window
| Key | Action |
|---|---|
| `⌘ space` | Spotlight (launch any app by typing) |
| `⌘ tab` | Switch app (native; you dropped AltTab, so this is app-level) |
| `⌘ \`` | Switch between windows of the *same* app |
| `⌘ q` | Quit app · `⌘ w` close window · `⌘ h` hide app |
| `⌘ ⇧ 4` | Screenshot region · `⌘ ⇧ 4` then `space` = window · `Ctrl` added = to clipboard |
| `⌘ ⇧ 5` | Screenshot/record toolbar |
| `⌘ ⇧ .` | Toggle hidden files (in Finder / dialogs) |

### Text editing (work in almost every macOS text field — bank these)
| Key | Action |
|---|---|
| `⌘ ← / →` | Start / end of line |
| `⌥ ← / →` | Move by word |
| `⌘ ⇧ ← / →` | Select to line start / end |
| `⌥ ⌫` | Delete previous word |
| `⌘ ⌫` | Delete to line start |

---

## Firefox — keyboard-native browsing

### Native (learn these first)
| Key | Action |
|---|---|
| `⌘ l` | Focus address bar (type URL or search) |
| `⌘ t` / `⌘ w` | New tab / close tab |
| `⌘ ⇧ t` | Reopen last closed tab |
| `⌘ 1..8` | Jump to tab N · `⌘ 9` = last tab |
| `Ctrl-tab` | Next tab (in recency order) |
| `⌘ l` then type + `⌘ ↵` | Open typed text as `.com` |
| `/` | Quick-find text on page |
| `⌘ f` | Find on page |
| `⌘ ⇧ a` | Manage add-ons |
| `space` / `⇧ space` | Scroll down / up a screen |

---

## Slack — keyboard-native

| Key | Action |
|---|---|
| `⌘ k` | Jump to any channel or DM (the one shortcut to rule them all) |
| `⌘ t` | Same as `⌘ k` on some versions — quick switcher |
| `⌘ ⇧ k` | Browse DMs |
| `⌘ ⇧ l` | Browse channels |
| `⌘ g` | Search |
| `⌥ ↑ / ↓` | Previous / next channel in sidebar |
| `⌘ ⇧ a` | All unreads |
| `⌘ [ / ]` | History back / forward (like a browser) |
| `e` (on a message, hover) | Edit |
| `⌘ ⇧ \\` | React to last message |
| `⌘ ⇧ m` | Mentions & reactions |
| `Esc` | Mark channel read |
