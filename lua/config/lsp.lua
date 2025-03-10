-- Load Mason & Mason LSP Config
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "clangd", "rust_analyzer" }
})

-- Import LSP Config
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Function to check if LSP is installed before setting it up
local function setup_lsp(server)
  if not lspconfig[server] then
    print("LSP " .. server .. " not found")
    return
  end
  lspconfig[server].setup({
    capabilities = capabilities
  })
end

-- Setup each LSP (avoid errors if Mason hasn't installed them yet)
for _, server in ipairs({ "pyright", "clangd", "rust_analyzer" }) do
  setup_lsp(server)
end
