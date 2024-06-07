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
				"debugpy"
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
		"iaquobe/true-zen.nvim",
		lazy = false,
		config = function()
			require("true-zen").setup{
				modes = {
					ataraxis = {
						callbacks = {
							open_pos = function ()
								vim.opt.showtabline = 0
								vim.diagnostic.enable(false)
							end,
							close_pos = function ()
								vim.opt.showtabline = 1
							end
						}
					},
					minimalist = {
						callbacks = {
							open_pos = function ()
								vim.opt.showtabline = 0
							end,
							close_pos = function ()
								vim.opt.showtabline = 1
							end
						}
					}
				},
				integrations = {
					twilight = true,
					tmux = true
				}
			}
		end,
	},
	{
		"folke/zen-mode.nvim",
		lazy = false,
		opts = {
			window = {
				backdrop = 1,
			},
			plugins = {
				twilight = { enabled = false },
			}
		}
	},
	{
		"folke/twilight.nvim",
		lazy = false,
		opts = {
		}
	}
	--
	--
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"vim", "lua", "vimdoc",
	--      "html", "css"
	-- 		},
	-- 	},
	-- },
}
