require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePost", {
  pattern = "*.md",
  callback = function(args)
    local type = vim.fn.fnamemodify(args.file, ":t")  -- extract file name
    local filename = vim.fn.fnamemodify(args.file, ":p")  -- extract file name
    local basename = vim.fn.fnamemodify(args.file, ":p:r")  -- strip extension
    local cmd = ""

    if type == "slides.md" then
      -- Use beamer for slides.md
      cmd = string.format("pandoc %s -t beamer -V theme:metropolis --highlight-style=zenburn --template zenburn --slide-level 2 -o %s.pdf --citeproc &", filename, basename)
    else
      -- Use eisvogel for other Markdown files
      cmd = string.format("pandoc %s -o %s.pdf --template eisvogel --listings --citeproc &", filename, basename)
    end

    vim.fn.jobstart(cmd, { detach = true })
  end,
})

autocmd("BufEnter", {
	pattern = "term://*",
	command = "startinsert"
})

autocmd({"BufReadPost", "FileReadPost"}, {
  pattern = "*",
  callback = function()
    vim.schedule(function()
      vim.cmd("normal! zR")
    end)
  end,
})

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.shellcmdflag = "-ic"
vim.opt.formatoptions:remove({ "r", "o" })
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

vim.g.loaded_python3_provider = nil

vim.cmd([[
	hi link DapUINormal Normal
	hi link DapUIVariable Normal
	hi link DapUIScope String
	hi link DapUIType Number
	hi link DapUIValue Normal
	hi link DapUIModifiedValue String
	hi link DapUIDecoration String
	hi link DapUIThread Include
	hi link DapUIStoppedThread String
	hi link DapUIFrameName Normal
	hi link DapUISource Number
	hi link DapUILineNumber String
	hi link DapUIFloatNormal NormalFloat
	hi link DapUIFloatBorder String
	hi link DapUIWatchesEmpty Type
	hi link DapUIWatchesValue Include
	hi link DapUIWatchesError Type
	hi link DapUIBreakpointsPath String
	hi link DapUIBreakpointsInfo Include
	hi link DapUIBreakpointsCurrentLine Include
	hi link DapUIBreakpointsLine DapUILineNumber
	hi link DapUIBreakpointsDisabledLine Comment
	hi link DapUICurrentFrameName DapUIBreakpointsCurrentLine
	hi link DapUIStepOver String
	hi link DapUIStepInto String
	hi link DapUIStepBack String
	hi link DapUIStepOut  String
	hi link DapUIStop Type
	hi link DapUIPlayPause Include
	hi link DapUIRestart Include
	hi link DapUIUnavailable Comment
	hi link DapUIWinSelect String
	hi link DapUIEndofBuffer EndofBuffer
]])

