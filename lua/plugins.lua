local utils = require("utils")
local fn = vim.fn

vim.g.package_home = fn.stdpath("data") .. "/site/pack/packer/"
local packer_install_dir = vim.g.package_home .. "/opt/packer.nvim"

local packer_repo = "https://github.com/wbthomason/packer.nvim"
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")
local util = require('packer.util')

require("packer").startup({
    function(use)
        use { "ellisonleao/gruvbox.nvim" }
        use { "preservim/tagbar" } 
        use { "preservim/nerdtree" }
        use { "github/copilot.vim" }
        use { "glepnir/dashboard-nvim" }
        use { "junegunn/fzf" }
        use { "tpope/vim-fugitive" }
        use { "tpope/vim-repeat" }
        use { "tpope/vim-surround" }
        use { "tpope/vim-commentary" }
        use { "tpope/vim-rhubarb" }
        use { "tpope/vim-eunuch" }
        use {'jdhao/better-escape.vim', event = 'InsertEnter'}
        use { "vim-airline/vim-airline" }
        use { "vim-airline/vim-airline-themes" }
        use { "neovim/nvim-lspconfig" }
        use { "williamboman/nvim-lsp-installer" }
        use { 'hrsh7th/cmp-nvim-lsp' }
        use { 'hrsh7th/cmp-buffer' }
        use { 'hrsh7th/cmp-path' }
        use { 'hrsh7th/cmp-cmdline' }
        use { 'hrsh7th/nvim-cmp' }
        use { 'andymass/vim-matchup' }
        use { "nvim-treesitter/nvim-treesitter" }
        use { 'simnalamburt/vim-mundo' }
        use { "RishabhRD/popfix" }
        use { "RishabhRD/nvim-lsputils" }
        use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        use { 'nvim-telescope/telescope-media-files.nvim' }
        use {
            'pwntester/octo.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope.nvim',
                'kyazdani42/nvim-web-devicons',
            },
        }
        use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
        use { 'airblade/vim-gitgutter' }
        use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
        use { 'christoomey/vim-tmux-navigator' }
        use { "williamboman/mason.nvim" }
        use { 
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }
        use { "mg979/vim-visual-multi" }
        use { "rafamadriz/friendly-snippets" }
    end,
    config = {
        max_jobs = 16,
        compile_path = util.join_paths(fn.stdpath('data'), 'site', 'lua', 'packer_compiled.lua'),
    },
})

local status, _ = pcall(require, 'packer_compiled')
if not status then
  vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!")
end

-- Import config specfific
require 'keymaps/telescope'
require 'keymaps/tagbar'
