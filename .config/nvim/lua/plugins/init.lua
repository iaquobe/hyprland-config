return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		config = function()
			require "configs.conform"
		end,
	},

	-- {
	-- 	"AvengeMedia/base46",
	-- 	lazy = true,
	-- 	opts = {},
	-- },


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
				"rust-analyzer",
				"tiny",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require "configs.lspconfig"
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		opts = {
		}
	},

	{
		"mfussenegger/nvim-dap",
	},
	-- Tree-sitter is required. Install parsers for languages in kernel_map.
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			ts.setup({ install_dir = vim.fn.stdpath("data") .. "/site" })
			ts.install({ "python", "r", "lua" })
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
		'stevearc/oil.nvim',
		lazy = false,
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{

		'nvim-treesitter/nvim-treesitter',
		branch = 'main',
		build = ':TSUpdate',
		event = { 'BufReadPost', 'BufNewFile' },
		-- dependencies = {'nvim-treesitter/nvim-treesitter-textobjects'},
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
		-- config = function(_, opts)
		-- 	require('nvim-treesitter.configs').setup(opts)
		-- end,
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
	},


	-- Python
	{
		"sheng-tse/jupynvim",
		cmd = {
			"JupynvimOpen",
		},
		build = function(plugin)
			local install = loadfile(plugin.dir .. "/lua/jupynvim/install.lua")()
			install.run(plugin)
		end,
		config = function()
			require("jupynvim").setup({
				log_level = "info",
				image_renderer = "kitty",  -- "placeholder", "kitty", or "chafa"
			})
		end,
	},

	-- {
	-- 	"mfussenegger/nvim-dap-python",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"rcarriga/nvim-dap-ui"
	-- 	},
	-- 	ft = "python",
	-- 	config = function()
	-- 		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
	-- 		local conda_prefix = vim.env.CONDA_PREFIX
	-- 		if conda_prefix then
	-- 			path = conda_prefix .. "/bin/python"
	-- 		end
	-- 		require"dap-python".setup(path)
	-- 	end,
	-- },
	-- {
	-- 	"quarto-dev/quarto-nvim",
	-- 	ft = {"quarto", "markdown"},
	-- 	dependencies = {
	-- 		"jmbuhr/otter.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	config = function()
	-- 		local runner = require("quarto.runner")
	-- 		vim.keymap.set("n", "<localleader>rc", runner.run_cell,  { desc = "run cell", silent = true })
	-- 		vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
	-- 		vim.keymap.set("n", "<localleader>rA", runner.run_all,   { desc = "run all cells", silent = true })
	-- 		vim.keymap.set("n", "<localleader>rl", runner.run_line,  { desc = "run line", silent = true })
	-- 		vim.keymap.set("v", "<localleader>r",  runner.run_range, { desc = "run visual range", silent = true })
	-- 		vim.keymap.set("n", "<localleader>RA", function()
	-- 			runner.run_all(true)
	-- 		end, { desc = "run all cells of all languages", silent = true })
	-- 	end,
	-- 	lazy = false,
	-- },
	--
	-- {
	-- 	"GCBallesteros/jupytext.nvim",
	-- 	config = function()
	-- 		require("jupytext").setup({
	-- 				style = "markdown",
	-- 				output_extension = "md",
	-- 				force_ft = "markdown"})
	-- 	end,
	-- 	lazy = false,
	-- },
	--
	{
		"matarina/pyrola.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = {
			"Pyrola",
		},
		config = function()
			local pyrola = require("pyrola")

			pyrola.setup({
				kernel_map = {
				},
				split_horizontal = false,
				split_ratio = 0.65,
				image = {
					cell_width = 10,
					cell_height = 20,
					max_width_ratio = 0.5,
					max_height_ratio = 0.5,
					offset_row = 0,
					offset_col = 0,
					protocol = "auto", -- auto | kitty | iterm2 | none
				},
			})

			-- Keybindings
			vim.keymap.set("n", "<CR>", pyrola.send_statement_definition, { noremap = true })
			vim.keymap.set("v", "<leader>vs", pyrola.send_visual_to_repl, { noremap = true })
			vim.keymap.set("n", "<leader>vb", pyrola.send_buffer_to_repl, { noremap = true })
			vim.keymap.set("n", "<leader>is", pyrola.inspect, { noremap = true })
			vim.keymap.set("n", "<leader>ig", pyrola.show_globals, { noremap = true })
			vim.keymap.set("n", "<leader>ik", pyrola.interrupt_kernel, { noremap = true })
			vim.keymap.set("n", "<leader>im", pyrola.open_history_manager, { noremap = true })
		end,
	},


	-- {
	-- 	"benlubas/molten-nvim",
	-- 	dependencies = {
	-- 		"quarto-dev/quarto-nvim",
	-- 		"GCBallesteros/jupytext.nvim",
	-- 	},
	-- 	version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
	-- 	build = ":UpdateRemotePlugins",
	-- 	lazy = false,
	-- 	init = function()
	-- 		vim.g.molten_output_win_max_height = 12
	-- 		vim.g.molten_auto_open_output = true
	-- 		vim.g.molten_image_location	 = "float"
	-- 		vim.g.molten_image_provider = "image.nvim"
	-- 		vim.g.molten_wrap_output = true
	-- 		vim.g.molten_virt_text_output = true
	-- 		vim.g.molten_virt_lines_off_by_1 = true
	--
	-- 		vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
	-- 		vim.keymap.set("n", "<leader>os", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true })
	-- 		vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
	-- 		vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", { desc = "execute visual selection", silent = true })
	-- 		vim.keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
	-- 		vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })
	-- 		vim.keymap.set("n", "<leader>mx", ":MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })
	-- 	end,
	-- },
	--
	--

	-- {
	-- 	"epwalsh/obsidian.nvim",
	-- 	version = "*",  -- recommended, use latest release instead of latest commit
	-- 	lazy = true,
	-- 	ft = "markdown",
	-- 	dependencies = {
	-- 		-- Required.
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	opts = {
	-- 		workspaces = {
	-- 			{
	-- 				name = "personal",
	-- 				path = "~/vaults/personal",
	-- 			},
	-- 			{
	-- 				name = "work",
	-- 				path = "~/vaults/work",
	-- 			},
	-- 		},
	-- 	},
	-- }
}
