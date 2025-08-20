# AI Plugins Integration Guide

## Overview
This document describes the integration of two AI-powered plugins into your Neovim configuration:
1. **claudecode.nvim** - Claude Code integration for AI-assisted coding
2. **mcphub.nvim** - MCP (Model Context Protocol) client for enhanced AI interactions

## Installation Complete ✅

Both plugins have been successfully integrated into your Neovim configuration and are ready to use.

## Plugin Locations

### 1. claudecode.nvim
- **File**: `lua/custom/plugins/tools.lua` (lines 295-308)
- **Dependencies**: `folke/snacks.nvim` (for terminal support)
- **Configuration**: Using default settings with `config = true`

### 2. mcphub.nvim  
- **File**: `lua/custom/plugins/tools.lua` (lines 310-357)
- **Dependencies**: `nvim-lua/plenary.nvim`
- **Configuration**: Basic setup with room for MCP server additions

### 3. snacks.nvim (Support Library)
- **File**: `lua/custom/plugins/ui.lua` (lines 131-148)
- **Purpose**: Provides enhanced terminal support for claudecode.nvim
- **Features**: Terminal integration, notifications, word highlighting

## Key Bindings

### Claude Code Commands
- `<leader>ac` - Toggle Claude Code interface
- `<leader>as` - Send visual selection to Claude (visual mode)
- `<leader>ad` - Accept Claude's diff/changes
- `<leader>aD` - Deny Claude's diff/changes

### MCPHub Commands
- `<leader>am` - Open MCPHub Dashboard
- `<leader>at` - View MCP Tools
- `<leader>ar` - View MCP Resources  
- `<leader>ap` - View MCP Prompts

### Snacks.nvim Commands
- `<leader>sn` - Show notification history
- `<leader>st` - Toggle terminal

## Usage Instructions

### Claude Code

1. **Start Claude Code**:
   ```vim
   :ClaudeCode
   " or press <leader>ac
   ```

2. **Send Code to Claude**:
   - Select code in visual mode
   - Press `<leader>as` to send selection

3. **Review Changes**:
   - Claude will propose changes as diffs
   - Accept with `<leader>ad` or deny with `<leader>aD`

### MCPHub

1. **Open Dashboard**:
   ```vim
   :MCPHub
   " or press <leader>am
   ```

2. **Configure MCP Servers** (Optional):
   Edit `lua/custom/plugins/tools.lua` and add servers to the `servers` table:
   ```lua
   servers = {
     {
       name = 'my-server',
       transport = 'stdio',
       command = 'my-mcp-server',
       args = {},
     },
   }
   ```

3. **Integration with Chat Plugins**:
   MCPHub auto-detects and integrates with:
   - Avante.nvim
   - CodeCompanion.nvim  
   - CopilotChat.nvim

## Requirements

### Claude Code
- Neovim 0.8.0+ (you have 0.11.2 ✅)
- Claude Code CLI installed (install from https://claude.ai/code)

### MCPHub
- Neovim (you have 0.11.2 ✅)
- MCP servers (optional, configure as needed)

## Next Steps

1. **Install Claude Code CLI**:
   ```bash
   # Follow instructions at https://claude.ai/code
   ```

2. **Test Claude Code**:
   - Open Neovim
   - Run `:checkhealth claudecode` to verify setup
   - Press `<leader>ac` to toggle Claude interface

3. **Configure MCP Servers** (Optional):
   - Visit https://ravitemer.github.io/mcphub.nvim/ for documentation
   - Add MCP servers to configuration as needed

4. **Explore Features**:
   - Try sending code selections to Claude
   - Explore MCPHub dashboard
   - Use Snacks.nvim terminal for enhanced experience

## Troubleshooting

### If plugins don't load:
1. Restart Neovim
2. Run `:Lazy sync` to ensure plugins are installed
3. Check `:Lazy` UI for any errors

### For Claude Code issues:
- Ensure Claude Code CLI is installed and in PATH
- Check `:messages` for error details

### For MCPHub issues:
- Visit documentation: https://ravitemer.github.io/mcphub.nvim/
- Check `:checkhealth mcphub` for diagnostics

## Additional Resources

- claudecode.nvim: https://github.com/coder/claudecode.nvim
- mcphub.nvim: https://github.com/ravitemer/mcphub.nvim
- snacks.nvim: https://github.com/folke/snacks.nvim