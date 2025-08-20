-- Development tools and utilities
return {
  -- Debug Adapter Protocol
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'nvim-neotest/nvim-nio' },
        keys = {
          { '<leader>du', function() require('dapui').toggle({}) end, desc = 'Dap UI' },
          { '<leader>de', function() require('dapui').eval() end, desc = 'Eval', mode = { 'n', 'v' } },
        },
        opts = {
          layouts = {
            {
              elements = {
                { id = 'scopes', size = 0.25 },
                { id = 'breakpoints', size = 0.25 },
                { id = 'stacks', size = 0.25 },
                { id = 'watches', size = 0.25 },
              },
              position = 'right',
              size = 40,
            },
            {
              elements = {
                { id = 'repl', size = 0.5 },
                { id = 'console', size = 0.5 },
              },
              position = 'bottom',
              size = 10,
            },
          },
        },
        config = function(_, opts)
          local dap = require('dap')
          local dapui = require('dapui')
          dapui.setup(opts)
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close({})
          end
        end,
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = {},
      },
    },
    keys = {
      { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Breakpoint Condition' },
      { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
      { '<leader>dc', function() require('dap').continue() end, desc = 'Continue' },
      { '<leader>dC', function() require('dap').run_to_cursor() end, desc = 'Run to Cursor' },
      { '<leader>dg', function() require('dap').goto_() end, desc = 'Go to Line (No Execute)' },
      { '<leader>di', function() require('dap').step_into() end, desc = 'Step Into' },
      { '<leader>dj', function() require('dap').down() end, desc = 'Down' },
      { '<leader>dk', function() require('dap').up() end, desc = 'Up' },
      { '<leader>dl', function() require('dap').run_last() end, desc = 'Run Last' },
      { '<leader>do', function() require('dap').step_out() end, desc = 'Step Out' },
      { '<leader>dO', function() require('dap').step_over() end, desc = 'Step Over' },
      { '<leader>dp', function() require('dap').pause() end, desc = 'Pause' },
      { '<leader>dr', function() require('dap').repl.toggle() end, desc = 'Toggle REPL' },
      { '<leader>ds', function() require('dap').session() end, desc = 'Session' },
      { '<leader>dt', function() require('dap').terminate() end, desc = 'Terminate' },
      { '<leader>dw', function() require('dap.ui.widgets').hover() end, desc = 'Widgets' },
    },
    config = function()
      local icons = {
        Stopped = { '󰁕 ', 'DiagnosticWarn', 'DapStoppedLine' },
        Breakpoint = ' ',
        BreakpointCondition = ' ',
        BreakpointRejected = { ' ', 'DiagnosticError' },
        LogPoint = '.>',
      }
      for name, sign in pairs(icons) do
        sign = type(sign) == 'table' and sign or { sign }
        vim.fn.sign_define(
          'Dap' .. name,
          { text = sign[1], texthl = sign[2] or 'DiagnosticInfo', linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
  },

  -- REST client
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>rr', '<Plug>RestNvim', desc = 'Run REST Request' },
      { '<leader>rp', '<Plug>RestNvimPreview', desc = 'Preview REST Request' },
      { '<leader>rl', '<Plug>RestNvimLast', desc = 'Run Last REST Request' },
    },
    config = function()
      require('rest-nvim').setup({
        result_split_horizontal = false,
        result_split_in_place = false,
        skip_ssl_verification = false,
        encode_url = true,
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          show_url = true,
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          show_statistics = false,
          formatters = {
            json = 'jq',
            html = function(body)
              return vim.fn.system({ 'tidy', '-i', '-q', '-' }, body)
            end,
          },
        },
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
        search_back = true,
      })
    end,
  },

  -- Code actions preview
  {
    'aznhe21/actions-preview.nvim',
    event = 'LspAttach',
    keys = {
      {
        '<leader>ca',
        function()
          require('actions-preview').code_actions()
        end,
        mode = { 'n', 'v' },
        desc = 'Code Actions',
      },
    },
    opts = {
      telescope = {
        sorting_strategy = 'ascending',
        layout_strategy = 'vertical',
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = 'top',
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    },
  },

  -- Better quickfix
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    opts = {
      auto_enable = true,
      magic_window = true,
      auto_resize_height = false,
      preview = {
        auto_preview = true,
        show_title = true,
        delay_syntax = 50,
        wrap = false,
      },
      func_map = {
        drop = 'o',
        openc = 'O',
        split = '<C-s>',
        vsplit = '<C-v>',
        stoggleup = 'M',
        stoggledown = 'm',
        stogglevm = '<Space>',
        ptoggleitem = 'p',
        ptoggleauto = 'P',
        ptogglemode = 'zp',
        pscrollup = '<C-u>',
        pscrolldown = '<C-d>',
        prevfile = '<C-p>',
        nextfile = '<C-n>',
        prevhist = '<',
        nexthist = '>',
      },
      filter = {
        fzf = {
          extra_opts = { '--bind', 'ctrl-o:toggle-all', '--delimiter', '│' },
        },
      },
    },
  },

  -- Session management
  {
    'rmagatti/auto-session',
    lazy = false,
    keys = {
      { '<leader>qs', '<cmd>SessionSave<cr>', desc = 'Save Session' },
      { '<leader>qr', '<cmd>SessionRestore<cr>', desc = 'Restore Session' },
      { '<leader>qd', '<cmd>SessionDelete<cr>', desc = 'Delete Session' },
      { '<leader>qf', '<cmd>Autosession search<cr>', desc = 'Find Session' },
    },
    opts = {
      log_level = 'error',
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
      auto_session_enabled = true,
      auto_save_enabled = false,
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      auto_session_use_git_branch = false,
      bypass_session_save_file_types = { 'alpha', 'dashboard' },
    },
  },

  -- Better folding
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'VeryLazy',
    keys = {
      { 'zR', function() require('ufo').openAllFolds() end, desc = 'Open All Folds' },
      { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close All Folds' },
      { 'zr', function() require('ufo').openFoldsExceptKinds() end, desc = 'Open Folds' },
      { 'zm', function() require('ufo').closeFoldsWith() end, desc = 'Close Folds' },
      {
        'K',
        function()
          local winid = require('ufo').peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end,
        desc = 'Peek Fold or Hover',
      },
    },
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { 'lsp', 'indent' }
      end,
      open_fold_hl_timeout = 150,
      close_fold_kinds_for_ft = {
        default = { 'imports', 'comment' },
      },
      preview = {
        win_config = {
          border = { '', '─', '', '', '', '─', '', '' },
          winhighlight = 'Normal:Folded',
          winblend = 0,
        },
        mappings = {
          scrollU = '<C-u>',
          scrollD = '<C-d>',
          jumpTop = '[',
          jumpBot = ']',
        },
      },
    },
    config = function(_, opts)
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      require('ufo').setup(opts)
    end,
  },

  -- Undotree
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Undotree' },
    },
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_ShortIndicators = 1
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  -- Claude Code integration
  {
    'coder/claudecode.nvim',
    dependencies = { 
      'folke/snacks.nvim',  -- For enhanced terminal support
    },
    config = true,  -- Uses default configuration
    keys = {
      { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude Code' },
      { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
      { '<leader>ad', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept Claude diff' },
      { '<leader>aD', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny Claude diff' },
    },
  },

  -- MCP Hub - Model Context Protocol client
  {
    'ravitemer/mcphub.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    lazy = false,
    keys = {
      { '<leader>am', '<cmd>MCPHub<cr>', desc = 'MCPHub Dashboard' },
      { '<leader>at', '<cmd>MCPTools<cr>', desc = 'MCP Tools' },
      { '<leader>ar', '<cmd>MCPResources<cr>', desc = 'MCP Resources' },
      { '<leader>ap', '<cmd>MCPPrompts<cr>', desc = 'MCP Prompts' },
    },
    config = function()
      require('mcphub').setup({
        -- Default configuration
        servers = {
          -- Add your MCP servers here when needed
          -- Example:
          -- {
          --   name = 'my-server',
          --   transport = 'stdio',
          --   command = 'my-mcp-server',
          --   args = {},
          -- },
        },
        
        -- Chat plugin integration (optional)
        chat_plugin = nil,  -- Will be auto-detected: 'avante', 'codecompanion', 'copilotchat'
        
        -- UI configuration
        ui = {
          width = 0.7,
          height = 0.8,
          border = 'rounded',
        },
        
        -- Authentication (if needed for certain servers)
        auth = {
          -- oauth = {},
          -- headers = {},
        },
        
        -- Debug logging
        debug = false,
      })
    end,
  },

  -- Database client
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = 'left'
      vim.g.db_ui_winwidth = 40
    end,
  },
}