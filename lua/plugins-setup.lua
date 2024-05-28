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

" DAP (Debug Adapter Protocol)
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'preservim/nerdtree'

" Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


call plug#end()
]]

