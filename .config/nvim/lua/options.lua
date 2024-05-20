require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWritePost", {
  pattern = "*.md",
  command = "silent !pandoc % -o %:r.pdf &",
})


vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.shellcmdflag = "-ic"

vim.g.loaded_python3_provider = nil
