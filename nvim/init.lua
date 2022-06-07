local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

require('options');
require('mappings');
require('gui');
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
packer.startup(function()
  local use = use
  use 'nvim-treesitter/nvim-treesitter'
  use 'Shatur/neovim-ayu'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  end
)

require('ayu').setup({
    mirage = true,
    overrides = {},
})
require('ayu').colorscheme()
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  }
}
require('nvim-tree').setup{}
