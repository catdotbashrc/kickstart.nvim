-- Telescope fuzzy finder configuration
return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      -- Find
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Find by Grep' },
      { '<leader>fw', '<cmd>Telescope grep_string<cr>', desc = 'Find Word' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Find Help' },
      { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Find Recent' },
      { '<leader>fc', '<cmd>Telescope commands<cr>', desc = 'Find Commands' },
      { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find Keymaps' },
      { '<leader>fm', '<cmd>Telescope marks<cr>', desc = 'Find Marks' },
      { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Find Diagnostics' },
      { '<leader>fs', '<cmd>Telescope resume<cr>', desc = 'Resume Search' },
      
      -- Git
      { '<leader>gC', '<cmd>Telescope git_commits<cr>', desc = 'Git Commits' },
      { '<leader>gb', '<cmd>Telescope git_branches<cr>', desc = 'Git Branches' },
      { '<leader>gS', '<cmd>Telescope git_status<cr>', desc = 'Git Status' },
      { '<leader>gT', '<cmd>Telescope git_stash<cr>', desc = 'Git Stash' },
      
      -- Search
      { '<leader>s/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search Buffer' },
      { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = 'Search Files' },
      { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = 'Search Grep' },
      { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = 'Search Help' },
      { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Search Keymaps' },
      { '<leader>sm', '<cmd>Telescope man_pages<cr>', desc = 'Search Man Pages' },
      { '<leader>sn', function() require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') }) end, desc = 'Search Neovim Files' },
      { '<leader>sr', '<cmd>Telescope resume<cr>', desc = 'Search Resume' },
      { '<leader>ss', '<cmd>Telescope builtin<cr>', desc = 'Search Select' },
      { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = 'Search Word' },
      { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = 'Search Diagnostics' },
      { '<leader>s.', '<cmd>Telescope oldfiles<cr>', desc = 'Search Recent Files' },
      { '<leader><leader>', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers' },
      { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search in Buffer' },
      
      -- LSP
      { 'gd', '<cmd>Telescope lsp_definitions<cr>', desc = 'Goto Definition' },
      { 'gr', '<cmd>Telescope lsp_references<cr>', desc = 'Goto References' },
      { 'gi', '<cmd>Telescope lsp_implementations<cr>', desc = 'Goto Implementation' },
      { 'gt', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'Goto Type Definition' },
      { '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Document Symbols' },
      { '<leader>lS', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Workspace Symbols' },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      
      telescope.setup({
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          path_display = { 'truncate' },
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ['<C-n>'] = actions.cycle_history_next,
              ['<C-p>'] = actions.cycle_history_prev,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
              ['<C-c>'] = actions.close,
              ['<Down>'] = actions.move_selection_next,
              ['<Up>'] = actions.move_selection_previous,
              ['<CR>'] = actions.select_default,
              ['<C-x>'] = actions.select_horizontal,
              ['<C-v>'] = actions.select_vertical,
              ['<C-t>'] = actions.select_tab,
              ['<C-u>'] = actions.preview_scrolling_up,
              ['<C-d>'] = actions.preview_scrolling_down,
              ['<PageUp>'] = actions.results_scrolling_up,
              ['<PageDown>'] = actions.results_scrolling_down,
              ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
              ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
              ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
              ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
              ['<C-l>'] = actions.complete_tag,
            },
            n = {
              ['<esc>'] = actions.close,
              ['<CR>'] = actions.select_default,
              ['<C-x>'] = actions.select_horizontal,
              ['<C-v>'] = actions.select_vertical,
              ['<C-t>'] = actions.select_tab,
              ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
              ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
              ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
              ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
              ['j'] = actions.move_selection_next,
              ['k'] = actions.move_selection_previous,
              ['H'] = actions.move_to_top,
              ['M'] = actions.move_to_middle,
              ['L'] = actions.move_to_bottom,
              ['<Down>'] = actions.move_selection_next,
              ['<Up>'] = actions.move_selection_previous,
              ['gg'] = actions.move_to_top,
              ['G'] = actions.move_to_bottom,
              ['<C-u>'] = actions.preview_scrolling_up,
              ['<C-d>'] = actions.preview_scrolling_down,
              ['<PageUp>'] = actions.results_scrolling_up,
              ['<PageDown>'] = actions.results_scrolling_down,
              ['?'] = actions.which_key,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      })
      
      -- Load extensions
      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'ui-select')
    end,
  },
}