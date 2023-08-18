"plugins
call plug#begin()
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
  Plug 'williamboman/mason.nvim'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'honza/vim-snippets'
  Plug 'scrooloose/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'romgrk/barbar.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'startup-nvim/startup.nvim'
  Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
call plug#end()

"load stuff
lua require("mason").setup()
lua require("toggleterm").setup()
autocmd VimEnter * NERDTree

"theme stuff will go here
lua vim.cmd[[colorscheme dracula]]
lua require("startup").setup({theme = "startify"})
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
"config stuff
let shell="/bin/zsh"
let NERDTreeShowHidden=1
set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
filetype plugin indent on
syntax on
set mouse=a
set clipboard=unnamedplus
filetype plugin on
set cursorline

"coc stuff
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"shortcuts
nmap <S-t> :ToggleTerm<CR>
