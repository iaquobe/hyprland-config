require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<C-h>"    ,"<cmd> NvimTmuxNavigateLeft<CR>"           , { desc="window left" })
map("n", "<C-l>"    ,"<cmd> NvimTmuxNavigateRight<CR>"          , { desc="window right" })
map("n","<C-j>"     ,"<cmd> NvimTmuxNavigateDown<CR>"           , { desc="window down" })
map("n","<C-k>"     ,"<cmd> NvimTmuxNavigateUp<CR>"             , { desc="window up" })
map("n","<Leader>go","<cmd> DiffviewOpen<CR>"                   , { desc="git diff open" })
map("n","<Leader>gc","<cmd> DiffviewClose<CR>"                  , { desc="git diff close" })
map("n","<Leader>z" ,"<cmd> ZenMode<CR>"                        , { desc="enter zen mode" })
map("n","<C-p>"     ,"<cmd> lua vim.diagnostic.goto_prev() <CR>", { desc="prev diagnostic" })
map("n","<C-n>"     ,"<cmd> lua vim.diagnostic.goto_next() <CR>", { desc="next diagnostic" })
map("n","<M-n>"     ,"<cmd> NvimTreeToggle <CR>"                , { desc="toggle nvimtree" })
map("n","<Leader>fj","<cmd> Telescope jumplist <CR>"            , { desc="Find jumps"})
map("n", "<leader>b",
  function()
    require("nvchad.tabufline").tabuflinePrev()
  end,
  {desc="Goto next buffer"})
map("n", "<leader>n",
  function()
    require("nvchad.tabufline").tabuflineNext()
  end, 
  {desc="Goto prev buffer"})

map("v", ">", ">gv", {desc="indent"})


local nomap = vim.keymap.del

nomap("n", "<tab>")
nomap("n", "<S-tab>")
