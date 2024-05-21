-- ~/.config/nvim/lua/general.lua
vim.g.mapleader = ' '

vim.o.number = true -- Enable line numbers
vim.o.splitright = true
vim.o.relativenumber = false -- Enable relative line numbers
vim.o.background = 'dark' -- or light if you want light mode
vim.cmd('colorscheme deus')
vim.opt.clipboard = "unnamedplus"

-- Python-specific indentation settings
vim.cmd([[
augroup python_indent
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
augroup END
]])
