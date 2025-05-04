require "nvchad.mappings"

-- Create a global variable to keep track of diagnostics state
-- if vim.g.diagnostics_active == nil then
--   vim.g.diagnostics_active = true
-- end

-- Function to toggle diagnostics
-- function _G.toggle_diagnostics()
--   vim.g.diagnostics_active = not vim.g.diagnostics_active
--   if vim.g.diagnostics_active then
--     vim.diagnostic.enable()
--     print("Diagnostics enabled")
--   else
--     vim.diagnostic.enable(false)
--     print("Diagnostics disabled")
--   end
-- end
--
-- local cmp = require "cmp"
-- local cmp_enabled = true
--
-- function ToggleCmp()
--   if cmp_enabled then
--     vim.diagnostic.enable(false)
--     cmp.setup({ enabled = false })
--   else
--     vim.diagnostic.enable()
--     cmp.setup({ enabled = true })
--   end
--   cmp_enabled = not cmp_enabled
-- end

local map = vim.keymap.set

-- navigation with tmux
map("n", "<C-h>"			,"<cmd> NvimTmuxNavigateLeft<CR>"             , { desc="window left" })
map("n", "<C-l>"    	,"<cmd> NvimTmuxNavigateRight<CR>"            , { desc="window right" })
map("n","<C-j>"     	,"<cmd> NvimTmuxNavigateDown<CR>"             , { desc="window down" })
map("n","<C-k>"     	,"<cmd> NvimTmuxNavigateUp<CR>"               , { desc="window up" })
map("t", "<C-h>"			,"<cmd> NvimTmuxNavigateLeft<CR>"             , { desc="window left" })
map("t", "<C-l>"    	,"<cmd> NvimTmuxNavigateRight<CR>"            , { desc="window right" })
map("t","<C-j>"     	,"<cmd> NvimTmuxNavigateDown<CR>"             , { desc="window down" })
map("t","<C-k>"     	,"<cmd> NvimTmuxNavigateUp<CR>"               , { desc="window up" })

map("n","<leader>dt"	, ':lua ToggleCmp()<CR>'												, { desc="toggle diagnostics" })
map("n","<Leader>go"	,"<cmd> DiffviewOpen<CR>"                     , { desc="git diff open" })
map("n","<Leader>gc"	,"<cmd> DiffviewClose<CR>"                    , { desc="git diff close" })
map("n","<Leader>z" 	,"<cmd> TZAtaraxis <CR>"                      , { desc="enter zen mode" })
map("n","<C-p>"     	,"<cmd> lua vim.diagnostic.goto_prev() <CR>"  , { desc="prev diagnostic" })
map("n","<C-n>"     	,"<cmd> lua vim.diagnostic.goto_next() <CR>"  , { desc="next diagnostic" })
map("n","<M-n>"     	,"<cmd> NvimTreeToggle <CR>"                  , { desc="toggle nvimtree" })
map("n","<Leader>fj"	,"<cmd> Telescope jumplist <CR>"              , { desc="Find jumps"})
map("n","<Leader>fd"	,"<cmd> Telescope lsp_document_symbols <CR>"  , { desc="telescope lsp symbols document"})
map("n","<Leader>fp"	,"<cmd> Telescope lsp_dynamic_workspace_symbols <CR>" , { desc="telescope lsp symbols workspace"})
map("n", "<leader>b"	,
  function()
    require("nvchad.tabufline").prev()
  end,
  {desc="Goto next buffer"})
map("n", "<leader>n",
  function()
    require("nvchad.tabufline").next()
  end,
  {desc="Goto prev buffer"})

map("v", ">", ">gv", {desc="indent"})
map("v", "<", "<gv", {desc="indent"})


local nomap = vim.keymap.del

nomap("n", "<tab>")
nomap("n", "<S-tab>")

-- debugging
map("n", "<leader>db", '<cmd> DapToggleBreakpoint <CR>', { desc="toggle breakpoint"})
map("n", "<leader>dc", '<cmd> DapContinue <CR>', { desc="debug continue"})
map("n", "<leader>ds", '<cmd> DapStepInto <CR>', { desc="debug step into"})
map("n", "<leader>dn", '<cmd> DapStepOver <CR>', { desc="debug step over"})

