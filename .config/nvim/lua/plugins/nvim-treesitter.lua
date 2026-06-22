return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = { "c", "cpp", "lua", "vim" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
 }
