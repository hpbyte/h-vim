vim.g.mapleader = " "
vim.g.maplocalleader = " "

local theme_manager = require("config.themes")

require("config.lsp_servers")
require("config.lazy")

theme_manager.setup()

require("config.options")
require("config.keymaps")
require("config.autocmds")
