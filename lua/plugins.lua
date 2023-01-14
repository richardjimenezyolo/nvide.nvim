local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use { "catppuccin/nvim", as = "catppuccin" }
  use 'ntk148v/vim-horizon'
  use 'navarasu/onedark.nvim'
  use({ 'rose-pine/neovim', as = 'rose-pine', })
  use 'morhetz/gruvbox'
  use 'NLKNguyen/papercolor-theme'
  use { 'dracula/vim' }

  use({
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  })

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use { 'akinsho/bufferline.nvim', tag = "v3.*" }
  use 'nvim-lualine/lualine.nvim'
  use { 'editorconfig/editorconfig-vim' }
  use { 'tpope/vim-commentary' }

  -- Git
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use { 'tpope/vim-fugitive' }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- Multi-cursos
  use 'mg979/vim-visual-multi'

  use {
    'p00f/nvim-ts-rainbow',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }
  use "lukas-reineke/indent-blankline.nvim"
  use 'j-hui/fidget.nvim'
  use 'mbbill/undotree'
  use 'instant-markdown/vim-instant-markdown'
  use { "klen/nvim-config-local" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
