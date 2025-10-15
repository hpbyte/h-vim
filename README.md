<div align="center">
  <img src="https://github.com/user-attachments/assets/1aff0425-aabb-4cd4-964c-3bc9a75b8678" alt="h-vim" />
</div>

<hr />

A minimal Neovim config for speed and sanity.

- `FZF + ripgrep` instead of Telescope.
- Conditional loading for faster startups.
- Traditional vim keybinds that actually make sense.

![image](https://github.com/user-attachments/assets/76506261-db56-4548-80f4-d9556f3923dc)

![image](https://github.com/user-attachments/assets/0721eeda-66e8-4eaf-a632-a5f02a563aef)

## ✨ Features

- **Plugin Manager**: Lazy.nvim for fast startup and lazy loading
- **LSP Support**: TypeScript, Go, Astro, and Lua language servers with Mason
- **File Navigation**: FZF with ripgrep integration for blazing fast search
- **Git Integration**: Fugitive and GitSigns for comprehensive Git workflow
- **File Explorer**: nvim-tree with vim-like navigation (h/l keys)
- **Search & Replace**: nvim-spectre for project-wide find/replace operations
- **Code Formatting**: conform.nvim for configurable code formatting
- **Startup Screen**: Minimal dashboard with quick actions and plugin stats
- **Completion**: nvim-cmp with LSP, buffer, path, and snippet sources
- **Syntax Highlighting**: Treesitter with incremental selection
- **Configurable Themes**: Multiple theme options including OneDark, Catppuccin, Gruvbox, Tokyo Night, Rose Pine, and GitHub themes

## ⚡️ Requirements

Ensure you have the following tools installed:

- `Neovim` (>= 0.11.0)
- `ripgrep` (rg) - `brew install ripgrep`
- `fd` or `find` - `brew install fd`
- `git`
- A [Nerd Font](https://www.nerdfonts.com/) for proper icon display

## 📦 Installation

1. Backup your existing Neovim configs:

```bash
mv ~/.config/nvim{,.bak}
```

2. Clone this repository to your Neovim config directory:

```bash
git clone https://github.com/hpbyte/h-vim.git ~/.config/nvim
```

3. Start Neovim. Lazy.nvim will automatically install all plugins on first run.

**Key Bindings**: See [KEYMAPS.md](KEYMAPS.md) for complete keymap reference

## 🌐 LSPs

Use `:Mason` to browse available servers and edit `lua/config/lsp_servers.lua` to add the desired language servers:

```lua
vim.g.hvim_lsp_servers = {
  ts_ls = {},        -- TypeScript/JavaScript
  gopls = {},        -- Go
  lua_ls = {         -- Lua
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  pylsp = {},        -- Python
  rust_analyzer = {},-- Rust
}
```

## 🎨 Code Formatting

Use `:Mason` to browse available formatters and edit `lua/config/lsp_servers.lua` to add the desired formatters:

```lua
vim.g.hvim_formatters = {
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    lua = { "stylua" },
    go = { "gofmt" },
    python = { "black" },
    rust = { "rustfmt" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}
```

**With prettier and eslint:**

```lua
vim.g.hvim_formatters = {
  formatters_by_ft = {
    javascript = { "eslint_d", "prettier" },
    typescript = { "eslint_d", "prettier" },
    json = { "prettier" },
  },
}
```

## 🎨 Themes

Use `<leader>ut` (normal mode) or `:HvThemeSelect` to open an interactive theme picker. The following themes are available out of the box: OneDark, Catppuccin, Gruvbox, Tokyo Night, Rose Pine, GitHub Dark, GitHub Light, and GitHub Dark Dimmed.

To change the default theme on startup, update the `DEFAULT_THEME` value near the top of `lua/config/themes.lua` or set `vim.g.hvim_theme` before `require("config.themes")` is called in `init.lua`.

## 🔌 Plugin List

| Category                | Plugin            | Description                   |
| ----------------------- | ----------------- | ----------------------------- |
| **Core**                | lazy.nvim         | Plugin manager                |
|                         | mason.nvim        | LSP/tool installer            |
|                         | nvim-lspconfig    | LSP configurations            |
| **Navigation & Search** | fzf.vim           | Fuzzy finder with ripgrep     |
|                         | nvim-tree.lua     | File explorer                 |
|                         | nvim-spectre      | Search and replace            |
| **Git**                 | vim-fugitive      | Git commands                  |
|                         | gitsigns.nvim     | Git signs and hunk navigation |
| **Editor**              | nvim-treesitter   | Syntax highlighting           |
|                         | nvim-cmp          | Completion engine             |
|                         | Comment.nvim      | Smart commenting              |
|                         | nvim-autopairs    | Auto-close brackets           |
| **UI**                  | onedark.nvim      | Colorscheme                   |
|                         | lualine.nvim      | Statusline                    |
|                         | bufferline.nvim   | Buffer tabs                   |
|                         | nvim-web-devicons | File icons                    |

## 📁 File Structure

```
├── init.lua
├── KEYMAPS.md              # Complete keymap reference
├── lua/
│   ├── config/
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   ├── lsp_servers.lua
│   │   ├── themes.lua
│   │   └── options.lua
│   └── plugins/
│       ├── completion.lua
│       ├── editor.lua
│       ├── fzf.lua
│       ├── git.lua
│       ├── lsp.lua
│       ├── spectre.lua
│       ├── treesitter.lua
│       ├── formatting.lua
│       ├── dashboard.lua
│       ├── themes.lua
│       └── ui.lua
```
