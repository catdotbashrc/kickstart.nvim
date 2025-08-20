# 🚀 Advanced Neovim Configuration

> A powerful, modular Neovim setup built on kickstart.nvim with 70+ plugins, comprehensive LSP support, and AI integration

[![Neovim](https://img.shields.io/badge/Neovim-0.11+-green.svg)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-5.1+-blue.svg)](https://www.lua.org)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)

## ✨ Highlights

- **🎯 Modular Architecture** - Organized into 12 custom plugin categories for easy management
- **🤖 AI-Powered** - Integrated Claude Code support for intelligent coding assistance  
- **📝 Language Excellence** - Pre-configured LSP for 15+ languages with auto-installation
- **🎨 Beautiful Themes** - 20+ colorscheme variants with theme manager
- **⚡ Performance Optimized** - Lazy loading, fast startup, efficient plugin management
- **🔧 Developer Ready** - Git integration, debugging, testing, database tools, and more
- **📚 Note Taking** - Built-in Zettelkasten system for knowledge management

## 📸 Screenshots

<details>
<summary>Click to view screenshots</summary>

### Dashboard
The custom dashboard provides quick access to recent files, projects, and key actions.

### Coding Experience  
Full LSP support with inline diagnostics, code actions, and intelligent completion.

### Git Integration
Multiple git tools including Fugitive, LazyGit, and Gitsigns for comprehensive version control.

</details>

## 🎯 Features

### Core Components
- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) with version locking
- **Completion**: [blink.cmp](https://github.com/Saghen/blink.cmp) v1.* with LSP, snippets, and path support
- **LSP Management**: [Mason](https://github.com/williamboman/mason.nvim) with automatic server installation
- **Fuzzy Finder**: [Telescope](https://github.com/nvim-telescope/telescope.nvim) with native FZF
- **Syntax**: [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) with incremental parsing

### Development Tools
- **Git**: Fugitive, LazyGit, Gitsigns, Diffview
- **Testing**: Neotest framework with Python support
- **Debugging**: DAP with UI and virtual text
- **Database**: vim-dadbod suite with UI and completion
- **REST Client**: Built-in API testing
- **AI Assistant**: Claude Code integration
- **Note Taking**: Zettelkasten with zk-nvim

### Languages & Frameworks
Preconfigured support for:
- **Python** (basedpyright, black, isort, pytest)
- **TypeScript/JavaScript** (tsserver, prettier, eslint)
- **Rust** (rust-analyzer, rustfmt)
- **Go** (gopls, gofmt)
- **Lua** (lua-ls with Neovim API)
- **Markdown** (marksman, prettier, preview)
- And many more...

## 📦 Installation

### Prerequisites

#### System Requirements
- Neovim >= 0.10.0 (latest stable or nightly)
- Git >= 2.19.0
- C compiler (gcc/clang)
- Make
- Unzip
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool:
  - Linux: `xclip` or `xsel`
  - macOS: Built-in pbcopy/pbpaste
  - Windows: win32yank or built-in
- [Node.js](https://nodejs.org/) >= 16.0 (for JS/TS development)
- [Python](https://www.python.org/) >= 3.8 (for Python development)

#### Optional
- [Nerd Font](https://www.nerdfonts.com/) (recommended: JetBrainsMono Nerd Font)
- Language-specific tools (installed automatically via Mason)

### Quick Install

#### Linux/macOS

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Clone this configuration
git clone https://github.com/yourusername/nvim-config ~/.config/nvim

# Start Neovim
nvim
```

#### Windows (PowerShell)

```powershell
# Backup existing config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

# Clone this configuration
git clone https://github.com/yourusername/nvim-config $env:LOCALAPPDATA\nvim

# Start Neovim
nvim
```

### Post-Installation

1. **First Launch**: Wait for lazy.nvim to install all plugins
2. **Health Check**: Run `:checkhealth` to verify setup
3. **Install LSP Servers**: Open `:Mason` and install desired servers
4. **Configure Nerd Font**: Set `vim.g.have_nerd_font = true` in init.lua if installed

## ⌨️ Key Mappings

> Leader key: `<space>`

### Essential Shortcuts

| Category | Mapping | Description |
|----------|---------|-------------|
| **General** | `<leader>?` | Show all keybindings |
| **Files** | `<leader>sf` | Find files |
| **Search** | `<leader>sg` | Grep search |
| **Git** | `<leader>gg` | LazyGit |
| **LSP** | `grd` | Go to definition |
| **LSP** | `grr` | Find references |
| **LSP** | `gra` | Code action |
| **LSP** | `K` | Hover documentation |
| **AI** | `<leader>cc` | Open Claude Code |
| **Testing** | `<leader>tt` | Run nearest test |

See [KEYBINDINGS.md](KEYBINDINGS.md) for complete reference.

## 📂 Project Structure

```
~/.config/nvim/
├── init.lua                # Main configuration
├── lazy-lock.json         # Plugin versions
├── lua/
│   ├── kickstart/        # Optional modules
│   └── custom/plugins/   # Custom configuration
│       ├── init.lua      # Plugin loader
│       ├── core.lua      # Essential plugins
│       ├── ui.lua        # UI enhancements
│       ├── editor.lua    # Editor features
│       ├── git.lua       # Git integration
│       ├── lsp.lua       # Language servers
│       ├── completion.lua # Auto-completion
│       ├── treesitter.lua # Syntax highlighting
│       ├── telescope.lua  # Fuzzy finding
│       ├── languages.lua  # Language support
│       ├── tools.lua     # Dev tools
│       └── themes.lua    # Colorschemes
├── INDEX.md              # Detailed documentation
├── KEYBINDINGS.md        # Key mapping reference
└── README.md             # This file
```

## 🎨 Customization

### Adding Plugins

Create or modify files in `lua/custom/plugins/`:

```lua
-- lua/custom/plugins/your-category.lua
return {
  {
    'author/plugin-name',
    event = 'VimEnter',  -- Lazy loading event
    opts = {
      -- Plugin configuration
    },
  },
}
```

### Installing LSP Servers

1. Open Mason: `:Mason`
2. Find server: `/` to search
3. Install: `i` on selection
4. Configure in `lua/custom/plugins/lsp.lua` if needed

### Changing Theme

1. Run: `<leader>ct` to open theme selector
2. Preview themes with arrow keys
3. Press Enter to apply
4. Theme persists across sessions

## 🔧 Commands

### Plugin Management
- `:Lazy` - Plugin manager UI
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Sync plugin state
- `:Lazy profile` - Startup profiling

### LSP & Development
- `:Mason` - LSP installer UI
- `:LspInfo` - Active LSP info
- `:LspLog` - LSP log file
- `:ConformInfo` - Formatter info

### Utilities
- `:checkhealth` - System diagnostics
- `:Telescope` - Fuzzy finder
- `:LazyGit` - Git interface
- `:Trouble` - Diagnostics list

## 🚀 Performance

### Startup Optimization
- Lazy loading for all non-essential plugins
- Modular configuration with conditional loading
- Efficient treesitter parser management
- Optimized LSP server initialization

### Benchmark
```bash
# Check startup time
nvim --startuptime startup.log
cat startup.log | grep -E "^[0-9]+\.[0-9]+" | tail -1
```

Typical startup time: < 100ms

## 🐛 Troubleshooting

### Common Issues

#### Plugins Not Loading
```vim
:Lazy sync
:checkhealth lazy
```

#### LSP Not Working
```vim
:LspInfo
:checkhealth lsp
:Mason
```

#### Clipboard Issues
```vim
:checkhealth provider
# Install: xclip (Linux) or win32yank (Windows)
```

#### Slow Performance
```vim
:Lazy profile
:checkhealth
```

## 📚 Documentation

- [INDEX.md](INDEX.md) - Complete configuration guide
- [KEYBINDINGS.md](KEYBINDINGS.md) - All keyboard shortcuts
- [CLAUDE.md](CLAUDE.md) - AI integration guide
- `:help` - Built-in Neovim help
- `<leader>sh` - Search help docs

## 🤝 Contributing

Contributions are welcome! This is a personal configuration, but feel free to:

1. Fork the repository
2. Create a feature branch
3. Make your improvements
4. Submit a pull request

### Guidelines
- Follow existing code style
- Test changes thoroughly
- Update documentation
- Keep commits atomic

## 📝 License

This configuration is based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and is available under the MIT License. See [LICENSE.md](LICENSE.md) for details.

## 🙏 Acknowledgments

- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - The excellent foundation
- [Neovim](https://neovim.io/) - The best text editor
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin management
- All plugin authors for their amazing work

## 📮 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/nvim-config/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/nvim-config/discussions)
- **Wiki**: [Configuration Wiki](https://github.com/yourusername/nvim-config/wiki)

---

<div align="center">
  
**Happy Coding!** 🎉

Made with ❤️ using Neovim

</div>