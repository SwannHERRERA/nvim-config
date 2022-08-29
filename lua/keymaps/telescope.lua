local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- Telescope
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)
