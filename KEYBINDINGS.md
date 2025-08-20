# Neovim Keybindings Reference

Leader key: `<space>`

**Quick Access**: `<leader>?` - Open this keybindings reference

## Core Navigation
- `<C-h/j/k/l>` - Move between windows
- `<leader><leader>` - Find existing buffers
- `<S-h>/<S-l>` - Navigate buffers (previous/next)

## Search & Files
- `<leader>sf` - Search files
- `<leader>sg` - Search by grep
- `<leader>sw` - Search current word
- `<leader>s/` - Search in open files
- `<leader>sn` - Search Neovim config files
- `<leader>e` - Toggle file explorer

## Git Integration
- `<leader>gs` - Git status (Fugitive)
- `<leader>gc` - Git commit
- `<leader>gp` - Git push
- `<leader>gl` - Git pull
- `<leader>gB` - Git blame
- `<leader>gg` - LazyGit interface
- `<leader>gf` - LazyGit current file
- `<leader>h` - Git hunk operations (in file)

## LSP & Code
- `grn` - Rename symbol
- `gra` - Code action
- `grr` - Find references
- `gri` - Go to implementation
- `grd` - Go to definition
- `grt` - Go to type definition
- `grD` - Go to declaration
- `gO` - Document symbols
- `gW` - Workspace symbols
- `K` - Hover documentation
- `<leader>f` - Format buffer
- `<leader>q` - Diagnostic quickfix list

## Claude Code AI
- `<leader>cc` - Open Claude Code
- `<leader>cC` - Claude Code Chat
- `<leader>ce` - Claude Code Explain (n, v)
- `<leader>cr` - Claude Code Review (n, v)
- `<leader>cf` - Claude Code Fix (n, v)
- `<leader>cg` - Claude Code Generate
- `<leader>cd` - Claude Code Document (n, v)
- `<leader>ct` - Claude Code Test (n, v)

## Testing (Python)
- `<leader>tt` - Run nearest test
- `<leader>tf` - Run file tests
- `<leader>td` - Debug test
- `<leader>ts` - Toggle test summary
- `<leader>to` - Show test output

## Notes (Zettelkasten)
- `<leader>zn` - New note
- `<leader>zd` - New daily note
- `<leader>zo` - Open/browse notes
- `<leader>zt` - Browse by tags
- `<leader>zf` - Find notes
- `<leader>zb` - Show backlinks (in note)
- `<leader>zl` - Show links (in note)

### Visual Mode (Notes)
- `<leader>zn` - Create note from title
- `<leader>zc` - Create note from content
- `<leader>zl` - Insert link
- `<leader>zm` - Find matching notes

## Markdown
- `<leader>mp` - Toggle markdown preview
- `[[` - Trigger note completion (in notes dir)
- `#` - Trigger tag completion (in notes dir)

## Diagnostics & Trouble
- `<leader>xx` - Toggle diagnostics
- `<leader>xX` - Buffer diagnostics
- `<leader>xl` - Location list
- `<leader>xq` - Quickfix list

## UI & Toggles
- `<leader>th` - Toggle inlay hints
- `<leader>bp` - Pin buffer
- `<leader>bP` - Close non-pinned buffers
- `<leader>ct` - Theme switcher (Themery)

## Editing Enhancements
- `gcc` - Comment/uncomment line
- `gc{motion}` - Comment motion
- `cs{old}{new}` - Change surrounding (e.g., cs"')
- `ds{char}` - Delete surrounding
- `ys{motion}{char}` - Add surrounding
- `s{char}{char}` - Leap to location (requires leap.nvim)

## Terminal
- `<Esc><Esc>` - Exit terminal mode

## Session & Management
- `:Lazy` - Plugin manager
- `:Mason` - LSP/tool installer
- `:checkhealth` - System health check

## Colorscheme Options
To change theme, add to init.lua after plugins:
- `vim.cmd.colorscheme 'catppuccin'`
- `vim.cmd.colorscheme 'kanagawa'`
- `vim.cmd.colorscheme 'tokyonight'`