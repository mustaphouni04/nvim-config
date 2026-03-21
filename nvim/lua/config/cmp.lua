local cmp = require("cmp")

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- Navigate with arrow keys
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),

    -- Tab to accept completion
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),

    -- Enter to confirm
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})
