-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║                  Custom Plugin Configuration Orchestrator             ║
-- ╠══════════════════════════════════════════════════════════════════════╣
-- ║ This module serves as the central hub for loading all custom plugin   ║
-- ║ configurations. It implements a modular architecture where each       ║
-- ║ category of plugins is defined in its own file, making the           ║
-- ║ configuration maintainable and organized.                            ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local M = {}

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                        Safe Module Loader                             │
-- ├──────────────────────────────────────────────────────────────────────┤
-- │ Wraps require() in a protected call to prevent startup failures      │
-- │ if a module has syntax errors or is missing. This ensures Neovim    │
-- │ remains functional even if individual plugin modules fail to load.   │
-- └──────────────────────────────────────────────────────────────────────┘
local function safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    -- Display error notification without crashing Neovim
    vim.notify('Failed to load ' .. module .. ': ' .. result, vim.log.levels.ERROR)
    return {} -- Return empty table to continue loading other modules
  end
  return result
end

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                      Plugin Module Registry                           │
-- ├──────────────────────────────────────────────────────────────────────┤
-- │ Define the loading order and categories of plugin modules.           │
-- │ Order matters! Core modules should load before dependent modules.    │
-- │                                                                       │
-- │ Each module should return a table of plugin specifications           │
-- │ compatible with lazy.nvim's format.                                  │
-- └──────────────────────────────────────────────────────────────────────┘
local plugin_modules = {
  'custom.plugins.core',       -- Essential plugins (session, startup screen)
  'custom.plugins.ui',         -- UI enhancements (statusline, icons, notifications)
  'custom.plugins.editor',     -- Editor improvements (comments, surround, motion)
  'custom.plugins.git',        -- Git integration (fugitive, lazygit, diffview)
  'custom.plugins.lsp',        -- Language server configuration (Mason, lspconfig)
  'custom.plugins.completion', -- Completion engine (blink.cmp, snippets)
  'custom.plugins.treesitter', -- Syntax highlighting (treesitter, text objects)
  'custom.plugins.telescope',  -- Fuzzy finding (telescope, extensions)
  'custom.plugins.languages',  -- Language-specific plugins (Python, Markdown, etc.)
  'custom.plugins.tools',      -- Development tools (testing, debugging, database)
  'custom.plugins.themes',     -- Colorschemes (multiple themes with manager)
}

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                     Plugin Specification Aggregator                   │
-- ├──────────────────────────────────────────────────────────────────────┤
-- │ Collects all plugin specifications from individual modules and       │
-- │ combines them into a single table for lazy.nvim to process.         │
-- └──────────────────────────────────────────────────────────────────────┘
M.specs = {} -- Initialize empty specification table

-- Iterate through each module and aggregate their plugin specifications
for _, module in ipairs(plugin_modules) do
  local module_plugins = safe_require(module)
  
  -- Validate that the module returned a table (expected format)
  if type(module_plugins) == 'table' then
    -- Extend our specs table with plugins from this module
    vim.list_extend(M.specs, module_plugins)
  end
end

-- ┌──────────────────────────────────────────────────────────────────────┐
-- │                          Export Configuration                         │
-- ├──────────────────────────────────────────────────────────────────────┤
-- │ Return the aggregated plugin specifications for lazy.nvim to load.   │
-- │ This table will be imported in init.lua via { import = 'custom.plugins' }
-- └──────────────────────────────────────────────────────────────────────┘
return M.specs