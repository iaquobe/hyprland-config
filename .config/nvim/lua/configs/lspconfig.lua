-- EXAMPLE 


require("nvchad.configs.lspconfig").defaults()


local util = require "lspconfig.util"

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			completion = {
				snippets = false,  -- Disable snippets if you don't need them
			},
		},
	},
})

vim.lsp.config("tinymist", {
    settings = {
        formatterMode = "typstyle",
        exportPdf = "onSave",
        semanticTokens = "disable"
    }
})

-- vim.lsp.config("pyright",{
-- 	filetypes = {"python"},
--   root_dir = util.root_pattern(".git", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyproject.toml"),
-- })

vim.lsp.config("texlab", {
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
})

vim.lsp.config("ltex", {
	filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "html", "xhtml", "mail", "text", "typst" },
})

local servers = { "html", "css", "pyright", "texlab", "texlab", "tinymist", "rust_analyzer", "clangd", "r_language_server"}
vim.lsp.enable(servers)


