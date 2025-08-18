return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local dashboard = require("dashboard")

      local function get_header()
        local lines = vim.api.nvim_get_option("lines")
        local padding = math.floor(lines * 0.2)

        local header = {}

        for _ = 1, padding do
          table.insert(header, "")
        end

        table.insert(header, " ██╗  ██╗      ██╗   ██╗██╗███╗   ███╗")
        table.insert(header, " ██║  ██║      ██║   ██║██║████╗ ████║")
        table.insert(header, " ███████║█████╗██║   ██║██║██╔████╔██║")
        table.insert(header, " ██╔══██║╚════╝╚██╗ ██╔╝██║██║╚██╔╝██║")
        table.insert(header, " ██║  ██║       ╚████╔╝ ██║██║ ╚═╝ ██║")
        table.insert(header, " ╚═╝  ╚═╝        ╚═══╝  ╚═╝╚═╝     ╚═╝")
        table.insert(header, "")
        table.insert(header, "")
        table.insert(header, "")

        return header
      end

      dashboard.setup({
        theme = "doom",
        config = {
          header = get_header(),
          center = {
            {
              icon = "󰈞  ",
              desc = "Find Files           ",
              key = "f",
              action = "Files",
            },
            {
              icon = "󰊢  ",
              desc = "Find Git Files       ",
              key = "g",
              action = "GFiles",
            },
            {
              icon = "󰈬  ",
              desc = "Search Text          ",
              key = "r",
              action = "Rg",
            },
            {
              icon = "󰄉  ",
              desc = "Recent Files         ",
              key = "o",
              action = "History",
            },
            {
              icon = "󰒓  ",
              desc = "Configuration        ",
              key = "c",
              action = "edit ~/.config/nvim/init.lua",
            },
            {
              icon = "󰒋  ",
              desc = "Language Servers     ",
              key = "l",
              action = "edit ~/.config/nvim/lua/config/lsp_servers.lua",
            },
            {
              icon = "󰒲  ",
              desc = "Lazy Plugin Manager  ",
              key = "p",
              action = "Lazy",
            },
            {
              icon = "󰏗  ",
              desc = "Mason Tool Installer ",
              key = "m",
              action = "Mason",
            },
            {
              icon = "󰗼  ",
              desc = "Quit                 ",
              key = "q",
              action = "quit",
            },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "",
              "⚡ Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
            }
          end,
        },
      })

      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#98c379" })   -- OneDark green
      vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#abb2bf" })   -- OneDark foreground
      vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = "#e06c75" }) -- OneDark red
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#5c6370" })   -- OneDark comment

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dashboard",
        callback = function()
          vim.opt_local.showtabline = 0
          vim.opt_local.laststatus = 0
        end,
      })

      vim.api.nvim_create_autocmd("BufLeave", {
        pattern = "dashboard",
        callback = function()
          vim.opt.showtabline = 2
          vim.opt.laststatus = 3
        end,
      })
    end,
  },
}
