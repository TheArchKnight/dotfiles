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
   --Load values before plugins
   vim.g.jukit_mappings_ext_enabled = { "py", "ipynb" }

   use 'wbthomason/packer.nvim'
   use 'vimwiki/vimwiki'
   use 'navarasu/onedark.nvim'
   use 'mattn/emmet-vim'
   use 'nvim-tree/nvim-tree.lua'
   use 'nvim-tree/nvim-web-devicons'
   use 'nvim-lualine/lualine.nvim'
   use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
   use 'nvim-treesitter/nvim-treesitter'
   use 'hrsh7th/nvim-cmp'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'jcorbin/vim-lobster'
   use 'L3MON4D3/LuaSnip'
   use 'luk400/vim-jukit'
   use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
   }  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
   }

   use {'kenn7/vim-arsync',
    requires = {
        {'prabirshrestha/async.vim'}
    }
}

use {
  "rest-nvim/rest.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        -- show the generated curl command in case you want to launch
        -- the same request via the terminal (can be verbose)
        show_curl_command = false,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })
  end
}


   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   if packer_bootstrap then
      require('packer').sync()
   end
end)
