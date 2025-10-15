local M = {}

-- Set the default theme used on startup.
local DEFAULT_THEME = "github_dark_default"

---@class ThemeEntry
---@field label string
---@field plugin string
---@field apply fun():boolean,string?

local themes = {
  onedark = {
    label = "OneDark",
    plugin = "onedark",
    apply = function()
      local ok, onedark = pcall(require, "onedark")
      if not ok then
        return false, "onedark.nvim is not installed"
      end

      onedark.setup({
        style = "dark",
        transparent = false,
        term_colors = true,
        ending_tildes = false,
        cmp_itemkind_reverse = false,
        code_style = {
          comments = "italic",
          keywords = "none",
          functions = "none",
          strings = "none",
          variables = "none",
        },
      })

      onedark.load()
      return true
    end,
  },
  catppuccin = {
    label = "Catppuccin (Mocha)",
    plugin = "catppuccin",
    apply = function()
      local ok, catppuccin = pcall(require, "catppuccin")
      if not ok then
        return false, "catppuccin.nvim is not installed"
      end

      catppuccin.setup({
        flavour = "mocha",
        background = { light = "latte", dark = "mocha" },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
        },
      })

      vim.cmd.colorscheme("catppuccin")
      return true
    end,
  },
  gruvbox = {
    label = "Gruvbox",
    plugin = "gruvbox",
    apply = function()
      local ok, gruvbox = pcall(require, "gruvbox")
      if not ok then
        return false, "gruvbox.nvim is not installed"
      end

      gruvbox.setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        contrast = "",
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })

      vim.cmd.colorscheme("gruvbox")
      return true
    end,
  },
  tokyonight = {
    label = "Tokyo Night",
    plugin = "tokyonight",
    apply = function()
      local ok, tokyonight = pcall(require, "tokyonight")
      if not ok then
        return false, "tokyonight.nvim is not installed"
      end

      tokyonight.setup({
        style = "night",
        light_style = "day",
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
      })

      vim.cmd.colorscheme("tokyonight")
      return true
    end,
  },
  ["rose-pine"] = {
    label = "Rose Pine",
    plugin = "rose-pine",
    apply = function()
      local ok, rose_pine = pcall(require, "rose-pine")
      if not ok then
        return false, "rose-pine is not installed"
      end

      rose_pine.setup({
        variant = "auto",
        dark_variant = "main",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
        groups = {
          background = "base",
          background_nc = "_experimental_nc",
          panel = "surface",
          panel_nc = "base",
          border = "highlight_med",
          comment = "muted",
          link = "iris",
          punctuation = "subtle",
        },
        highlight_groups = {
          ColorColumn = { bg = "rose" },
        },
      })

      vim.cmd.colorscheme("rose-pine")
      return true
    end,
  },
}

local github_theme_variants = {
  github_dark = "GitHub Dark",
  github_light = "GitHub Light",
  github_dark_dimmed = "GitHub Dark Dimmed",
}

local function apply_github_theme(variant)
  local ok, github_theme = pcall(require, "github-theme")
  if not ok then
    return false, "github-theme is not installed"
  end

  github_theme.setup({
    options = {
      compile_path = vim.fn.stdpath("cache") .. "/github-theme",
      compile_file_suffix = "_compiled",
      hide_end_of_buffer = true,
      hide_nc_statusline = true,
      transparent = false,
      terminal_colors = true,
      dim_inactive = false,
      module_default = true,
      styles = {
        comments = "italic",
        functions = "NONE",
        keywords = "bold",
        variables = "NONE",
        conditionals = "NONE",
        constants = "NONE",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
      },
      inverse = {
        match_paren = false,
        visual = false,
        search = false,
      },
    },
  })

  vim.cmd.colorscheme(variant)
  return true
end

for variant, label in pairs(github_theme_variants) do
  themes[variant] = {
    label = label,
    plugin = "github-theme",
    apply = function()
      return apply_github_theme(variant)
    end,
  }
end

local ordered_keys = {
  "onedark",
  "catppuccin",
  "gruvbox",
  "tokyonight",
  "rose-pine",
  "github_dark",
  "github_light",
  "github_dark_dimmed",
}

vim.g.hvim_theme = vim.g.hvim_theme or DEFAULT_THEME
M.current = vim.g.hvim_theme

local command_registered = false

local function ensure_loaded(plugin_name)
  local ok_lazy, lazy = pcall(require, "lazy")
  if not ok_lazy then
    return true
  end

  local ok = pcall(lazy.load, { plugins = { plugin_name } })
  return ok
end

local function notify(message, level)
  if vim.notify then
    vim.notify(message, level)
  end
end

---Apply a theme by key.
---@param name string
---@param opts? { silent?: boolean, force?: boolean }
---@return boolean success
function M.apply(name, opts)
  opts = opts or {}

  local theme = themes[name]
  if not theme then
    if not opts.silent then
      notify(string.format("Unknown theme: %s", name), vim.log.levels.ERROR)
    end
    return false
  end

  if not opts.force and M.current == name then
    if not opts.silent then
      notify(string.format("Theme '%s' already active", theme.label), vim.log.levels.INFO)
    end
    return true
  end

  if theme.plugin and not ensure_loaded(theme.plugin) then
    if not opts.silent then
      notify(string.format("Failed to load plugin for theme: %s", theme.label), vim.log.levels.ERROR)
    end
    return false
  end

  local ok, err = theme.apply()
  if not ok then
    if not opts.silent then
      notify(string.format("Failed to apply theme '%s': %s", theme.label, err or "unknown error"), vim.log.levels.ERROR)
    end
    return false
  end

  M.current = name
  vim.g.hvim_theme = name

  if not opts.silent then
    notify(string.format("Switched to %s", theme.label), vim.log.levels.INFO)
  end

  return true
end

local function format_item(item)
  return string.format("%s%s", item.label, (item.name == M.current) and " (active)" or "")
end

---Open a selection UI to pick a theme.
function M.select()
  local items = {}
  local lookup = {}

  if ordered_keys then
    for _, key in ipairs(ordered_keys) do
      if themes[key] then
        table.insert(items, { name = key, label = themes[key].label })
        lookup[key] = true
      end
    end
  end

  for key, entry in pairs(themes) do
    if not lookup[key] then
      table.insert(items, { name = key, label = entry.label })
    end
  end

  table.sort(items, function(a, b)
    return a.label < b.label
  end)

  vim.ui.select(items, {
    prompt = "Select h-vim theme",
    format_item = format_item,
  }, function(choice)
    if choice then
      M.apply(choice.name)
    end
  end)
end

local function ensure_command()
  if command_registered then
    return
  end

  vim.api.nvim_create_user_command("HvThemeSelect", function()
    M.select()
  end, { desc = "Select an h-vim colorscheme" })

  command_registered = true
end

---Ensure the configured theme is applied and commands registered.
function M.setup()
  ensure_command()

  if not M.apply(M.current or DEFAULT_THEME, { silent = true }) then
    if M.current ~= DEFAULT_THEME then
      M.apply(DEFAULT_THEME, { silent = true, force = true })
      notify(string.format("Falling back to default theme '%s'", DEFAULT_THEME), vim.log.levels.WARN)
    end
  end
end

---Expose available theme metadata.
---@return table<string, ThemeEntry>
function M.get_themes()
  return themes
end

return M
