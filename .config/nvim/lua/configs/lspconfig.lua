-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
}

lspconfig.pyright.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {"python"},
})

lspconfig.texlab.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		texlab = {
			build = {
				onSave = true,
			},
		},
	},
}
