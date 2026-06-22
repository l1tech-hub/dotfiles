return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
   
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    
    'hrsh7th/cmp-nvim-lua',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    require('luasnip.loaders.from_vscode').lazy_load()
    
    -- Настройка cmp
    cmp.setup({
      -- Включение/отключение
      enabled = function()
        -- Отключаем в комментариях
        local context = require('cmp.config.context')
        if vim.api.nvim_get_mode().mode == 'c' then
          return true
        else
          return not context.in_treesitter_capture('comment') 
            and not context.in_syntax_group('Comment')
        end
      end,
      
      -- Источники автодополнения
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
      }),
      
      -- Сопоставление клавиш
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ 
          select = false, -- не выбирать первый элемент автоматически
          behavior = cmp.ConfirmBehavior.Replace,
        }),
        
        -- Навигация по предложениям
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        
        -- Работа со сниппетами
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      
      -- Внешний вид
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      
      -- Форматирование
      formatting = {
        format = function(entry, vim_item)
          -- Иконки для разных источников
          local icons = {
            Text = '',
            Method = '',
            Function = '',
            Constructor = '',
            Field = 'ﰠ',
            Variable = '',
            Class = 'ﴯ',
            Interface = '',
            Module = '',
            Property = 'ﰠ',
            Unit = '塞',
            Value = '',
            Enum = '',
            Keyword = '',
            Snippet = '',
            Color = '',
            File = '',
            Reference = '',
            Folder = '',
            EnumMember = '',
            Constant = '',
            Struct = 'פּ',
            Event = '',
            Operator = '',
            TypeParameter = '',
            Copilot = '',
          }
          
          -- Добавляем иконку
          vim_item.kind = string.format('%s %s', icons[vim_item.kind] or '?', vim_item.kind)
          
          -- Добавляем источник
          vim_item.menu = ({
            buffer = '[Buffer]',
            nvim_lsp = '[LSP]',
            luasnip = '[Snippet]',
            nvim_lua = '[Lua]',
            path = '[Path]',
            cmdline = '[Cmd]',
          })[entry.source.name]
          
          return vim_item
        end,
      },
      
      -- Сниппеты
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      
      -- Сортировка
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      
      -- Экспериментальные фичи
      experimental = {
        ghost_text = true, -- показывает текст предложения прямо в буфере
        native_menu = false,
      },
    })
    
    -- Автодополнение для командной строки
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
      }),
    })
    
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })
    
    -- Настройка LuaSnip
    require('luasnip').config.setup({
      history = true,
      update_events = 'TextChanged,TextChangedI',
      region_check_events = 'InsertEnter',
      delete_check_events = 'TextChanged',
    })
  end,
}
