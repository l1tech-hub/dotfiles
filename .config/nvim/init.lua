vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.mapleader = "t"

require("config.lazy")

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>')


vim.keymap.set('n', 'h', 'h', { noremap = true, silent = true })
vim.keymap.set('n', 'j', 'j', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'k', { noremap = true, silent = true })
vim.keymap.set('n', 'l', 'l', { noremap = true, silent = true })

vim.keymap.set('v', 'h', 'h', { noremap = true, silent = true })
vim.keymap.set('v', 'j', 'j', { noremap = true, silent = true })
vim.keymap.set('v', 'k', 'k', { noremap = true, silent = true })
vim.keymap.set('v', 'l', 'l', { noremap = true, silent = true })


vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.opt.clipboard = "unnamedplus"

