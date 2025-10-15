local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "<C-c>", "<Esc>", opts)

keymap.set("n", "<leader>h", "<cmd>wincmd h<CR>", opts)
keymap.set("n", "<leader>j", "<cmd>wincmd j<CR>", opts)
keymap.set("n", "<leader>k", "<cmd>wincmd k<CR>", opts)
keymap.set("n", "<leader>l", "<cmd>wincmd l<CR>", opts)

keymap.set("n", "<leader>pv", "<cmd>wincmd v<bar> Ex <bar> vertical resize 30<CR>", opts)

keymap.set("n", "<leader><CR>", "<cmd>so ~/.config/nvim/init.lua<CR>", opts)

keymap.set("n", "<leader>ut", require("config.themes").select, opts)

keymap.set("n", "<leader>+", "<cmd>vertical resize +5<CR>", opts)
keymap.set("n", "<leader>-", "<cmd>vertical resize -5<CR>", opts)

keymap.set("n", "<leader>ee", "oif err != nil {<CR>log.Fatalf(\"%+v\\n\", err)<CR>}<CR><esc>kkI<esc>", opts)

keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap.set("n", "<leader>th", "<cmd>tabfirst<CR>", opts)
keymap.set("n", "<leader>tj", "<cmd>tabnext<CR>", opts)
keymap.set("n", "<leader>tk", "<cmd>tabprev<CR>", opts)
keymap.set("n", "<leader>tl", "<cmd>tablast<CR>", opts)
keymap.set("n", "<leader>tt", "<cmd>tabedit<Space>", opts)
keymap.set("n", "<leader>tn", "<cmd>tabnext<Space>", opts)
keymap.set("n", "<leader>tm", "<cmd>tabm<Space>", opts)
keymap.set("n", "<leader>td", "<cmd>tabclose<CR>", opts)

keymap.set("n", "<leader>vtm", "<cmd>highlight Pmenu ctermbg=gray guibg=gray<CR>", opts)

keymap.set("v", "X", '"_d', opts)

keymap.set("n", "<leader>/", "gcc", { remap = true })
keymap.set("v", "<leader>/", "gc", { remap = true })


keymap.set("n", "<C-h>", "<cmd>bprevious<cr>", opts)
keymap.set("n", "<C-l>", "<cmd>bnext<cr>", opts)
keymap.set("n", "<leader>bd", "<cmd>bd<cr>", opts)
keymap.set("n", "<leader>bl", "<cmd>buffers<cr>", opts)
keymap.set("n", "<leader>bf", "<cmd>bfirst<cr>", opts)
keymap.set("n", "<leader>ba", "<cmd>blast<cr>", opts)
keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", opts)
keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", opts)
keymap.set("n", "<leader>bD", "<cmd>%bd|e#<cr>", opts)
keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", opts)
keymap.set("n", "<leader>bw", "<cmd>w<cr>", opts)
keymap.set("n", "<leader>bW", "<cmd>wa<cr>", opts)

local function setup_lsp_keymaps(bufnr)
  local lsp_opts = { noremap = true, silent = true, buffer = bufnr }
  
  keymap.set("n", "<leader>gd", vim.lsp.buf.definition, lsp_opts)
  keymap.set("n", "<leader>gy", vim.lsp.buf.type_definition, lsp_opts)
  keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, lsp_opts)
  keymap.set("n", "<leader>gr", vim.lsp.buf.references, lsp_opts)
  keymap.set("n", "<leader>rr", vim.lsp.buf.rename, lsp_opts)
  keymap.set("n", "<leader>g[", vim.diagnostic.goto_prev, lsp_opts)
  keymap.set("n", "<leader>g]", vim.diagnostic.goto_next, lsp_opts)
  keymap.set("n", "<leader>gp", vim.diagnostic.goto_prev, lsp_opts)
  keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, lsp_opts)
  keymap.set("n", "<leader>gl", vim.diagnostic.open_float, lsp_opts)
  keymap.set("n", "T", vim.lsp.buf.hover, lsp_opts)
end

keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

keymap.set("n", "<leader>ps", ":Rg<space>", opts)
keymap.set("n", "<C-p>", "<cmd>GFiles<cr>", opts)
keymap.set("n", "<leader>pf", "<cmd>Files<cr>", opts)

keymap.set("n", "<leader>sr", "<cmd>lua require('spectre').open()<cr>", opts)
keymap.set("n", "<leader>prw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", opts)

keymap.set("n", "<leader>gs", "<cmd>Git<cr>", opts)
keymap.set("n", "<leader>gj", "<cmd>diffget //3<cr>", opts)
keymap.set("n", "<leader>gf", "<cmd>diffget //2<cr>", opts)

keymap.set("n", "<c-space>", "<cmd>lua require('nvim-treesitter.incremental_selection').init_selection()<cr>", opts)
keymap.set("x", "<c-space>", "<cmd>lua require('nvim-treesitter.incremental_selection').node_incremental()<cr>", opts)
keymap.set("x", "<bs>", "<cmd>lua require('nvim-treesitter.incremental_selection').node_decremental()<cr>", opts)

keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format({ lsp_fallback = true })
end, opts)
_G.setup_lsp_keymaps = setup_lsp_keymaps
