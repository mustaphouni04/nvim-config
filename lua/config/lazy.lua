local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Theme
  { "xero/miasma.nvim", priority = 2000, lazy=false, config=function() vim.cmd("colorscheme miasma") end }, 
  {"folke/tokyonight.nvim", lazy = false, priority = 1000,opts = {},},
  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Code Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },

  -- Treesitter
  {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "rust", "cpp", "javascript", "bash", "json", "markdown", "yaml", "vim" }, -- Install these parsers
      auto_install = true, -- Automatically install missing parsers
      highlight = { enable = true,
                    additional_vim_regex_highlighting = false,}, -- Enable syntax highlighting
      indent = { enable = true }, -- Enable indentation
    })
  end
},
  {
  "akinsho/bufferline.nvim",
  version = "*", -- latest stable
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup {
      options = {
        numbers = "ordinal",
        close_command = "bdelete! %d",       -- close buffer
        right_mouse_command = "bdelete! %d",
        left_trunc_marker = "",
        right_trunc_marker = "",
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
        enforce_regular_tabs = true,
        always_show_bufferline = true,
      }
    }
  end
},
  -- Status Line
  { "nvim-lualine/lualine.nvim" },

  -- File Explorer
    {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      hijack_netrw = true,    -- Replaces netrw for better file navigation
      update_cwd = true,      -- Keep tree in sync with the current directory
      view = {
        width = 35,           -- Adjust the width of the file tree
        side = "left",        -- Position tree on the left
      }
    })

    -- Automatically open Nvim Tree when starting Neovim
    local function open_nvim_tree()
      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end
    },

    {
  "ray-x/lsp_signature.nvim",
  config = function()
    require("lsp_signature").setup({
      bind = true,              -- automatically bind to LSP
      floating_window = true,   -- show docs in a floating window
      hint_enable = true,       -- show parameter hints
      hint_prefix = " ",       -- nice icon
      hint_scheme = "String",
      timer_interval = 200,     -- ms to wait before showing hint
      toggle_key = nil,         -- optional key to toggle hints
    })
  end
    },
  -- Telescope (Fuzzy Finder)
    {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({})

    -- Keybindings for easy access
    local keymap = vim.keymap.set
    keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
    keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find Help" })
  end
    },
    -- Jupyter Extension for NeoVim (Molten)
    {"benlubas/molten-nvim",
        version = "^1.0.0",
        build = ":UpdateRemotePlugins",
        init = function()
            vim.g.molten_output_win_max_height = 20 
        end,
    },
})
