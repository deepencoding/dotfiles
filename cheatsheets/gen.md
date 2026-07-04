# Daily Driver Cheatsheet

Every binding here matches your actual config. Keep this open in workspace 4
until it's muscle memory. `Note`: on your Ghostty, **Option = Alt**, so
AeroSpace's `alt-*` bindings are pressed with the ⌥ Option key.

The mental model that makes all of this click: **AeroSpace moves you between
whole windows and workspaces. tmux moves you between panes inside one terminal.
Vim moves you inside one file.** Three nested layers, same `h/j/k/l` direction
keys at every layer so your hands never relearn "left/down/up/right."

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
| `Ctrl-a / Ctrl-e` | Line start / end (emacs-style, works everywhere) |
| `Ctrl-k` | Delete to end of line |

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

### Add Vimium (extension) for true mouse-free browsing
Install from Firefox Add-ons, then:
| Key | Action |
|---|---|
| `f` | Show link hints — type the letters to click a link |
| `F` | Same, but open link in new tab |
| `j / k` | Scroll down / up |
| `gg / G` | Top / bottom of page |
| `H / L` | Back / forward in history |
| `J / K` | Previous / next tab |
| `x` | Close current tab |
| `o` | Open a URL / bookmark (fuzzy) |
| `/` | Search page, `n` for next match |

---

## Slack — keyboard-native

| Key | Action |
|---|---|
| `⌘ k` | Jump to any channel or DM (the one shortcut to rule them all) |
| `⌘ t` | Same as `⌘ k` on some versions — quick switcher |
| `⌘ ⇧ k` | Browse DMs |
| `⌘ ⇧ l` | Browse channels |
| `Ctrl-g` | Search |
| `⌘ ↑ / ↓` | Previous / next channel in sidebar |
| `⌥ ↑ / ↓` | Previous / next *unread* channel |
| `⌘ ⇧ a` | All unreads |
| `⌘ [ / ]` | History back / forward (like a browser) |
| `e` (on a message, hover) | Edit / react menu |
| `⌘ ⇧ \\` | React to last message |
| `up arrow` (empty input) | Edit your last message |
| `⌘ ⇧ m` | Mentions & reactions |
| `Esc` | Mark channel read |

---

## The one workflow that ties it together

A realistic morning, all keyboard:

1. `⌥ 1` → Ghostty. Type `t` → your tmux session "main" attaches.
2. `Ctrl-b |` → split. Left pane: `nvim`. Right pane: run tests / server.
3. `z chosenly` → jump to the repo. `lg` → stage and commit in lazygit.
4. `⌥ 2` → Firefox. `⌘ l` → search a doc. `f` → click the result (Vimium).
5. `⌥ 3` → Slack. `⌘ k` → jump to the channel you need. Reply. `Esc`.
6. `⌥ 1` → back to Ghostty, `Ctrl-b h/l` between panes. Never touched the mouse.

The direction keys `h/j/k/l` mean the same thing at all three layers. That
repetition is the whole point — one motion vocabulary, three scopes.
