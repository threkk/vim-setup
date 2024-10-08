" .vimrc - Alberto de Murga <alberto@threkk.com>

" Lazy loading
" From https://github.com/junegunn/vim-plug/wiki/faq#conditional-activation
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

let is_vim = !has('nvim')
let is_nvim = has('nvim')

if is_nvim
    let $BASE = stdpath('config')
else
    let $BASE = '$HOME/.vim'
endif

if is_nvim
  call plug#begin($BASE.'/plugged')

    " Basic configuration for client specifics
    Plug 'wincent/terminus'                             " Improves term sup.
    Plug 'tpope/vim-eunuch'                             " Improves unix support 
    Plug 'equalsraf/neovim-gui-shim',                   " Shims for UI config.
    Plug 'nvim-lua/plenary.nvim',                       " Supporting library
    Plug 'nvim-lua/popup.nvim',                         " Supporting library
    Plug 'roxma/vim-paste-easy'                         " Fixes pasting.
    Plug 'ojroques/vim-oscyank'                         " Copy-paste
    Plug 'echasnovski/mini.nvim'                        " Mini

    " Lightline 
    Plug 'itchyny/lightline.vim'                        " Better statusline.

    " Brackets
    Plug 'luochen1990/rainbow'                          " Brackets color.

    " Git  
    Plug 'lewis6991/gitsigns.nvim'                      " Git diff in neovim

    " Comments
    Plug 'tpope/vim-commentary'

    " Search
    Plug 'nvim-telescope/telescope.nvim'                " Moving around in nvim

    " Blocks
    Plug 'lukas-reineke/indent-blankline.nvim'          " Indicates the block line in nvim

    " Debugger
    Plug 'mfussenegger/nvim-dap'                        " Debugger
    Plug 'rcarriga/nvim-dap-ui'                         " Debugger ui

    " Language support
    Plug 'nvim-treesitter/nvim-treesitter'              " Syntax colouring for neovim
    Plug 'neovim/nvim-lspconfig'                        " LSP configuration
    Plug 'hrsh7th/vim-vsnip'                            " Required by nvim-comp
    Plug 'hrsh7th/cmp-vsnip'                            " Required by nvim-comp
    Plug 'sigmasd/deno-nvim'                            " Improves deno support
    Plug 'b0o/schemastore.nvim'                         " Improves JSONLS support
    Plug 'williamboman/mason.nvim'                      " LSP manager
    Plug 'williamboman/mason-lspconfig.nvim'            " Supporting package

    Plug 'mfussenegger/nvim-lint'                       " Linter
    Plug 'mhartington/formatter.nvim'                   " Formatter

    Plug 'rafamadriz/friendly-snippets'                 " Snippets for autocompletion
    Plug 'liuchengxu/vista.vim'                         " Tags
    Plug 'https://tildegit.org/sloum/gemini-vim-syntax' " Gemini syntax highlight 

    " Autcomplete
    Plug 'hrsh7th/nvim-cmp'                             " Autocomplete
    Plug 'hrsh7th/cmp-nvim-lsp'                         " LSP support
    Plug 'hrsh7th/cmp-buffer'                           " Buffer support
    Plug 'hrsh7th/cmp-path'                             " Path support
    Plug 'hrsh7th/cmp-nvim-lua'                         " Neovim Lua API
    Plug 'onsails/lspkind-nvim'                         " Meta information
    " Plug 'hrsh7th/cmp-nvim-lsp-signature-help'        " Signature helper

    " Other
    Plug 'bagrat/vim-workspace'                         " Tab appeareance
    Plug 'folke/twilight.nvim'                          " Dims other blocks of text
    Plug 'godlygeek/tabular'                            " Aligns stuff.
    Plug 'gorodinskiy/vim-coloresque'                   " Colours preview.
    Plug 'lenovsky/nuake'                               " Floating terminal
    Plug 'terryma/vim-multiple-cursors'                 " Mutiple cursors.
    Plug 'tpope/vim-sleuth'                             " Set tabs and spaces.

    " Themes
    Plug 'arcticicestudio/nord-vim'
    Plug 'chriskempson/base16-vim'
    Plug 'cocopon/iceberg.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'folke/tokyonight.nvim'
    Plug 'jacoborus/tender'
    Plug 'rakr/vim-one' 

  call plug#end()
endif

source $BASE/common.vim
source $BASE/plugins.vim

" Languages
source $BASE/languages/golang.vim
source $BASE/languages/javascript.vim
source $BASE/languages/other.vim
source $BASE/languages/perl.vim
source $BASE/languages/python.vim

if is_nvim
  " General
  lua require('other')
  lua require('tree_sitter')
  lua require('lsp')  
  lua require('autocomp')
  lua require('linter')
  lua require('telescope_bindings')

  " Languages
  lua require('languages.go')
  lua require('languages.javascript')
  lua require('languages.other')
  lua require('languages.perl')
  lua require('languages.python')
else
  source $BASE/only_vim.vim
endif
