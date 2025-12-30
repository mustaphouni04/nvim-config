# Neovim Configuration

A minimal, fast, and practical Neovim setup focused on:
- clean UI
- readable code (no visual noise)
- sane startup behavior
- LSP + Treesitter done right
- modern completion with subtle inline suggestions

---

## ✨ Features

### 🎨 UI & Theme
- **Kanagawa (dragon)** colorscheme  
  Muted, low-noise, excellent contrast for long coding sessions.
- Bufferline for open buffers
- Lualine statusline
- Floating terminal support

### 🧠 Smart Startup Behavior

The startup logic is context-aware:

| Command     | Behavior |
|------------|----------|
| `nvim`     | Opens a clean dashboard with recent files & actions |
| `nvim .`   | Opens the **last edited file** (with syntax + LSP restored) |
| `nvim file`| Opens the file normally |


### 📂 Dashboard (mini.starter)
Shown **only** on plain `nvim`:
- Recent files
- Built-in actions
- Telescope integration

### ✍️ Completion
- `nvim-cmp` with LSP, buffer, and path sources
- **Inline ghost text suggestions** in subtle grey
- Bordered completion and documentation windows

### 🌳 Syntax Highlighting
- Treesitter-based highlighting
- Automatic parser installation
- Correctly re-attached even when files are opened manually on startup

### 🔌 LSP
- Mason + lspconfig
- Preconfigured for:
  - Python (`pyright`)
  - C/C++ (`clangd`)
  - Rust (`rust_analyzer`)
  - Lua (`lua_ls`)
- Clean `on_attach` keybindings

### 🖥️ Integrated Terminal
- Floating terminal via ToggleTerm
- Toggle with `<leader>t`
- Closes cleanly on exit (`exit`)

---

## ⌨️ Keybindings

### General
| Key | Action |
|---|---|
| `<leader>e` | Toggle file tree |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep |
| `<leader>fb` | Open buffers |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `<leader>bd` | Delete buffer |
| `<leader>t` | Toggle floating terminal |

### LSP
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `K` | Hover docs |
| `gr` | References |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |

---

## 📁 Directory Structure
.
├── init.lua
├── lazy-lock.json
└── lua
└── config
├── cmp.lua
├── dashboard.lua
├── keymaps.lua
├── lazy.lua
├── lsp.lua
├── on_attach.lua
├── settings.lua
├── startup.lua
├── theme.lua
└── treesitter.lua

---

## 🚀 Plugin Manager

- **lazy.nvim**
  - Fast startup
  - Explicit loading rules
  - No hidden side effects

---

## 🔧 Requirements

- Neovim ≥ **0.9**
- Git
- A Nerd Font (for icons)
- Treesitter CLI (optional but recommended)

---

