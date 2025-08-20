# Neovim Documentation Standards

> Best practices for documenting Neovim configurations based on official standards

## Overview

This document outlines the documentation standards implemented in this Neovim configuration, following research into Neovim core documentation practices and community conventions.

## Documentation Types

### 1. Standard Neovim Help Format

**Location**: `doc/nvim-config.txt`

Following official Vim help format conventions:
- **File Structure**: Plain text with specific formatting rules
- **Tag System**: Tags marked with `*tag-name*` for cross-referencing
- **Sections**: Clear hierarchical structure with consistent formatting
- **Cross-References**: Using `|tag-name|` for internal links
- **Code Examples**: Indented with `>` markers for language highlighting

**Key Conventions**:
```vim
*tag-name*                    Right-aligned tags at column 78
SECTION HEADERS               All caps for main sections
|cross-reference|             Pipe symbols for links
>lua                         Language markers for code blocks
    code here
<
```

**Access Methods**:
- `:help nvim-config` - Main documentation
- `:help nvim-config-contents` - Table of contents
- `:help nvim-config-[section]` - Specific sections
- Search with `:helpgrep pattern`

### 2. GitHub-Friendly Markdown

**Files**: README.md, INDEX.md, ONBOARDING.md, API.md

**Purpose**: Web-based documentation for GitHub and external viewers

**Standards**:
- **Headers**: Hierarchical with emoji indicators
- **Tables**: Pipe-delimited for compatibility
- **Code Blocks**: Triple backticks with language hints
- **Links**: Standard markdown format
- **Images**: Support for screenshots and diagrams

### 3. AI-Optimized Documentation

**File**: CLAUDE.md

**Purpose**: Structured information for AI assistants

**Key Elements**:
- Clear architectural descriptions
- Specific line number references
- Critical implementation details
- Command examples
- Language-specific configurations

## Documentation Hierarchy

```
1. README.md           - Entry point for new users
2. ONBOARDING.md      - Progressive learning path
3. INDEX.md           - Master reference hub
4. doc/nvim-config.txt - In-editor help system
5. API.md             - Technical specifications
6. KEYBINDINGS.md     - Quick reference
7. CLAUDE.md          - AI assistant guide
8. LICENSE.md         - Legal information
```

## Best Practices Implemented

### From Neovim Core

1. **Help File Integration**
   - Proper tag generation with `:helptags`
   - Consistent tag naming: `plugin-feature-subsection`
   - Right-aligned tags at column 78
   - Clear section hierarchy

2. **Cross-Referencing**
   - Every major feature has a help tag
   - Consistent naming patterns
   - Bidirectional links where appropriate

3. **Code Documentation**
   - Clear examples with proper indentation
   - Language-specific highlighting markers
   - Before/after comparisons for configurations

### From Kickstart.nvim

1. **Inline Comments**
   - Explanatory comments for complex configurations
   - References to documentation sections
   - Links to external resources

2. **Progressive Disclosure**
   - Basic information first
   - Advanced topics clearly marked
   - Optional features documented separately

### Custom Enhancements

1. **Multi-Format Support**
   - Markdown for web viewing
   - Vim help for in-editor access
   - Structured format for AI parsing

2. **Visual Organization**
   - Emoji indicators for quick scanning
   - Box-drawing characters for structure
   - Consistent color coding in examples

3. **Interactive Elements**
   - Command examples that can be executed
   - Checkboxes for progress tracking
   - Quick reference cards

## Maintenance Guidelines

### When Adding Features

1. **Update Help File** (`doc/nvim-config.txt`)
   - Add new tags for features
   - Update relevant sections
   - Regenerate tags file

2. **Update Markdown Docs**
   - README.md for major features
   - API.md for technical details
   - INDEX.md for cross-references

3. **Version Tracking**
   - Document breaking changes
   - Update version information
   - Maintain changelog if applicable

### Documentation Testing

```vim
" Verify help tags are working
:help nvim-config
:help nvim-config-contents

" Check for broken links
:helpgrep "see |.*|"

" Validate all tags exist
:helptags doc/
```

## File Structure

```
~/.config/nvim/
├── doc/
│   ├── nvim-config.txt    # Standard help file
│   ├── tags               # Generated tags file
│   └── kickstart.txt      # Original kickstart help
├── README.md              # GitHub overview
├── INDEX.md               # Master reference
├── ONBOARDING.md          # Learning guide
├── API.md                 # Technical API
├── KEYBINDINGS.md         # Shortcuts reference
├── CLAUDE.md              # AI assistant guide
├── LICENSE.md             # MIT License
└── DOCUMENTATION_STANDARDS.md  # This file
```

## Tag Naming Conventions

Following Neovim standards:
- `nvim-config-*` - Main plugin namespace
- `nvim-config-feature` - Feature documentation
- `nvim-config-feature-detail` - Subsections
- `nvim-config-api-function` - API references

## Tools and Commands

### Generating Help Tags
```vim
:helptags doc/
" Or from shell:
nvim -c "helptags doc/" -c "qa"
```

### Checking Documentation
```vim
:checkhealth
:help local-additions
:help nvim-config
```

### Searching Documentation
```vim
:helpgrep pattern
:Telescope help_tags
<leader>sh
```

## References

- [Neovim Help Writing](https://neovim.io/doc/user/helphelp.html)
- [Vim Documentation Guide](https://github.com/nanotee/nvim-lua-guide)
- [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- Neovim core documentation standards (via Context7 research)

---

*This document establishes the documentation standards for this Neovim configuration, ensuring consistency, accessibility, and maintainability across all documentation formats.*