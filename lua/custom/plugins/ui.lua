-- UI enhancement plugins
return {
  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'auto',
          globalstatus = true,
          component_separators = '|',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'location' },
        },
        extensions = { 'nvim-tree', 'lazy', 'trouble', 'fugitive' },
      })
    end,
  },

  -- Dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('dashboard').setup({
        theme = 'hyper',
        config = {
          week_header = { enable = true },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            { desc = ' Files', group = 'Label', action = 'Telescope find_files', key = 'f' },
            { desc = ' Recent', group = 'DiagnosticHint', action = 'Telescope oldfiles', key = 'r' },
            { desc = ' Config', group = 'Number', action = 'edit ~/.config/nvim/init.lua', key = 'c' },
            { desc = ' Notes', group = 'String', action = 'ZkNotes', key = 'n' },
          },
        },
      })
    end,
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus', 'NvimTreeFindFile' },
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'File Explorer' },
      { '<leader>E', '<cmd>NvimTreeFindFile<cr>', desc = 'Find Current File' },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        view = { width = 30 },
        renderer = {
          group_empty = true,
          icons = {
            git_placement = 'after',
          },
        },
        filters = { dotfiles = false },
        git = { enable = true, ignore = false },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })
    end,
  },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      indent = { char = '┊' },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = { 'dashboard', 'lazy', 'mason', 'help', 'NvimTree' },
      },
    },
  },

  -- Better diagnostics list
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble', 'TroubleToggle' },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics' },
      { '<leader>xl', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List' },
      { '<leader>xq', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List' },
      { '<leader>xL', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP Definitions' },
    },
    opts = {},
  },

  -- Highlight todo comments
  {
    'folke/todo-comments.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- LSP progress indicator
  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    opts = {},
  },

  -- Snacks - collection of small useful plugins
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      -- Enable features you want
      bigfile = { enabled = true },  -- Automatically disable features for large files
      notifier = { enabled = true },  -- Better notifications
      quickfile = { enabled = true }, -- Quick file operations
      words = { enabled = true },     -- Highlight word under cursor
      terminal = { enabled = true },  -- Better terminal integration (used by claudecode.nvim)
    },
    keys = {
      { '<leader>sn', function() require('snacks').notifier.show_history() end, desc = 'Notification History' },
      { '<leader>st', function() require('snacks').terminal.toggle() end, desc = 'Toggle Terminal' },
    },
  },
}