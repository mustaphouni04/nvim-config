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
  { "xero/miasma.nvim", priority = 1000, lazy=false, config=function() vim.cmd("colorscheme miasma") end },
  
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
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
   {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup()
  end
},
  -- Status Line
  { "nvim-lualine/lualine.nvim" },

  -- File Explorer
  { "nvim-tree/nvim-tree.lua" },

  -- Telescope (Fuzzy Finder)
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
})
