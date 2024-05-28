
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true})
-- vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {expr = true})
-- vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {expr = true})
-- vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {expr = true})


-- vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {expr = true})
-- nnoremap <leader>n :NERDTreeFocus<CR>
-- nnoremap <C-n> :NERDTree<CR>
-- nnoremap <C-t> :NERDTreeToggle<CR>
-- nnoremap <C-f> :NERDTreeFind<CR>

-- Set key mappings for NERDTree
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', { noremap = true, silent = true })
