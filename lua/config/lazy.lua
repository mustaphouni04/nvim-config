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
      ensure_installed = { "lua", "python", "rust", "cpp", "javascript" }, -- Install these parsers
      auto_install = true, -- Automatically install missing parsers
      highlight = { enable = true }, -- Enable syntax highlighting
      indent = { enable = true }, -- Enable indentation
    })
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
})
