local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup({
--    spec = {
--      { import = "plugins" },
--     
--      checker = { enabled = false },
-- 
--      install = {},
--         "nvim-tree/nvim-web-devicons",
--         "sainnhe/sonokai",
--     },
-- })

require("lazy").setup({
  spec = {
    { import = "plugins" },

    {
      "nvim-tree/nvim-web-devicons"
    },

    {
      "sainnhe/sonokai"
    },

    {
      "mfussenegger/nvim-jdtls",
      ft = { "java" }
    }
  },

  checker = {
    enabled = false
  }
})
  
vim.cmd("colorscheme unokai")
