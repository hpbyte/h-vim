return {
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    cmd = { "Rg", "Files", "GFiles", "Buffers", "History" },
    config = function()
      if vim.fn.executable("rg") == 1 then
        vim.g.rg_derive_root = "true"
      end
    end,
  },
}