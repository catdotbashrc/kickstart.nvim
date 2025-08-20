# 🚀 Neovim Configuration Onboarding Guide

> Welcome! This guide will help you get started with this advanced Neovim configuration, taking you from installation to productive coding.

## 📋 Table of Contents

1. [Quick Start (5 minutes)](#quick-start-5-minutes)
2. [Day 1: Essential Skills](#day-1-essential-skills)
3. [Day 2: Core Features](#day-2-core-features)
4. [Day 3: Advanced Features](#day-3-advanced-features)
5. [Week 1: Mastery Path](#week-1-mastery-path)
6. [Troubleshooting Guide](#troubleshooting-guide)
7. [Learning Resources](#learning-resources)

---

## 🎯 Quick Start (5 minutes)

### Prerequisites Check

Before starting, ensure you have:

```bash
# Check Neovim version (need 0.10+)
nvim --version

# Check required tools
git --version          # Git for plugin management
rg --version           # Ripgrep for searching
node --version         # Node.js for TypeScript/JavaScript
python3 --version      # Python for Python development
```

### Installation

#### Step 1: Backup Existing Configuration
```bash
# Linux/macOS
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup

# Windows (PowerShell)
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.backup
```

#### Step 2: Clone This Configuration
```bash
# Linux/macOS
git clone <your-repo-url> ~/.config/nvim

# Windows (PowerShell)
git clone <your-repo-url> $env:LOCALAPPDATA\nvim
```

#### Step 3: First Launch
```bash
nvim
# Wait 1-2 minutes for plugins to install automatically
# You'll see progress in the status line
```

#### Step 4: Post-Installation
```vim
" Inside Neovim, run these commands:
:checkhealth     " Verify everything is working
:Mason           " Install language servers (press 'i' on items)
:Lazy            " View plugin manager
```

### 🎉 Congratulations!
You now have a fully configured Neovim! Let's learn how to use it.

---

## 📚 Day 1: Essential Skills

### Understanding the Leader Key

The **leader key** is `<space>` (spacebar). Most custom commands start with it.

**Try these essential commands:**
- `<space>?` - Show all keybindings (bookmark this!)
- `<space><space>` - Find open buffers
- `<space>sf` - Search files
- `<space>sg` - Search with grep

### Basic Navigation

#### File Navigation
| Action | Keys | Description |
|--------|------|-------------|
| Open file tree | `<space>e` | Toggle file explorer |
| Find files | `<space>sf` | Fuzzy file search |
| Recent files | `<space>s.` | Show recent files |
| Switch buffers | `<space><space>` | List open files |

#### Window Management
| Action | Keys | Description |
|--------|------|-------------|
| Split horizontal | `:split` or `<C-w>s` | Create horizontal split |
| Split vertical | `:vsplit` or `<C-w>v` | Create vertical split |
| Navigate windows | `<C-h/j/k/l>` | Move between splits |
| Close window | `:q` or `<C-w>q` | Close current window |

### Essential Editing

#### Normal Mode Commands
- `yy` - Copy line
- `dd` - Cut line
- `p` - Paste after cursor
- `u` - Undo
- `<C-r>` - Redo

#### Insert Mode
- `i` - Insert before cursor
- `a` - Insert after cursor
- `o` - New line below
- `O` - New line above
- `<Esc>` - Return to normal mode

### Your First Workflow

1. **Open Neovim**: `nvim`
2. **Find a file**: `<space>sf` and type filename
3. **Edit the file**: Press `i` to insert
4. **Save**: `<Esc>` then `:w`
5. **Search in file**: `/searchterm` then `n` for next
6. **Search across files**: `<space>sg` and type term

### 🏠 Homework for Day 1
- [ ] Navigate 5 files using `<space>sf`
- [ ] Edit and save a file
- [ ] Use `<space>?` to explore keybindings
- [ ] Try window splits

---

## 🚀 Day 2: Core Features

### Language Server Protocol (LSP)

LSP provides intelligent code features. Here's how to use them:

#### Essential LSP Commands
| Action | Keys | Description |
|--------|------|-------------|
| Go to definition | `grd` | Jump to where it's defined |
| Find references | `grr` | Find all usages |
| Hover documentation | `K` | Show info about symbol |
| Rename symbol | `grn` | Rename everywhere |
| Code action | `gra` | Show available fixes |
| Format code | `<space>f` | Format current buffer |

#### Installing Language Servers
1. Open Mason: `:Mason`
2. Search: `/` then type language name
3. Install: Navigate and press `i`
4. Verify: `:LspInfo` in a code file

### Auto-completion

Completion works automatically as you type.

#### Completion Keys
- `<C-n>` - Next suggestion
- `<C-p>` - Previous suggestion
- `<CR>` - Accept suggestion
- `<C-e>` - Cancel completion
- `<Tab>` - Navigate snippets

### Git Integration

#### Git Commands
| Action | Keys | Description |
|--------|------|-------------|
| Git status | `<space>gs` | Open Fugitive status |
| LazyGit | `<space>gg` | Full Git UI |
| View changes | `<space>gd` | Diff view |
| Stage hunk | `<space>hs` | Stage change under cursor |
| Next hunk | `]h` | Jump to next change |

#### Git Workflow Example
1. Make changes to files
2. `<space>gg` - Open LazyGit
3. Stage changes with `space`
4. Commit with `c`
5. Push with `P`

### File Search & Navigation

#### Telescope (Fuzzy Finder)
- `<space>sf` - Find files
- `<space>sg` - Live grep (search content)
- `<space>sw` - Search current word
- `<space>sh` - Search help
- `<space>sk` - Search keymaps

#### Search Tips
- Use `<C-q>` to send results to quickfix
- In Telescope, `<C-/>` shows help (insert mode)
- Use `<Tab>` to select multiple items

### 🏠 Homework for Day 2
- [ ] Install LSP for your main language
- [ ] Use `grd` and `grr` in a code file
- [ ] Make a commit using LazyGit
- [ ] Search your codebase with `<space>sg`

---

## 🎨 Day 3: Advanced Features

### Plugin Management

#### Working with Plugins
1. **View plugins**: `:Lazy`
2. **Update plugins**: `:Lazy update`
3. **Check status**: `:Lazy sync`
4. **Profile startup**: `:Lazy profile`

#### Understanding Plugin Structure
- Plugins are in `lua/custom/plugins/`
- Each file is a category (git, lsp, ui, etc.)
- Modifications require Neovim restart

### Advanced Editing

#### Surround Operations
- `cs"'` - Change surrounding " to '
- `ds"` - Delete surrounding "
- `ysiw"` - Surround word with "
- Visual mode: Select then `S"`

#### Comments
- `gcc` - Toggle line comment
- `gc` + motion - Comment motion
- Visual: Select then `gc`

#### Multiple Cursors (via visual block)
1. `<C-v>` - Visual block mode
2. Select lines
3. `I` or `A` - Insert at start/end
4. Type text
5. `<Esc>` - Apply to all

### Testing & Debugging

#### Running Tests
| Action | Keys | Description |
|--------|------|-------------|
| Run nearest test | `<space>tt` | Test at cursor |
| Run file tests | `<space>tf` | All tests in file |
| Debug test | `<space>td` | Debug mode |
| Test summary | `<space>ts` | Toggle summary |

#### Debugging (Python example)
1. Set breakpoint: Click line number or `<space>db`
2. Start debugging: `<space>td`
3. Controls appear in UI
4. Step through code with DAP controls

### AI Assistant (Claude)

#### Claude Commands
- `<space>cc` - Open Claude chat
- `<space>ce` - Explain code (visual mode)
- `<space>cr` - Review code
- `<space>cf` - Fix issues
- `<space>cg` - Generate code

### Note Taking (Zettelkasten)

#### Note Commands
- `<space>zn` - New note
- `<space>zd` - Daily note
- `<space>zf` - Find notes
- `<space>zb` - Show backlinks
- `[[` - Link completion (in notes)

### 🏠 Homework for Day 3
- [ ] Change surrounding quotes in a file
- [ ] Run tests in a project
- [ ] Use Claude to explain complex code
- [ ] Create a note with `<space>zn`

---

## 📅 Week 1: Mastery Path

### Day 4: Customization

#### Changing Settings
1. Edit `~/.config/nvim/init.lua` for core settings
2. Modify `lua/custom/plugins/*.lua` for plugins
3. Reload with `:source %` or restart Neovim

#### Common Customizations
```lua
-- Enable relative line numbers
vim.opt.relativenumber = true

-- Change theme
vim.cmd.colorscheme 'tokyonight-night'

-- Add custom keymap
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
```

### Day 5: Productivity Workflows

#### Session Management
- Sessions auto-save and restore
- `:SessionSave` - Manual save
- `:SessionRestore` - Manual restore

#### Marks & Registers
- `ma` - Set mark 'a'
- `'a` - Jump to mark 'a'
- `"ay` - Yank to register 'a'
- `"ap` - Paste from register 'a'

#### Macros
1. `qa` - Start recording to 'a'
2. Perform actions
3. `q` - Stop recording
4. `@a` - Play macro
5. `@@` - Repeat last macro

### Day 6: Language-Specific Features

#### Python Development
- Virtual env auto-detection
- Test runner integration
- Debugger support
- Black/isort formatting

#### Web Development
- ESLint/Prettier integration
- Emmet support
- Live server
- Tailwind CSS IntelliSense

#### Markdown
- Preview: `<space>mp`
- Table formatting
- Link following
- TOC generation

### Day 7: Performance & Optimization

#### Startup Optimization
```vim
:Lazy profile     " Check startup time
:checkhealth      " Find issues
```

#### Key Performance Tips
1. Disable unused plugins in `lua/custom/plugins/`
2. Use `event = 'VeryLazy'` for UI plugins
3. Lazy-load on commands and keymaps
4. Keep plugin count reasonable

---

## 🔧 Troubleshooting Guide

### Common Issues & Solutions

#### Issue: Plugins not installing
```vim
:Lazy sync        " Force sync
:checkhealth lazy " Check for errors
```

#### Issue: LSP not working
```vim
:LspInfo          " Check LSP status
:Mason            " Reinstall server
:checkhealth lsp  " Diagnose issues
```

#### Issue: Slow startup
```vim
:Lazy profile     " Find slow plugins
" Disable unnecessary plugins
" Check for configuration errors
```

#### Issue: Clipboard not working
```bash
# Linux: Install xclip or xsel
sudo apt install xclip

# macOS: Should work out of the box
# Windows: Install win32yank
```

#### Issue: Icons not showing
1. Install a Nerd Font (JetBrainsMono recommended)
2. Set terminal font to the Nerd Font
3. In init.lua, set: `vim.g.have_nerd_font = true`

### Getting Help

#### In Neovim
- `:help keyword` - Built-in help
- `<space>sh` - Search help
- `<space>?` - Keybinding reference

#### Documentation
- `README.md` - Overview
- `INDEX.md` - Complete reference
- `API.md` - Technical details
- `KEYBINDINGS.md` - All shortcuts

#### Community
- Create an issue on GitHub
- Neovim subreddit
- Neovim Discord

---

## 📖 Learning Resources

### Essential Neovim Concepts

#### Modes
- **Normal**: Navigation and commands (ESC)
- **Insert**: Text editing (i, a, o)
- **Visual**: Selection (v, V, <C-v>)
- **Command**: Ex commands (:)

#### Motions
- `w` - Word forward
- `b` - Word backward
- `0` - Line start
- `$` - Line end
- `gg` - File start
- `G` - File end

#### Text Objects
- `iw` - Inner word
- `aw` - A word (with space)
- `i"` - Inside quotes
- `a"` - Around quotes
- `ip` - Inner paragraph

### Recommended Learning Path

1. **Week 1**: Master basic navigation and editing
2. **Week 2**: Learn LSP features and git integration
3. **Week 3**: Explore plugins and customization
4. **Week 4**: Develop personal workflows

### Practice Exercises

#### Beginner
1. Navigate without arrow keys for one day
2. Use `<space>sf` instead of file tree
3. Make 5 commits using LazyGit

#### Intermediate
1. Record and use 3 macros
2. Refactor code using LSP rename
3. Write custom keymaps

#### Advanced
1. Create a custom plugin module
2. Configure a new language server
3. Build a personal workflow

### Vim Resources
- `:Tutor` - Built-in tutorial
- [Vim Adventures](https://vim-adventures.com/) - Game
- [VimGolf](https://www.vimgolf.com/) - Challenges
- [Practical Vim](https://pragprog.com/titles/dnvim2/) - Book

---

## 🎯 Quick Reference Card

### Most Used Commands (Print This!)

```
NAVIGATION              EDITING
<space>sf  Find file    i         Insert mode
<space>sg  Grep search  <Esc>     Normal mode
<space>e   File tree    dd        Delete line
<C-h/j/k/l> Windows     yy        Copy line
                        p         Paste

LSP                     GIT
grd  Go to definition   <space>gg LazyGit
grr  Find references    <space>gs Git status
K    Hover docs        ]h        Next change
grn  Rename            [h        Previous change
gra  Code action

SEARCH                  TOOLS
/    Search in file     <space>?  Keybindings
n    Next match        :Lazy     Plugins
*    Search word       :Mason    LSP servers
<space>sw Current word :checkhealth Diagnose
```

---

## 🏆 Milestones Checklist

### Week 1 Goals
- [ ] Complete Days 1-3 exercises
- [ ] Install LSP for main language
- [ ] Make 10 commits using LazyGit
- [ ] Use Telescope for all file navigation
- [ ] Learn 20 keybindings

### Month 1 Goals
- [ ] Customize configuration
- [ ] Master LSP features
- [ ] Build muscle memory for navigation
- [ ] Create personal snippets
- [ ] Achieve 50+ WPM in Neovim

### Expert Level (3 Months)
- [ ] Navigate without thinking
- [ ] Use advanced features daily
- [ ] Create custom plugins
- [ ] Help others learn
- [ ] Contribute improvements

---

## 💡 Pro Tips

1. **Learn incrementally**: Don't try to learn everything at once
2. **Use `:help`**: The built-in help is excellent
3. **Practice daily**: Even 15 minutes helps
4. **Customize gradually**: Start with defaults, then adjust
5. **Join community**: Learn from others' workflows

---

## 🚀 Welcome to Your Neovim Journey!

Remember: Everyone was a beginner once. Be patient with yourself, practice regularly, and soon you'll be flying through code at the speed of thought!

**Happy coding!** 🎉

---

*Last tip: Keep this guide open in a browser tab for the first week!*