# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is an advanced Neovim configuration built on kickstart.nvim, featuring 70+ plugins organized into a modular architecture. The configuration has evolved from a single-file setup to a sophisticated multi-module system with custom plugin categories, comprehensive LSP support, and AI integration.

## Common Development Commands

### Testing and Validation
```bash
# Verify configuration health
:checkhealth
:checkhealth lazy
:checkhealth lsp

# Debug plugin loading
:Lazy profile    # Check startup performance
:Lazy debug      # View debug information
:messages        # Check for Lua errors
```

### Plugin Management
```bash
:Lazy            # Open plugin manager UI
:Lazy update     # Update all plugins
:Lazy sync       # Sync with lockfile (lazy-lock.json)
:Lazy restore    # Restore plugins to lockfile versions
:Lazy reload {plugin}  # Reload specific plugin
```

### LSP Operations
```bash
:Mason           # Install/manage language servers
:LspInfo         # Check active LSP clients
:LspLog          # View LSP log
:ConformInfo     # Check formatter status
```

### Adding/Modifying Plugins
1. Edit appropriate file in `lua/custom/plugins/` (e.g., `git.lua` for git plugins)
2. Restart Neovim or run `:Lazy reload`
3. Run `:Lazy sync` if adding new plugins
4. Test with `:checkhealth` if issues arise

## Architecture & Plugin System

### Modular Plugin Architecture

The configuration uses a sophisticated orchestration system:

```
init.lua (line 994)
  └── { import = 'custom.plugins' }
      └── lua/custom/plugins/init.lua (orchestrator)
          └── safe_require() loads 12 plugin modules:
              ├── core.lua       (session, dashboard, essentials)
              ├── ui.lua         (lualine, which-key, notifications)
              ├── editor.lua     (comments, surround, motion)
              ├── git.lua        (fugitive, lazygit, diffview)
              ├── lsp.lua        (Mason, lspconfig, servers)
              ├── completion.lua (blink.cmp v1.*, snippets)
              ├── treesitter.lua (parsing, text objects, folding)
              ├── telescope.lua  (fuzzy finding, extensions)
              ├── languages.lua  (Python, Markdown, REST, etc.)
              ├── tools.lua      (DAP, testing, AI, notes)
              └── themes.lua     (20+ colorschemes, themery)
```

### Critical Implementation Details

1. **Plugin Loading Order Matters**: Modules in `plugin_modules` table (init.lua:38-50) load sequentially. Core must load before dependent modules.

2. **Completion System Migration**: Recently migrated from nvim-cmp to blink.cmp v1.*. This affects:
   - LSP capabilities (init.lua:663)
   - Completion keymaps (completion.lua:13-23)
   - Snippet integration with LuaSnip

3. **LSP Server Configuration**: 
   - Servers defined in `lsp.lua:26-104`
   - Auto-installation via mason-tool-installer
   - Capabilities enhanced by blink.cmp (init.lua:663)
   - Keymaps attached via LspAttach autocmd (init.lua:526-628)

4. **Error Handling**: The `safe_require()` function (init.lua:19-27) prevents startup failure if a module has errors.

### Key Integration Points

**LSP + Completion Flow**:
1. Mason installs language servers
2. mason-lspconfig bridges to nvim-lspconfig
3. blink.cmp provides completion capabilities
4. LspAttach autocmd adds buffer-local keymaps

**Git Integration Stack**:
- vim-fugitive: Git commands (`:Git`, `:Gdiff`)
- gitsigns: Gutter signs and hunk operations
- lazygit.nvim: TUI interface (`<leader>gg`)
- diffview: Advanced diff viewing

**Testing/Debugging Stack**:
- neotest: Test runner framework
- nvim-dap: Debug adapter protocol
- Language adapters (Python, JS, etc.)

### Performance Considerations

- Lazy loading configured via `event`, `cmd`, and `keys` triggers
- Use `:Lazy profile` to identify slow plugins
- Current startup target: <100ms
- Heavy plugins use `event = 'VeryLazy'`

## File Structure Patterns

### Adding a New Plugin Category
1. Create `lua/custom/plugins/{category}.lua`
2. Return table of plugin specifications
3. Add to `plugin_modules` in `lua/custom/plugins/init.lua`
4. Order matters - consider dependencies

### Plugin Specification Format
```lua
{
  'author/plugin',
  version = '1.*',  -- Optional version constraint
  event = 'VimEnter',  -- Lazy loading trigger
  dependencies = { ... },
  opts = { ... },  -- Passed to plugin.setup()
  config = function() ... end,  -- Or full control
}
```

## Language-Specific Configurations

### Python Development
- LSP: basedpyright with type checking
- Testing: neotest-python, pytest integration
- Debugging: nvim-dap-python
- Virtual env: Auto-detection built-in
- Formatting: Black, isort via conform.nvim

### TypeScript/JavaScript
- LSP: tsserver with full features
- Formatting: Prettier via conform
- Testing: Neotest adapters available
- Framework support: React, Vue via treesitter

### Markdown
- Preview: markdown-preview.nvim (`:MarkdownPreview`)
- Rendering: render-markdown.nvim (in-editor)
- LSP: marksman for completion
- Note-taking: zk-nvim integration

## Version Constraints

- Neovim: 0.10+ required (0.11+ for latest features)
- Lua: 5.1 (embedded in Neovim)
- Plugin versions: Locked in `lazy-lock.json`
- blink.cmp: Pinned to v1.* for stability
- Node.js: 16+ for JS/TS tools
- Python: 3.8+ for Python tools