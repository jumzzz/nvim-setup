vim.api.nvim_set_keymap('n', '<C-.>', ":vertical resize +5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-,>', ":vertical resize -5<CR>", { noremap = true, silent = true })
