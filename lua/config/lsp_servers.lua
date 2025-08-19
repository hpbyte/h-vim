-- Example configurations:
-- vim.g.hvim_lsp_servers = {
--   gopls = {},
--   lua_ls = {
--     settings = {
--       Lua = {
--         diagnostics = {
--           globals = { "vim" },
--         },
--       },
--     },
--   },
--   ts_ls = {},
--   pylsp = {},
--   rust_analyzer = {},
--   clangd = {},
--   astro = {},
-- }

vim.g.hvim_lsp_servers = {}

-- Example with prettier and eslint:
-- vim.g.hvim_formatters = {
--   formatters_by_ft = {
--     javascript = { "eslint_d", "prettier" },
--     typescript = { "eslint_d", "prettier" },
--     javascriptreact = { "eslint_d", "prettier" },
--     typescriptreact = { "eslint_d", "prettier" },
--     json = { "prettier" },
--     html = { "prettier" },
--     css = { "prettier" },
--     markdown = { "prettier" },
--   },
--   format_on_save = {
--     timeout_ms = 1000,
--     lsp_fallback = true,
--   },
-- }

vim.g.hvim_formatters = {}