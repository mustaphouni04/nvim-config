vim.g.mapleader = " "
vim.opt.splitright = true

local keymap = vim.keymap.set
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files" })
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live Grep" })

local opts = { noremap = true, silent = true }

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "gm", function()
  local word = vim.fn.expand("<cword>")
  vim.fn.setreg("/", "\\<" .. word .. "\\>") -- search exact word
  vim.opt.hlsearch = true                   -- highlight matches
  vim.cmd("normal! n")                      -- jump to first match
end, { desc = "Find all occurrences of word under cursor" })

keymap({ "n", "v" }, "<Space>", ":noh<CR>", { silent = true, desc = "Clear search highlight" })

keymap("n", "<S-l>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })
keymap("n", "<leader>bd", ":bd<CR>", { silent = true, desc = "Delete buffer" })

keymap("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find Buffers" })

keymap("n", "<leader>v", ":vsplit ", { desc = "Vertical split file" })

vim.keymap.set("n", "X", ":wa! | qa!<CR>", { desc = "Force write all and quit" })


vim.keymap.set("n", "<C-_>", function()
  local line = vim.api.nvim_get_current_line()
  if line:match("^%s*#") then
    -- remove leading #
    line = line:gsub("^(%s*)#", "%1")
  else
    -- add #
    line = "#" .. line
  end
  vim.api.nvim_set_current_line(line)
end, { desc = "Toggle # comment on line" })
