-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup {
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			completion = {
				snippets = false,  -- Disable snippets if you don't need them
			},
		},
	},
}

lspconfig.tinymist.setup {
    settings = {
        formatterMode = "typstyle",
        exportPdf = "onType",
        semanticTokens = "disable"
    }
}

-- typescript
-- lspconfig.tsserver.setup {
-- 	on_attach = on_attach,
-- 	on_init = on_init,
-- 	capabilities = capabilities,
-- }

lspconfig.pyright.setup({
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {"python"},
  root_dir = lspconfig.util.root_pattern(".git", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyproject.toml"),
})

lspconfig.texlab.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		texlab = {
			build = {
				executable = "latexmk",
        args = {
          "-pdf",          -- Generate PDF
          "-interaction=nonstopmode", -- Keep going even if errors
          "-synctex=1",    -- SyncTeX for forward/inverse search
          "-shell-escape", -- Allow external commands (optional)
          "-bibtex",       -- Run BibTeX
          "%f"             -- Input file
        },
        forwardSearchAfter = true,
				onSave = true,
			},
		},
	},
}

lspconfig.ltex.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	-- filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "html", "xhtml", "mail", "text", "typst" },
}

