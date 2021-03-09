--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Icon support --
  use 'kyazdani42/nvim-web-devicons'

  -- File explorer --
  use 'justinmk/vim-dirvish'
  --use {'kyazdani42/nvim-tree.lua'} -- Doesn't support Windows yet

  -- Smooth Scrolling --
  use 'psliwka/vim-smoothie'

  -- Scrollbar --
  use 'dstein64/nvim-scrollview'

  -- Better start screen --
  use {'ndavidq0/vim-startify', branch = 'fix_center'}

  -- Indentation --
  use 'tpope/vim-sleuth'

  -- Auto comment --
  use 'preservim/nerdcommenter'

  -- Better escape --
  use 'jdhao/better-escape.vim'

  -- Fold text --
  use 'pseewald/vim-anyfold'

  -- Surround text --
  use 'tpope/vim-surround'

  -- Complete brackets --
  use 'jiangmiao/auto-pairs'

  -- RFC --
  use 'mhinz/vim-rfc'

  -- Cheat.sh --
  use 'dbeniamine/cheat.sh-vim'

  -- Md previewer --
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

  -- Git --
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- Sql.nvim --
  use 'tami5/sql.nvim'

  -- Lua Scratchpad --
  use 'rafcamlet/nvim-luapad'

  -- Telescope --
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-telescope/telescope-frecency.nvim'

  -- Treesitter --
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'

  -- Snippets --
  use 'Shougo/neosnippet.vim'
  use 'Shougo/neosnippet-snippets'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- LSP --
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'mfussenegger/nvim-jdtls'

  -- View tags --
  use 'liuchengxu/vista.vim'

  -- Colorschemes --
  use 'tjdevries/gruvbuddy.nvim'
  use 'tjdevries/colorbuddy.nvim'
  use 'tomasiser/vim-code-dark'
  use 'chriskempson/base16-vim'
  use 'morhetz/gruvbox'
  use 'sainnhe/gruvbox-material'
  use 'lifepillar/vim-solarized8'
  use 'phanviet/vim-monokai-pro'
  use 'ajmwagar/vim-deus'
  use 'joshdick/onedark.vim'
  use 'sainnhe/sonokai'
  use 'jacoborus/tender.vim'
  use 'glepnir/oceanic-material'
  use 'KeitaNakamura/neodark.vim'
  use 'ackyshake/Spacegray.vim'
  use {'dracula/vim', as = 'dracula'}

end)
