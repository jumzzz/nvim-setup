local nvim_lsp = require('lspconfig')

nvim_lsp.pyright.setup{}
nvim_lsp.rust_analyzer.setup{
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
nvim_lsp.clangd.setup{}

-- For Zig
nvim_lsp.zls.setup{}

