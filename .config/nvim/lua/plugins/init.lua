return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		config = function()
			require "configs.conform"
		end,
	},


	{
		"alexghergh/nvim-tmux-navigation",
		lazy = false,
		config = function()

			local nvim_tmux_nav = require('nvim-tmux-navigation')

			nvim_tmux_nav.setup {
				disable_when_zoomed = true -- defaults to false
			}

			vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
			vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
			vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"html-lsp",
				"css-lsp" ,
				"prettier",
				"pyright",
				"debugpy",
				"clangd",
				"rust-analyzer"
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require "configs.lspconfig"
		end,
	},

	{
		"mfussenegger/nvim-dap",
	},
	{
		"quarto-dev/quarto-nvim",
		ft = {"quarto", "markdown"},
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			local runner = require("quarto.runner")
			vim.keymap.set("n", "<localleader>rc", runner.run_cell,  { desc = "run cell", silent = true })
			vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
			vim.keymap.set("n", "<localleader>rA", runner.run_all,   { desc = "run all cells", silent = true })
			vim.keymap.set("n", "<localleader>rl", runner.run_line,  { desc = "run line", silent = true })
			vim.keymap.set("v", "<localleader>r",  runner.run_range, { desc = "run visual range", silent = true })
			vim.keymap.set("n", "<localleader>RA", function()
				runner.run_all(true)
			end, { desc = "run all cells of all languages", silent = true })
		end,
		lazy = false,
	},
	{
		"GCBallesteros/jupytext.nvim",
		config = function()
			require("jupytext").setup({
					style = "markdown",
					output_extension = "md",
					force_ft = "markdown"})
		end,
		lazy = false,
	},
	{
		"benlubas/molten-nvim",
		dependencies = {
			"quarto-dev/quarto-nvim",
			"GCBallesteros/jupytext.nvim",
		},
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		build = ":UpdateRemotePlugins",
		lazy = false,
		init = function()
			vim.g.molten_output_win_max_height = 12
			vim.g.molten_auto_open_output = true
			vim.g.molten_image_location	 = "float"
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_wrap_output = true
			vim.g.molten_virt_text_output = true
			vim.g.molten_virt_lines_off_by_1 = true

			vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
			vim.keymap.set("n", "<leader>os", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true })
			vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
			vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true })
			vim.keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
			vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })
			vim.keymap.set("n", "<leader>mx", ":MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })
		end,
	},
	{
		"3rd/image.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("image").setup({
				-- optional configuration
				backend = "kitty", -- or "wezterm", or "ueberzug"
				integrations = {
					markdown = {
						enabled = true,
					},
				},
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui"
		},
		ft = "python",
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			local conda_prefix = vim.env.CONDA_PREFIX
			if conda_prefix then
				path = conda_prefix .. "/bin/python"
			end
			require"dap-python".setup(path)
		end,
	},
	{
		'stevearc/oil.nvim',
		lazy = false,
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			require('nvim-treesitter.configs').setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
							["if"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },
						},
					},
				}})
		end,
	},
	{

		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = {'nvim-treesitter/nvim-treesitter-textobjects'},
		opts = {
			ensure_installed = {
				'lua',
				'python',
				'bash',
				'json',
				'yaml',
				'html',
				'css',
				'javascript',
				'tsx',
				'markdown',
				'markdown_inline',
				'vim',
				'query',
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<C-Space>',
					node_incremental = '<C-Space>',
					node_decremental = '<BS>',
				},
			},
		},
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)

		end,
	},
	{
		'nvim-treesitter/playground',
		cmd = 'TSPlaygroundToggle',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function()
			vim.cmd("TSPlaygroundToggle")
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
		config = function ()
			require'treesitter-context'.setup{
				enable = true,
				max_lines = 0,
				min_window_height = 0,
				line_numbers = true,
				multiline_threshold = 20,
				trim_scope = 'outer',
				mode = 'cursor',
				zindex = 20,
				on_attach = nil,
			}
		end,
	},

	{
		'nvim-flutter/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
		config = true,
	}

}
