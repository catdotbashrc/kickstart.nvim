-- Core plugins that provide fundamental functionality
return {
  -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth',
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- Useful plugin to show pending keybinds
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require('which-key')
      wk.setup({
        delay = 0,
        icons = {
          mappings = vim.g.have_nerd_font,
          keys = vim.g.have_nerd_font and {} or {
            Up = '<Up> ',
            Down = '<Down> ',
            Left = '<Left> ',
            Right = '<Right> ',
            C = '<C-…> ',
            M = '<M-…> ',
            S = '<S-…> ',
            CR = '<CR> ',
            Esc = '<Esc> ',
            Space = '<Space> ',
            Tab = '<Tab> ',
          },
        },
      })

      -- Register key groups
      wk.add({
        { '<leader>?', desc = 'Keybindings Reference' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>g', group = '[G]it' },
        { '<leader>x', group = 'Diagnosti[X]' },
        { '<leader>z', group = '[Z]ettelkasten' },
        { '<leader>b', group = '[B]uffer' },
        { '<leader>m', group = '[M]arkdown' },
        { '<leader>l', group = '[L]SP' },
        { '<leader>d', group = '[D]ebug' },
        { '<leader>w', group = '[W]orkspace' },
      })
    end,
  },

  -- Plenary: Lua functions library used by many plugins
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },

  -- Web devicons for file type icons
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    enabled = vim.g.have_nerd_font,
  },

  -- Fix CursorHold performance
  {
    'antoinemadec/FixCursorHold.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  },
}