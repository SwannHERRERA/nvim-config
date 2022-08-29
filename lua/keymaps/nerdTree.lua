local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Tagbar
keymap("n", "<leader>n", "<cmd>NERDTreeToggle<cr>", opts)
keymap("n", "<C-f>", "<cmd>NERDTreeFind<cr>", opts)
