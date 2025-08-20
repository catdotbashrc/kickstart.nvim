-- Colorscheme and theme configurations
return {
  -- Catppuccin theme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    opts = {
      flavour = 'mocha',
      background = {
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
        telescope = {
          enabled = true,
          style = 'nvchad',
        },
        which_key = true,
        dashboard = true,
        leap = true,
        markdown = true,
        mason = true,
        neotest = true,
        dap = true,
        dap_ui = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
    },
  },

  -- Kanagawa theme
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors)
        return {}
      end,
      theme = 'wave',
      background = {
        dark = 'wave',
        light = 'lotus',
      },
    },
  },

  -- Rose Pine theme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    opts = {
      variant = 'moon',
      dark_variant = 'moon',
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = false,
      disable_float_background = false,
      disable_italics = false,
      groups = {
        background = 'base',
        background_nc = '_experimental_nc',
        panel = 'surface',
        panel_nc = 'base',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',
        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',
        headings = {
          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },
      },
      highlight_groups = {
        ColorColumn = { bg = 'rose' },
        CursorLine = { bg = 'foam', blend = 10 },
        StatusLine = { fg = 'love', bg = 'love', blend = 10 },
      },
    },
  },

  -- Tokyo Night theme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'storm',
      light_style = 'day',
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = 'dark',
        floats = 'dark',
      },
      sidebars = { 'qf', 'help', 'terminal', 'packer' },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
      on_colors = function(colors) end,
      on_highlights = function(highlights, colors) end,
    },
  },

  -- Gruvbox theme
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = true,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,
      contrast = '',
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    },
  },

  -- Nightfox theme
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        compile_path = vim.fn.stdpath('cache') .. '/nightfox',
        compile_file_suffix = '_compiled',
        transparent = false,
        terminal_colors = true,
        dim_inactive = false,
        module_default = true,
        colorblind = {
          enable = false,
          simulate_only = false,
          severity = {
            protan = 0,
            deutan = 0,
            tritan = 0,
          },
        },
        styles = {
          comments = 'italic',
          conditionals = 'NONE',
          constants = 'NONE',
          functions = 'NONE',
          keywords = 'NONE',
          numbers = 'NONE',
          operators = 'NONE',
          strings = 'NONE',
          types = 'NONE',
          variables = 'NONE',
        },
        inverse = {
          match_paren = false,
          visual = false,
          search = false,
        },
        modules = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          whichkey = true,
          dashboard = true,
          diagnostic = true,
          leap = true,
          lsp_trouble = true,
          mason = true,
          mini = true,
          native_lsp = true,
          neotest = true,
          neotree = true,
          notify = true,
        },
      },
      palettes = {},
      specs = {},
      groups = {},
    },
  },

  -- Theme switcher utility
  {
    'zaldih/themery.nvim',
    lazy = false,
    keys = {
      { '<leader>ct', '<cmd>Themery<cr>', desc = 'Theme Switcher' },
    },
    opts = {
      themes = {
        {
          name = 'Catppuccin Mocha',
          colorscheme = 'catppuccin-mocha',
        },
        {
          name = 'Catppuccin Macchiato',
          colorscheme = 'catppuccin-macchiato',
        },
        {
          name = 'Catppuccin Frappe',
          colorscheme = 'catppuccin-frappe',
        },
        {
          name = 'Catppuccin Latte',
          colorscheme = 'catppuccin-latte',
        },
        {
          name = 'Kanagawa Wave',
          colorscheme = 'kanagawa-wave',
        },
        {
          name = 'Kanagawa Dragon',
          colorscheme = 'kanagawa-dragon',
        },
        {
          name = 'Kanagawa Lotus',
          colorscheme = 'kanagawa-lotus',
        },
        {
          name = 'Rose Pine',
          colorscheme = 'rose-pine',
        },
        {
          name = 'Rose Pine Moon',
          colorscheme = 'rose-pine-moon',
        },
        {
          name = 'Rose Pine Dawn',
          colorscheme = 'rose-pine-dawn',
        },
        {
          name = 'Tokyo Night',
          colorscheme = 'tokyonight',
        },
        {
          name = 'Tokyo Night Storm',
          colorscheme = 'tokyonight-storm',
        },
        {
          name = 'Tokyo Night Moon',
          colorscheme = 'tokyonight-moon',
        },
        {
          name = 'Tokyo Night Day',
          colorscheme = 'tokyonight-day',
        },
        {
          name = 'Gruvbox Dark',
          colorscheme = 'gruvbox',
        },
        {
          name = 'Nightfox',
          colorscheme = 'nightfox',
        },
        {
          name = 'Dayfox',
          colorscheme = 'dayfox',
        },
        {
          name = 'Dawnfox',
          colorscheme = 'dawnfox',
        },
        {
          name = 'Duskfox',
          colorscheme = 'duskfox',
        },
        {
          name = 'Nordfox',
          colorscheme = 'nordfox',
        },
        {
          name = 'Terafox',
          colorscheme = 'terafox',
        },
        {
          name = 'Carbonfox',
          colorscheme = 'carbonfox',
        },
      },
      livePreview = true,
    },
  },
}