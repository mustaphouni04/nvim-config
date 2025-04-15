-- Load Mason & Mason LSP Config
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "clangd", "rust_analyzer", "lua_ls" }
})

-- Import LSP Config
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Function to check if LSP is installed before setting it up
local function setup_lsp(server, on_attach)
  if not lspconfig[server] then
    print("LSP " .. server .. " not found")
    return
  end
  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- List of servers
local servers = {"pyright", "clangd", "rust_analyzer", "lua_ls" }

-- Export the setup function
return {
   setup_all = function(on_attach)
     for _, server in ipairs(servers) do
	setup_lsp(server, on_attach)
     end
   end
}

