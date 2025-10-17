local on_attach = require("config.on_attach").on_attach
require("config.lazy")
require("config.theme")
-- require("config.treesitter")
require("config.lsp").setup_all(on_attach)


require("config.cmp")
require("config.settings")
require("config.keymaps")
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
vim.cmd("colorscheme miasma")

