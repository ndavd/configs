"------------------------------------------------------------------------"
"|  ___  ________   ___  _________    ___      ___  ___   ______ _____  |"
"| |\  \|\   ___  \|\  \|\___   ___\ |\  \    /  / /  /|/   _  / _   /| |"
"| \ \  \ \  \\ \  \ \  \|___ \  \_| \ \  \  /  /|/  / /  / /__///  / / |"
"|  \ \  \ \  \\ \  \ \  \   \ \  \   \ \  \/  / /  / /  / |__|//  / /  |"
"|   \ \  \ \  \\ \  \ \  \   \ \  \ __\ \    / /  / /  / /    /  / /   |"
"|    \ \__\ \__\\ \__\ \__\   \ \__\\__\ \__/ /__/ /__/ /    /__/ /    |"
"|     \|__|\|__| \|__|\|__|    \|__\|__|\|__|/|__|/|__|/     |__|/     |"
"|       init.vim file (nvim 0.5.0) ------------------ by: ndavid       |"
"|                                                                      |"
"|----------------------------------------------------------------------|"
"|                                                                      |"
"|    FIRST TIME TODOS                                                  |"
"|    - install Vim-Plug (download plug.vim                             |"
"|      ... place it into ~/AppData/Local/nvim/autoload)                |"
"|    - place pt.utf-8.spl in ~/AppData/Local/nvim/spell                |"
"|    - mkdir undodir in ~/AppData/Local/nvim                           |"
"|    - install Exuberant Ctags                                         |"
"|                                                                      |"
"------------------------------------------------------------------------"

" -----------------------------------------------------------------------"
" ---------------- ADD PLUGINS ------------------------------------------"
" -----------------------------------------------------------------------"
" --- Vim-Plug ---
call plug#begin('~/AppData/Local/nvim/autoload')
" Plugins
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'miyakogi/conoline.vim'
Plug 'tpope/vim-surround'
Plug 'pseewald/vim-anyfold'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'ryanoasis/vim-devicons'
Plug 'dhruvasagar/vim-table-mode'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
" Themes
Plug 'tomasiser/vim-code-dark'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'lifepillar/vim-solarized8'
Plug 'phanviet/vim-monokai-pro'
Plug 'jacoborus/tender.vim'
call plug#end()

" -----------------------------------------------------------------------"
" ---------------- PLUGIN SETTINGS --------------------------------------"
" -----------------------------------------------------------------------"
" --- Define mapleader for keymaps ---
let mapleader = " "

" --- For NERDTree ---
map <leader>n :NERDTreeToggle<CR>

" --- For Tagbar ---
nmap <F8> :TagbarToggle<CR>

" --- For lightline ---
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ }

" --- For NERDCommenter ---
let NERDSpaceDelims=0

" --- For Conoline ---
let g:conoline_auto_enable = 1
let g:conoline_color_normal_dark = 'ctermbg=None'
let g:conoline_color_insert_dark = 'ctermbg=None'
let g:conoline_color_normal_nr_dark = 'ctermbg=None ctermfg=white
      \ guifg=white'
let g:conoline_color_insert_nr_dark = 'ctermbg=None ctermfg=white
      \ guifg=white'

" --- For creating presentations in vim (use Goyo plugin) ---
autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()
function SetVimPresentationMode()
  set laststatus=0
  hi NonText guifg=bg ctermfg=bg
  set nonu
  DisableWhitespace
  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <Left> :N<CR>
endfunction

" --- For vim-anyfold ---
autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_toplevel=0
set foldlevel=99

" --- For base16 colorscheme ---
let base16colorspace=256  " Access colors present in 256 colorspace

" --- For fzf ---
let g:fzf_layout = { 'down': '~40%' }

" --- For SuperTab ---
let g:SuperTabDefaultCompletionType = "<c-n>"

