# h-vim Keymaps Reference

Complete reference for all keybindings in h-vim configuration.

## General

| Key | Action | Mode |
|-----|--------|------|
| `<Space>` | Leader key | All |
| `<C-c>` | Escape | Insert |
| `J` | Move line down | Visual |
| `K` | Move line up | Visual |
| `X` | Delete without yanking | Visual |

## Window Navigation

| Key | Action |
|-----|--------|
| `<leader>h` | Navigate to left window |
| `<leader>j` | Navigate to down window |
| `<leader>k` | Navigate to up window |
| `<leader>l` | Navigate to right window |
| `<leader>+` | Resize window vertically (+5) |
| `<leader>-` | Resize window vertically (-5) |
| `<leader>pv` | Open vertical split with explorer |

## File Navigation

| Key | Action |
|-----|--------|
| `<C-p>` | Find git files (FZF) |
| `<leader>pf` | Find all files (FZF) |
| `<leader>ps` | Ripgrep search |
| `<leader>e` | Toggle file explorer (nvim-tree) |

## File Explorer (nvim-tree)

| Key | Action |
|-----|--------|
| `l` | Open file/expand directory |
| `h` | Close directory/go to parent |
| `v` | Open in vertical split |
| `s` | Open in horizontal split |
| `t` | Open in new tab |
| `a` | Create file/directory |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `q` | Close explorer |
| `g?` | Toggle help |

## LSP (Language Server Protocol)

| Key | Action |
|-----|--------|
| `<leader>gd` | Go to definition |
| `<leader>gy` | Go to type definition |
| `<leader>gi` | Go to implementation |
| `<leader>gr` | Find references |
| `<leader>rr` | Rename symbol |
| `<leader>g[` | Previous diagnostic |
| `<leader>g]` | Next diagnostic |
| `<leader>gp` | Previous diagnostic (alias) |
| `<leader>gn` | Next diagnostic (alias) |
| `T` | Show hover documentation |

## Search & Replace

| Key | Action |
|-----|--------|
| `<leader>prw` | Search current word project-wide |
| `<leader>sr` | Open search & replace interface |

## Git

| Key | Action |
|-----|--------|
| `<leader>gs` | Git status |
| `<leader>gj` | Get changes from merge branch (//3) |
| `<leader>gf` | Get changes from target branch (//2) |
| `]c` | Navigate to next git hunk |
| `[c` | Navigate to previous git hunk |

## Tabs

| Key | Action |
|-----|--------|
| `<leader>th` | Go to first tab |
| `<leader>tj` | Go to next tab |
| `<leader>tk` | Go to previous tab |
| `<leader>tl` | Go to last tab |
| `<leader>tt` | Create new tab |
| `<leader>td` | Close current tab |

## Buffers

| Key | Action |
|-----|--------|
| `<C-h>` | Previous buffer |
| `<C-l>` | Next buffer |

## Code Formatting

| Key | Action | Mode |
|-----|--------|------|
| `<leader>cf` | Format code | Normal, Visual |

## Treesitter

| Key | Action | Mode |
|-----|--------|------|
| `<C-space>` | Init/increment selection | Normal, Visual |
| `<BS>` | Decrement selection | Visual |

## Development

| Key | Action |
|-----|--------|
| `<leader>ee` | Insert Go error handling snippet |
| `<leader><CR>` | Reload Neovim config |

## Dashboard

When opening Neovim without files, use these keys in the dashboard:

| Key | Action |
|-----|--------|
| `f` | Find Files |
| `g` | Find Git Files |
| `r` | Search Text (Ripgrep) |
| `o` | Recent Files |
| `c` | Edit Configuration |
| `l` | Edit Language Servers Config |
| `p` | Open Lazy Plugin Manager |
| `m` | Open Mason Tool Installer |
| `q` | Quit Neovim |

---

> **Note**: `<leader>` is mapped to `<Space>` (spacebar)