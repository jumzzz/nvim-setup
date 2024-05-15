-- ~/.config/nvim/lua/plugins.lua
vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')

" LSP Configurations
Plug 'neovim/nvim-lspconfig'
Plug 'ajmwagar/vim-deus'

" lualine
Plug 'nvim-lualine/lualine.nvim'

" Compe
Plug 'hrsh7th/nvim-compe'

call plug#end()
]]

