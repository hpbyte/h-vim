local opt = vim.opt

opt.syntax = "on"
opt.re = 0
opt.guicursor = ""
opt.showmatch = false
opt.relativenumber = true
opt.hlsearch = false
opt.hidden = true
opt.errorbells = false
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.number = true
opt.wrap = false
opt.smartcase = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8
opt.modifiable = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.cmdheight = 2
opt.updatetime = 50
opt.shortmess:append("c")
opt.colorcolumn = "150"
opt.background = "dark"

vim.g.loaded_matchparen = 1