local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'vimwiki/vimwiki'
  use 'gbprod/nord.nvim'
  use 'mattn/emmet-vim'
  use 'nvim-tree/nvim-tree.lua'
  use 'momota/cisco.vim'
  use 'mechatroner/rainbow_csv'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'direnv/direnv.vim'
  use 'rmehri01/onenord.nvim'
  use 'jidn/vim-dbml'
  use 'tikhomirov/vim-glsl'
  use 'mstuttgart/odoo-snippets'
  use { 'saadparwaiz1/cmp_luasnip' }
  use {
    'L3MON4D3/LuaSnip',
    tag = 'v2.*',  -- Optional: specific version
    run = "make install_jsregexp",  -- Ensures regex compatibility
  }

  use {
    "nvimtools/none-ls.nvim",
    requires = "nvim-lua/plenary.nvim"}
  use{
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup{}
    end}
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",}
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = 'nvim-lua/plenary.nvim'}
  use {'akinsho/bufferline.nvim', tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
