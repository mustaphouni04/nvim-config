local on_attach = require("config.on_attach").on_attach
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.lazy")
require("config.startup")
require("config.theme")
-- require("config.treesitter")
require("config.lsp").setup_all(on_attach)


require("config.cmp")
require("config.settings")
require("config.keymaps")
vim.opt.termguicolors = true
vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

