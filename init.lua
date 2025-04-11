require("config.lazy") 
require("config.theme")
-- require("config.treesitter")
require("config.lsp")
require("config.cmp")
require("config.settings")
require("config.keymaps")
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
vim.cmd("colorscheme tokyonight-day")
