return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local user_theme = vim.g.hvim_theme or "onedark"
      local theme_map = {
        onedark = "onedark",
        catppuccin = "catppuccin",
        gruvbox = "gruvbox",
        tokyonight = "tokyonight",
        ["rose-pine"] = "rose-pine",
        ["github-dark"] = "github_dark",
        ["github-dimmed"] = "github_dimmed",
      }

      require("lualine").setup({
        options = {
          theme = theme_map[user_theme] or "onedark",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
}

