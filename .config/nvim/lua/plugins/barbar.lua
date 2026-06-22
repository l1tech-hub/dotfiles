local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

map('n', '<A-C-,>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-C-.>', '<Cmd>BufferMoveNext<CR>', opts)

map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

map('n', '<C-p>',   '<Cmd>BufferPick<CR>', opts)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

return {
      'romgrk/barbar.nvim',
      dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,

    config = function ()
        require("barbar").setup({
            animation = true,
            auto_hide = true,
            highlight_visible = false,

            icons = {
                buffer_number = true,

                gitsigns = {
                    added = {enabled = true, icon = '+'},
                    changed = {enabled = true, icon = '~'},
                    deleted = {enabled = true, icon = '-'},
                },

                filetype = {
                    enabled = true,
                },
                separator_at_end = false,
            },

            sidebar_filetypes = {
                NvimTree = true,

                ["neo-tree"] = { event = "BufWipeout"},
            },
            maximum_padding = 2,
            minimum_padding = 2,

            maximum_length = 30,
            minimum_length = 4,

            semantic_letters = true,
        })
    end,
    opts = {},
    version = '^1.0.0',
}