" --- For vimtex ---
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:vimtex_view_general_viewer = 'SumatraPDF' 
let g:vimtex_view_general_options='-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk='-reuse-instance'

" --- For UtilSnips ---
" Trigger configuration
let g:UltiSnipsExpandTrigger=",,"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

" -----------------------------------------------------------------------"
" ---------------- SOME SETTINGS ----------------------------------------"
" -----------------------------------------------------------------------"
" --- Set GUI Font ---
set guifont=UbuntuMono\ NF:h12

" --- Set colorscheme ---
" For 256 color support
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Colorscheme
colorscheme codedark
set background=dark

" --- Global settings ---
syntax on
set nowrap
set clipboard=unnamed
set encoding=utf-8
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set wildmenu
set nu rnu
set nohlsearch
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/AppData/Local/nvim/undodir
set undofile
set incsearch
set textwidth=80
set colorcolumn=+1

" --- Highlights ---
highlight LineNr guibg=bg guifg=darkgrey

" --- Set OmniCompletion on ---
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" Spell check
set complete+=kspell
set completeopt=menuone,longest

" --- Set guioptions ---"
set guioptions+='a'
set guioptions+='d'
set guioptions+='i'
" Removing menubar/toolbar/scrollbar
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=L
" Dark tabs
set guioptions='d'

" --- Change guicursor ---
"set guicursor=i:hor20-Cursor
"set guicursor+=r:hor25-Cursor
"set guicursor+=n-o-v-c-ci-cr-sm:block-Cursor
set guicursor=a:block-Cursor
set guicursor+=a:blinkwait850-blinkoff350-blinkon300-Cursor

" -----------------------------------------------------------------------"
" ---------------- SOME KEYMAPS -----------------------------------------"
" -----------------------------------------------------------------------"
" --- Write files and source vimrc ---
nnoremap <leader>w :w<CR>
nnoremap <leader>so :source ~/AppData/Local/nvim/init.vim<CR>

" --- Window handling ---
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>s :wincmd s<CR>
nnoremap <leader>c :wincmd c<CR>
nnoremap <leader>r :wincmd r<CR>
nnoremap <leader>T :wincmd T<CR>
nnoremap <leader>= :wincmd =<CR>
nnoremap <leader>wo :wincmd o<CR>
" Split Resizing
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>h+ :resize +2<CR>
nnoremap <silent> <leader>h- :resize -2<CR>

" --- Navigation in Insert Mode ---
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

" --- Scroll up/down with keys ---
nnoremap <silent><C-j> <C-e>
nnoremap <silent><C-k> <C-y>
" 5x FASTER
nnoremap <silent><A-j> 5<C-e>
nnoremap <silent><A-k> 5<C-y>

" --- Scroll left/right with keys ---
nnoremap <C-h> 3zh
nnoremap <C-l> 3zl

" --- Move lines up/down ---
nnoremap <A-s> :m .+1<CR>==
nnoremap <A-w> :m .-2<CR>==
inoremap <A-s> <Esc>:m .+1<CR>==gi
inoremap <A-w> <Esc>:m .-2<CR>==gi
vnoremap <A-s> :m '>+1<CR>gv=gv
vnoremap <A-w> :m '<-2<CR>gv=gv

" --- Tab handling ---
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>

" --- Map command to go to init.vim file ---
cabbrev init e ~/AppData/Local/nvim/init.vim

" --- Activate/Deactivate Spelllang to EN ---
nnoremap <leader>p :setlocal spell spelllang=en_us<CR>
nnoremap <leader>pt :setlocal spell spelllang=pt_pt<CR>
nnoremap <leader><S-p> :set nospell<CR>

" --- Auto-closing brackets in Insert Mode ---
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" --- Map to terminal ---
nnoremap <leader>b :terminal<CR>

" --- Map F5 to Ctrl-] (recommended for non EN Keyboards) ---
nnoremap <F5> <C-]><CR>

" -----------------------------------------------------------------------"
