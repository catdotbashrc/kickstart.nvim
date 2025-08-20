-- Language-specific plugin configurations
return {
  -- Python development
  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function()
      local path = require('mason-registry').get_package('debugpy'):get_install_path()
      require('dap-python').setup(path .. '/venv/bin/python')
    end,
  },

  -- Python testing
  {
    'nvim-neotest/neotest',
    ft = { 'python' },
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
    },
    keys = {
      { '<leader>tt', function() require('neotest').run.run() end, desc = 'Test Nearest' },
      { '<leader>tT', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = 'Test File' },
      { '<leader>td', function() require('neotest').run.run({ strategy = 'dap' }) end, desc = 'Test Debug' },
      { '<leader>ts', function() require('neotest').run.stop() end, desc = 'Test Stop' },
      { '<leader>ta', function() require('neotest').run.attach() end, desc = 'Test Attach' },
      { '<leader>to', function() require('neotest').output.open({ enter = true, auto_close = true }) end, desc = 'Test Output' },
      { '<leader>tO', function() require('neotest').output_panel.toggle() end, desc = 'Test Output Panel' },
      { '<leader>tS', function() require('neotest').summary.toggle() end, desc = 'Test Summary' },
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-python')({
            dap = { justMyCode = false },
            runner = 'pytest',
            python = '.venv/bin/python',
          }),
        },
        quickfix = {
          open = false,
        },
        output = {
          open_on_run = true,
        },
      })
    end,
  },

  -- Markdown preview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown Preview' },
    },
    config = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_theme = 'dark'
    end,
  },

  -- Markdown rendering
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    opts = {
      file_types = { 'markdown', 'Avante' },
      code = {
        sign = false,
        width = 'block',
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Zettelkasten note-taking with zk
  {
    'zk-org/zk-nvim',
    cmd = { 'ZkNotes', 'ZkNew', 'ZkTags', 'ZkMatch' },
    keys = {
      -- Create
      { '<leader>zn', "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>", desc = 'New Note' },
      { '<leader>zN', "<cmd>ZkNew { dir = 'daily', title = os.date('%Y-%m-%d') }<cr>", desc = 'New Daily Note' },
      { '<leader>zt', '<cmd>ZkTags<cr>', desc = 'Tags' },
      -- Find
      { '<leader>zf', '<cmd>ZkNotes { sort = { "modified" } }<cr>', desc = 'Find Notes' },
      { '<leader>zF', '<cmd>ZkNotes { sort = { "modified" }, match = { vim.fn.input("Search: ") } }<cr>', desc = 'Find Notes (Search)' },
      { '<leader>zd', '<cmd>ZkNotes { sort = { "modified" }, dir = "daily" }<cr>', desc = 'Daily Notes' },
      -- Visual mode
      { '<leader>zn', ":'<,'>ZkNewFromTitleSelection<cr>", mode = 'v', desc = 'New Note from Selection' },
      { '<leader>zN', ":'<,'>ZkNewFromContentSelection<cr>", mode = 'v', desc = 'New Note with Selection' },
      { '<leader>zm', ":'<,'>ZkMatch<cr>", mode = 'v', desc = 'Match Selection' },
    },
    config = function()
      require('zk').setup({
        picker = 'telescope',
        lsp = {
          config = {
            cmd = { 'zk', 'lsp' },
            name = 'zk',
            on_attach = function(client, bufnr)
              -- Add zk-specific keymaps
              local opts = { buffer = bufnr, silent = true }
              vim.keymap.set('n', '<CR>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
              vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            end,
          },
          auto_attach = {
            enabled = true,
            filetypes = { 'markdown' },
          },
        },
      })
    end,
  },

  -- JSON schemas
  {
    'b0o/schemastore.nvim',
    lazy = true,
    version = false,
  },
}