# Neovim Configuration Index

> A comprehensive guide to this Neovim configuration based on kickstart.nvim

## 📚 Documentation Suite

### Core Documentation
- 📖 **[README.md](README.md)** - Project overview and installation
- 🚀 **[ONBOARDING.md](ONBOARDING.md)** - New user guide with daily learning path
- ⌨️ **[KEYBINDINGS.md](KEYBINDINGS.md)** - Complete keyboard shortcuts reference
- 🔧 **[API.md](API.md)** - Technical API documentation for developers
- 🤖 **[CLAUDE.md](CLAUDE.md)** - AI assistant integration guide
- 📜 **[LICENSE.md](LICENSE.md)** - MIT License terms

### Neovim Help Documentation
- 📚 **[doc/nvim-config.txt](doc/nvim-config.txt)** - Standard Neovim help file
  - Access with `:help nvim-config` inside Neovim
  - Follows Vim help format conventions
  - Integrated with Neovim's help system

### Quick Navigation
1. [Quick Start](#quick-start)
2. [Project Structure](#project-structure)
3. [Plugin Categories](#plugin-categories)
4. [Configuration Sections](#configuration-sections)
5. [Key Mappings Reference](#key-mappings-reference)
6. [Development Workflows](#development-workflows)
7. [Customization Guide](#customization-guide)
8. [Troubleshooting](#troubleshooting)
9. [Documentation Guide](#documentation-guide)

---

## 🚀 Quick Start

### Essential Commands
- **`:Lazy`** - Manage plugins (update, install, clean)
- **`:Mason`** - Install/manage language servers
- **`:checkhealth`** - Verify configuration health
- **`<space>?`** - Show keybindings reference
- **`<space><space>`** - Find existing buffers

### First Time Setup
1. Open Neovim: `nvim`
2. Wait for lazy.nvim to auto-install
3. Plugins will automatically install
4. Run `:checkhealth` to verify setup
5. Install LSP servers with `:Mason`

---

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                 # Main configuration (kickstart base)
├── lazy-lock.json          # Plugin version lock file
├── INDEX.md               # This file - project documentation
├── CLAUDE.md              # AI assistant integration guide
├── KEYBINDINGS.md         # Complete keybinding reference
├── README.md              # Kickstart documentation
└── lua/
    ├── kickstart/         # Optional kickstart modules
    │   ├── health.lua     # Health check utilities
    │   └── plugins/       # Disabled optional modules
    │       ├── autopairs.lua
    │       ├── debug.lua
    │       ├── gitsigns.lua
    │       ├── indent_line.lua
    │       ├── lint.lua
    │       └── neo-tree.lua
    └── custom/
        └── plugins/       # Active custom configuration
            ├── init.lua           # Module orchestrator
            ├── core.lua          # Essential plugins
            ├── ui.lua            # UI enhancements
            ├── editor.lua        # Editor improvements
            ├── git.lua           # Git integration
            ├── lsp.lua           # Language servers
            ├── completion.lua    # Auto-completion
            ├── treesitter.lua    # Syntax highlighting
            ├── telescope.lua     # Fuzzy finding
            ├── languages.lua     # Language support
            ├── tools.lua         # Development tools
            └── themes.lua        # Colorschemes
```

---

## 🔌 Plugin Categories

### Core Functionality (`core.lua`)
- **Session Management**: auto-session
- **Window Navigation**: vim-tmux-navigator
- **Quick Escape**: better-escape.nvim
- **Start Screen**: dashboard-nvim

### UI Enhancements (`ui.lua`)
- **Status Line**: lualine.nvim
- **Indentation Guides**: indent-blankline.nvim
- **Icons**: nvim-web-devicons
- **Notifications**: fidget.nvim
- **Which Key**: which-key.nvim

### Editor Improvements (`editor.lua`)
- **Comments**: Comment.nvim
- **Surround**: nvim-surround
- **Auto Pairs**: nvim-autopairs
- **Motion**: leap.nvim
- **Text Objects**: mini.ai, mini.move, mini.splitjoin
- **Undo Tree**: undotree

### Git Integration (`git.lua`)
- **Git Commands**: vim-fugitive
- **Git Signs**: gitsigns.nvim
- **LazyGit**: lazygit.nvim
- **Diff View**: diffview.nvim
- **Git Blame**: Line-by-line blame display

### Language Server Protocol (`lsp.lua`)
- **LSP Config**: nvim-lspconfig
- **Server Manager**: mason.nvim, mason-lspconfig
- **Tool Installer**: mason-tool-installer
- **Lua Development**: lazydev.nvim
- **Code Actions**: actions-preview.nvim
- **Formatting**: conform.nvim

### Completion System (`completion.lua`)
- **Engine**: blink.cmp (v1.*)
- **Snippets**: LuaSnip + friendly-snippets
- **Sources**: LSP, path, snippets, buffer
- **Database**: vim-dadbod-completion

### Syntax & Parsing (`treesitter.lua`)
- **Parser**: nvim-treesitter
- **Text Objects**: nvim-treesitter-textobjects
- **Context**: nvim-treesitter-context
- **Folding**: nvim-ufo
- **Auto-tag**: HTML/JSX tag completion

### Fuzzy Finding (`telescope.lua`)
- **Core**: telescope.nvim
- **Native Sorter**: telescope-fzf-native
- **UI Select**: telescope-ui-select
- **File Browser**: Built-in file navigation
- **Quickfix Integration**: nvim-bqf

### Language Support (`languages.lua`)
- **Python**: 
  - Testing: neotest-python
  - Debugging: nvim-dap-python
  - Type checking: basedpyright
- **Markdown**:
  - Preview: markdown-preview.nvim
  - Rendering: render-markdown.nvim
- **JSON**: SchemaStore integration
- **REST**: rest.nvim for API testing

### Development Tools (`tools.lua`)
- **File Explorer**: nvim-tree.lua
- **Diagnostics**: trouble.nvim
- **TODO Comments**: todo-comments.nvim
- **Testing**: neotest framework
- **Debugging**: nvim-dap + nvim-dap-ui
- **Database**: vim-dadbod suite
- **Note Taking**: zk-nvim (Zettelkasten)
- **AI Assistant**: claudecode.nvim
- **Performance**: FixCursorHold.nvim

### Themes & Colors (`themes.lua`)
- **Theme Manager**: themery.nvim
- **Available Themes**:
  - tokyonight (variants: storm, night, moon, day)
  - catppuccin (variants: latte, frappe, macchiato, mocha)
  - rose-pine (variants: main, moon, dawn)
  - gruvbox (variants: dark, light)
  - kanagawa (variants: wave, dragon, lotus)
  - nightfox (multiple variants)

---

## ⚙️ Configuration Sections

### init.lua Structure

#### Leader Key Configuration (Lines 87-91)
```lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
```

#### Editor Options (Lines 96-162)
- Line numbers and display
- Mouse and clipboard
- Search behavior
- Whitespace handling
- Split behavior
- Undo persistence

#### Basic Keymaps (Lines 164-204)
- Search highlight clearing
- Diagnostic navigation
- Terminal mode escape
- Window navigation

#### Autocommands (Lines 206-218)
- Yank highlighting
- File type specific settings

#### Plugin Management (Lines 220-1020)
- Lazy.nvim bootstrap
- Plugin specifications
- Kickstart base plugins
- Custom plugin loading

---

## ⌨️ Key Mappings Reference

### Leader Mappings (`<space>` as leader)
| Prefix | Category | Example |
|--------|----------|---------|
| `<leader>s` | Search | `sf` - files, `sg` - grep |
| `<leader>g` | Git | `gs` - status, `gc` - commit |
| `<leader>c` | Claude AI | `cc` - open, `ce` - explain |
| `<leader>t` | Testing/Toggle | `tt` - run test, `th` - toggle hints |
| `<leader>z` | Notes (Zettelkasten) | `zn` - new note, `zf` - find |
| `<leader>x` | Diagnostics | `xx` - toggle, `xl` - location list |
| `<leader>b` | Buffer | `bp` - pin, `bP` - close non-pinned |
| `<leader>h` | Git Hunks | `hs` - stage, `hr` - reset |

### LSP Mappings
| Mapping | Action |
|---------|--------|
| `grn` | Rename symbol |
| `gra` | Code action |
| `grr` | Find references |
| `grd` | Go to definition |
| `gri` | Go to implementation |
| `K` | Hover documentation |

### Window Navigation
- `<C-h/j/k/l>` - Move between windows
- `<C-w>` prefix for window commands

---

## 🔧 Development Workflows

### Python Development
1. **Setup**: basedpyright LSP auto-installs
2. **Testing**: `<leader>tt` runs nearest test
3. **Debugging**: DAP integration with `<leader>td`
4. **Virtual Env**: Automatically detected

### Web Development
1. **TypeScript/JavaScript**: tsserver with full support
2. **React/Vue**: JSX/TSX with auto-tag
3. **CSS/Tailwind**: LSP and completions
4. **REST Testing**: Use rest.nvim

### Git Workflow
1. **Status**: `<leader>gs` or `<leader>gg` for LazyGit
2. **Commit**: `<leader>gc` with fugitive
3. **Diff**: `<leader>gd` or use diffview
4. **Hunks**: `<leader>h` prefix for hunk operations

### Note Taking (Zettelkasten)
1. **New Note**: `<leader>zn`
2. **Daily Note**: `<leader>zd`
3. **Find Notes**: `<leader>zf`
4. **Link Notes**: `[[` triggers completion

---

## 🎨 Customization Guide

### Adding Plugins
1. Create/edit files in `lua/custom/plugins/`
2. Follow the existing pattern:
```lua
return {
  {
    'plugin/name',
    event = 'VimEnter', -- or other event
    opts = {
      -- configuration
    },
  },
}
```

### Adding LSP Servers
1. Edit `lua/custom/plugins/lsp.lua`
2. Add to the `servers` table
3. Run `:Mason` to install

### Custom Keybindings
1. Add to appropriate section in `init.lua`
2. Or use which-key spec in plugin config
3. Document in KEYBINDINGS.md

### Theme Customization
1. Edit `lua/custom/plugins/themes.lua`
2. Add new colorscheme plugin
3. Configure with themery.nvim

---

## 🔍 Troubleshooting

### Common Issues

#### Plugins Not Loading
- Run `:Lazy sync` to update
- Check `:Lazy` for errors
- Verify with `:checkhealth`

#### LSP Not Working
- Run `:Mason` and install servers
- Check `:LspInfo` for status
- Verify with `:checkhealth`

#### Performance Issues
- Check startup time: `nvim --startuptime startup.log`
- Review lazy-loading events
- Disable unused plugins

#### Clipboard Issues
- Ensure clipboard tool installed (xclip/xsel)
- Check `:checkhealth provider`

### Health Checks
Run `:checkhealth` to verify:
- Neovim version compatibility
- Required dependencies
- Plugin status
- LSP configuration
- Provider status

### Getting Help
- In-editor: `:help {topic}`
- Search help: `<leader>sh`
- Plugin docs: Check GitHub repos
- AI assistance: `<leader>cc` for Claude

---

## 📊 Statistics

- **Total Plugins**: 71
- **Custom Modules**: 12
- **LSP Servers**: 15+ available
- **Colorschemes**: 20+ variants
- **Key Mappings**: 100+ defined

---

## 🔗 Quick Links

- [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [Neovim Docs](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason Registry](https://mason-registry.dev/)

---

## 📚 Documentation Guide

### Documentation Purpose & Audience

| Document | Purpose | Primary Audience | When to Use |
|----------|---------|------------------|-------------|
| **README.md** | Project overview, features, installation | New users, GitHub visitors | First time setup, sharing config |
| **ONBOARDING.md** | Progressive learning guide | Beginners to Neovim | Learning the configuration |
| **INDEX.md** | Complete reference guide | All users | Finding specific information |
| **KEYBINDINGS.md** | Keyboard shortcuts reference | Daily users | Quick lookup during coding |
| **API.md** | Technical plugin documentation | Developers, contributors | Modifying configuration |
| **CLAUDE.md** | AI development guide | Claude/AI assistants | AI-assisted development |
| **doc/nvim-config.txt** | Built-in Neovim help | All users within Neovim | In-editor reference via :help |

### Documentation Relationships

```
README.md (Overview)
    ├── ONBOARDING.md (Learning Path)
    │   ├── Day 1: Basics → KEYBINDINGS.md
    │   ├── Day 2: Features → INDEX.md sections
    │   └── Day 3: Advanced → API.md for customization
    ├── INDEX.md (Reference Hub)
    │   ├── Links to all documentation
    │   ├── Complete feature catalog
    │   └── Cross-references
    ├── API.md (Technical Details)
    │   ├── Module architecture
    │   ├── Plugin specifications
    │   └── Development patterns
    └── doc/nvim-config.txt (Built-in Help)
        ├── Accessible via :help nvim-config
        ├── Standard Vim help format
        └── Integrated with Neovim help system
```

### Quick Document Finder

#### "I want to..."
- **Install this configuration** → [README.md](README.md#installation)
- **Learn Neovim from scratch** → [ONBOARDING.md](ONBOARDING.md)
- **Find a keyboard shortcut** → [KEYBINDINGS.md](KEYBINDINGS.md)
- **Add a new plugin** → [API.md](API.md#adding-a-new-plugin-module)
- **Understand the architecture** → [CLAUDE.md](CLAUDE.md#architecture--plugin-system)
- **Troubleshoot an issue** → [ONBOARDING.md](ONBOARDING.md#troubleshooting-guide)
- **Configure LSP servers** → [API.md](API.md#lsp-server-configuration)
- **Customize themes** → [INDEX.md](#themes--colors)
- **Access built-in help** → `:help nvim-config` in Neovim

### Documentation Maintenance

#### Update Checklist
When making configuration changes:
1. ✅ Update API.md for structural changes
2. ✅ Update KEYBINDINGS.md for new mappings
3. ✅ Update README.md for new features
4. ✅ Update CLAUDE.md for architectural changes
5. ✅ Update INDEX.md to maintain cross-references

#### Version Information
- **Configuration Version**: Advanced setup based on kickstart.nvim
- **Documentation Version**: Complete suite with 8 documents (including Neovim help)
- **Last Major Update**: Migration to blink.cmp v1.*
- **Neovim Version**: 0.11.2
- **Help Documentation**: Standard Vim help format integrated

---

## 🔗 External Resources

### Official Documentation
- [Neovim Documentation](https://neovim.io/doc/)
- [Lua Guide](https://neovim.io/doc/user/lua-guide.html)
- [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

### Plugin Resources
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason Registry](https://mason-registry.dev/)
- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim)

### Learning Resources
- `:Tutor` - Built-in Vim tutorial
- `:help` - Comprehensive help system
- `:checkhealth` - System diagnostics

---

*Last Updated: Generated by Claude Code*
*Configuration Version: Based on kickstart.nvim with extensive customizations*
*Documentation Suite: 8 comprehensive guides including standard Neovim help*