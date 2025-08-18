return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      local user_formatters = vim.g.hvim_formatters or {}
      
      local default_config = {
        formatters_by_ft = {},
        format_on_save = {
          timeout_ms = 1000,
          lsp_fallback = true,
        },
      }
      
      local config = vim.tbl_deep_extend("force", default_config, user_formatters)
      require("conform").setup(config)
    end,
  },
}