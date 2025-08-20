# Neovim Configuration API Documentation

> Complete API reference for all Lua modules in this Neovim configuration

## Table of Contents

- [Module Architecture](#module-architecture)
- [Custom Plugins API](#custom-plugins-api)
  - [init.lua](#customluginsinitlua)
  - [core.lua](#custompluginscorelua)
  - [ui.lua](#custompluginsuilua)
  - [editor.lua](#custompluginseditorlua)
  - [git.lua](#custompluginsgitlua)
  - [lsp.lua](#custompluginslsplua)
  - [completion.lua](#custompluginscompletionlua)
  - [treesitter.lua](#custompluginstreesitterlua)
  - [telescope.lua](#custompluginstelescopelua)
  - [languages.lua](#custompluginslanguageslua)
  - [tools.lua](#custompluinstoolslua)
  - [themes.lua](#custompluginsthemeslua)
- [Kickstart Modules API](#kickstart-modules-api)
- [Plugin Specification Format](#plugin-specification-format)
- [Common Patterns](#common-patterns)

---

## Module Architecture

```
┌─────────────────────────────────────────┐
│            init.lua (main)              │
│                   │                      │
│          require('lazy').setup()         │
│                   │                      │
│         { import = 'custom.plugins' }    │
│                   ▼                      │
│    lua/custom/plugins/init.lua          │
│           (Orchestrator)                 │
│                   │                      │
│         ┌─────────┴──────────┐          │
│         ▼                    ▼          │
│   Plugin Modules      safe_require()    │
│   (12 categories)       (Error handler) │
└─────────────────────────────────────────┘
```

---

## Custom Plugins API

### `custom/plugins/init.lua`

**Purpose**: Central orchestrator for loading all plugin modules

#### Exports
```lua
return M.specs -- table: Aggregated plugin specifications
```

#### Internal Functions

##### `safe_require(module)`
Safely loads a Lua module with error handling.

**Parameters:**
- `module` (string): Module path to require

**Returns:**
- `table`: Module contents or empty table on error

**Example:**
```lua
local module_plugins = safe_require('custom.plugins.core')
```

#### Module Loading Order
1. `core` - Essential plugins
2. `ui` - UI enhancements  
3. `editor` - Editor improvements
4. `git` - Git integration
5. `lsp` - Language servers
6. `completion` - Auto-completion
7. `treesitter` - Syntax highlighting
8. `telescope` - Fuzzy finding
9. `languages` - Language support
10. `tools` - Development tools
11. `themes` - Colorschemes

---

### `custom/plugins/core.lua`

**Purpose**: Essential functionality plugins

#### Plugin Specifications

##### auto-session
- **Purpose**: Session management
- **Events**: `VimEnter`
- **Key Options**:
  - `suppressed_dirs`: Directories to ignore
  - `auto_restore`: Automatic session restoration

##### dashboard-nvim
- **Purpose**: Startup screen
- **Dependencies**: `nvim-web-devicons`
- **Configuration**: Custom header and shortcuts

##### better-escape.nvim
- **Purpose**: Better escape key handling
- **Events**: `InsertEnter`

---

### `custom/plugins/ui.lua`

**Purpose**: User interface enhancements

#### Plugin Specifications

##### lualine.nvim
- **Purpose**: Statusline
- **Dependencies**: `nvim-web-devicons`
- **Configuration**: Theme and component settings

##### indent-blankline.nvim
- **Purpose**: Indentation guides
- **Events**: `BufReadPost`, `BufNewFile`

##### fidget.nvim
- **Purpose**: LSP progress notifications
- **Configuration**: Notification style and positioning

##### which-key.nvim
- **Purpose**: Keybinding hints
- **Events**: `VeryLazy`
- **Configuration**: Timeout and display settings

---

### `custom/plugins/editor.lua`

**Purpose**: Editor behavior enhancements

#### Plugin Specifications

##### Comment.nvim
- **Purpose**: Comment toggling
- **Keys**: `gcc`, `gbc`, `gc` (visual)
- **Configuration**: Language-specific comment strings

##### nvim-surround
- **Purpose**: Surround text with pairs
- **Events**: `BufReadPost`, `BufNewFile`
- **Keys**: `cs`, `ds`, `ys`

##### nvim-autopairs
- **Purpose**: Auto-close brackets
- **Events**: `InsertEnter`
- **Integration**: Works with completion engine

##### leap.nvim
- **Purpose**: Fast cursor motion
- **Keys**: `s`, `S`

##### mini.nvim modules
- **mini.ai**: Extended text objects
- **mini.move**: Move lines/blocks
- **mini.splitjoin**: Split/join code blocks

---

### `custom/plugins/git.lua`

**Purpose**: Git integration and tools

#### Plugin Specifications

##### vim-fugitive
- **Purpose**: Git commands in Vim
- **Commands**: `:Git`, `:Gdiff`, `:Gblame`
- **Keys**: `<leader>gs`, `<leader>gc`, `<leader>gp`

##### gitsigns.nvim
- **Purpose**: Git decorations in gutter
- **Events**: `BufReadPre`, `BufNewFile`
- **Features**: Hunks, blame, diff

##### lazygit.nvim
- **Purpose**: LazyGit terminal UI
- **Dependencies**: `plenary.nvim`
- **Keys**: `<leader>gg`, `<leader>gf`

##### diffview.nvim
- **Purpose**: Git diff viewer
- **Commands**: `:DiffviewOpen`
- **Keys**: `<leader>gd`

---

### `custom/plugins/lsp.lua`

**Purpose**: Language Server Protocol configuration

#### Plugin Specifications

##### nvim-lspconfig
- **Purpose**: LSP client configuration
- **Events**: `BufReadPre`, `BufNewFile`
- **Dependencies**: Mason suite

##### mason.nvim
- **Purpose**: LSP installer
- **Commands**: `:Mason`
- **Configuration**: UI icons and behavior

##### mason-lspconfig.nvim
- **Purpose**: Bridge between Mason and lspconfig
- **Configuration**: Auto-installation settings

##### Server Configurations
```lua
servers = {
  lua_ls = { settings = { Lua = {...} } },
  basedpyright = { settings = { basedpyright = {...} } },
  tsserver = { settings = { typescript = {...} } },
  rust_analyzer = { settings = { ["rust-analyzer"] = {...} } },
  -- ... more servers
}
```

#### LSP Keymaps (on_attach)
| Key | Function | Description |
|-----|----------|-------------|
| `grn` | `vim.lsp.buf.rename` | Rename symbol |
| `gra` | `vim.lsp.buf.code_action` | Code actions |
| `grr` | `telescope.lsp_references` | Find references |
| `grd` | `telescope.lsp_definitions` | Go to definition |
| `gri` | `telescope.lsp_implementations` | Go to implementation |
| `K` | `vim.lsp.buf.hover` | Show hover docs |

---

### `custom/plugins/completion.lua`

**Purpose**: Auto-completion engine configuration

#### Plugin Specifications

##### blink.cmp
- **Purpose**: Completion engine
- **Version**: `1.*`
- **Events**: `InsertEnter`
- **Dependencies**: `LuaSnip`, `friendly-snippets`

#### Configuration Structure
```lua
opts = {
  keymap = {
    preset = 'default',
    ['<C-space>'] = { 'show', 'show_documentation' },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<Tab>'] = { 'snippet_forward', 'fallback' },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    providers = { ... }
  },
  completion = {
    documentation = { auto_show = true },
    menu = { ... }
  }
}
```

---

### `custom/plugins/treesitter.lua`

**Purpose**: Syntax highlighting and code understanding

#### Plugin Specifications

##### nvim-treesitter
- **Purpose**: Incremental parsing
- **Build**: `:TSUpdate`
- **Configuration**: Language parsers and modules

##### nvim-treesitter-textobjects
- **Purpose**: Syntax-aware text objects
- **Keymaps**: Custom text object mappings

##### nvim-treesitter-context
- **Purpose**: Show code context
- **Configuration**: Context lines and behavior

##### nvim-ufo
- **Purpose**: Better folding
- **Dependencies**: `promise-async`
- **Provider**: Treesitter-based folding

---

### `custom/plugins/telescope.lua`

**Purpose**: Fuzzy finding and searching

#### Plugin Specifications

##### telescope.nvim
- **Purpose**: Extensible fuzzy finder
- **Dependencies**: `plenary.nvim`, `telescope-fzf-native`
- **Events**: `VeryLazy`

#### Key Mappings
| Key | Picker | Description |
|-----|--------|-------------|
| `<leader>sf` | `find_files` | Find files |
| `<leader>sg` | `live_grep` | Search by grep |
| `<leader>sb` | `buffers` | List buffers |
| `<leader>sh` | `help_tags` | Search help |
| `<leader>sw` | `grep_string` | Search word |
| `<leader>sd` | `diagnostics` | List diagnostics |

#### Extensions
- **fzf-native**: C-based sorter for performance
- **ui-select**: Use telescope for vim.ui.select
- **file_browser**: File system navigation

---

### `custom/plugins/languages.lua`

**Purpose**: Language-specific enhancements

#### Python Support
- **neotest-python**: Test runner
- **nvim-dap-python**: Debugger
- **venv-selector**: Virtual environment management

#### Markdown Support
- **markdown-preview.nvim**: Live preview
- **render-markdown.nvim**: In-editor rendering
- **Headlines**: Markdown highlighting

#### Other Languages
- **SchemaStore**: JSON/YAML schemas
- **rest.nvim**: HTTP client
- **vim-dadbod**: Database tools

---

### `custom/plugins/tools.lua`

**Purpose**: Development tools and utilities

#### Major Tools

##### nvim-tree.lua
- **Purpose**: File explorer
- **Keys**: `<leader>e`
- **Configuration**: Icons, git integration

##### trouble.nvim
- **Purpose**: Diagnostics list
- **Keys**: `<leader>xx`, `<leader>xd`
- **Commands**: `:Trouble`

##### neotest
- **Purpose**: Test runner framework
- **Keys**: `<leader>tt`, `<leader>tf`
- **Adapters**: Python, JavaScript, etc.

##### nvim-dap
- **Purpose**: Debug Adapter Protocol
- **Dependencies**: `nvim-dap-ui`, `nvim-dap-virtual-text`
- **Configuration**: Language-specific adapters

##### zk-nvim
- **Purpose**: Zettelkasten note-taking
- **Keys**: `<leader>zn`, `<leader>zf`
- **Commands**: `:ZkNew`, `:ZkNotes`

##### claudecode.nvim
- **Purpose**: AI code assistant
- **Keys**: `<leader>cc`, `<leader>ce`
- **Features**: Code explanation, generation, review

---

### `custom/plugins/themes.lua`

**Purpose**: Colorscheme management

#### Available Themes
- **tokyonight.nvim**: 4 variants
- **catppuccin**: 4 flavors
- **rose-pine**: 3 variants
- **gruvbox.nvim**: Light/dark
- **kanagawa.nvim**: 3 styles
- **nightfox.nvim**: Multiple styles

#### Theme Manager
##### themery.nvim
- **Purpose**: Theme switcher
- **Keys**: `<leader>ct`
- **Configuration**: Theme list and persistence

---

## Kickstart Modules API

### Optional Modules (Disabled by Default)

#### `kickstart/plugins/autopairs.lua`
- **Purpose**: Auto-close brackets and quotes
- **Activation**: Uncomment in init.lua

#### `kickstart/plugins/debug.lua`
- **Purpose**: DAP debugging setup
- **Dependencies**: Language-specific DAP adapters
- **Activation**: Uncomment in init.lua

#### `kickstart/plugins/gitsigns.lua`
- **Purpose**: Git integration in gutter
- **Features**: Hunks, blame, navigation
- **Activation**: Uncomment in init.lua

#### `kickstart/plugins/indent_line.lua`
- **Purpose**: Indentation guides
- **Configuration**: Character and highlight settings
- **Activation**: Uncomment in init.lua

#### `kickstart/plugins/lint.lua`
- **Purpose**: Asynchronous linting
- **Configuration**: Linter assignments per filetype
- **Activation**: Uncomment in init.lua

#### `kickstart/plugins/neo-tree.lua`
- **Purpose**: File explorer sidebar
- **Keys**: `\\` to toggle
- **Activation**: Uncomment in init.lua

#### `kickstart/health.lua`
- **Purpose**: Health check utilities
- **Commands**: `:checkhealth kickstart`
- **Function**: Validates configuration

---

## Plugin Specification Format

### Basic Structure
```lua
{
  'author/plugin-name',           -- Required: Plugin identifier
  version = '1.*',                 -- Optional: Version constraint
  event = 'VimEnter',             -- Optional: Lazy loading event
  cmd = { 'Command' },            -- Optional: Lazy load on command
  keys = { '<leader>x' },         -- Optional: Lazy load on keymap
  dependencies = { 'dep/plugin' }, -- Optional: Required dependencies
  build = ':TSUpdate',            -- Optional: Build/update command
  config = function() end,        -- Optional: Configuration function
  opts = {},                      -- Optional: Options for setup()
  enabled = true,                 -- Optional: Enable/disable plugin
  priority = 1000,                -- Optional: Loading priority
}
```

### Loading Events
- `VimEnter`: After Vim startup
- `BufReadPre`: Before reading buffer
- `BufReadPost`: After reading buffer
- `BufNewFile`: New file created
- `InsertEnter`: Entering insert mode
- `VeryLazy`: After startup, deferred

### Configuration Methods
1. **opts**: Pass to plugin.setup(opts)
2. **config**: Full control function
3. **init**: Run before plugin loads

---

## Common Patterns

### Module Structure
```lua
-- Module header comment
return {
  -- Plugin specifications
  {
    'plugin/name',
    -- configuration
  },
  -- More plugins...
}
```

### Conditional Loading
```lua
{
  'plugin/name',
  enabled = vim.fn.has('unix') == 1,
  cond = function()
    return vim.fn.executable('tool') == 1
  end,
}
```

### Keymap Registration
```lua
keys = {
  {
    '<leader>xx',
    function() require('plugin').toggle() end,
    desc = 'Toggle plugin',
    mode = { 'n', 'v' }, -- Optional: modes
  },
}
```

### LSP Server Setup Pattern
```lua
local servers = {
  server_name = {
    settings = {
      -- Server-specific settings
    },
    capabilities = capabilities,
    on_attach = on_attach,
  },
}
```

### Telescope Extension Pattern
```lua
pcall(require('telescope').load_extension, 'extension_name')
```

---

## API Usage Examples

### Adding a New Plugin Module
1. Create `lua/custom/plugins/newcategory.lua`
2. Return plugin specification table
3. Add to `plugin_modules` in `init.lua`

### Configuring an LSP Server
```lua
-- In lua/custom/plugins/lsp.lua, add to servers table:
servers.new_ls = {
  settings = {
    new_ls = {
      -- Settings here
    }
  }
}
```

### Creating Custom Keymaps
```lua
-- In plugin specification:
keys = {
  { '<leader>nn', '<cmd>NewCommand<cr>', desc = 'New feature' },
}
```

### Adding a Telescope Picker
```lua
-- In lua/custom/plugins/telescope.lua:
vim.keymap.set('n', '<leader>sx', function()
  require('telescope.builtin').picker_name()
end, { desc = 'Search X' })
```

---

## Performance Considerations

### Lazy Loading Best Practices
1. Use specific events (`BufReadPre` vs `VimEnter`)
2. Lazy load on commands and keymaps
3. Defer UI plugins with `VeryLazy`
4. Use `dependencies` for proper load order

### Module Loading Order
1. Core functionality first
2. UI elements second
3. Language-specific last
4. Themes at the end

---

## Debugging

### Check Plugin Status
```vim
:Lazy
:Lazy profile
:Lazy debug
```

### Verify Module Loading
```lua
:lua print(vim.inspect(require('custom.plugins')))
```

### LSP Debugging
```vim
:LspInfo
:LspLog
:lua print(vim.lsp.get_active_clients())
```

---

*This API documentation reflects the current state of the Neovim configuration and should be updated when modules are modified.*