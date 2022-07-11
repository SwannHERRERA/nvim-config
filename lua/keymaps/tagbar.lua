local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Tagbar
keymap("n", "<leader>z", "<cmd>TagbarToggle<cr>", opts)
