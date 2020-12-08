"------------------------------------------------------------------------"
"|  ___  ________   ___  _________    ___      ___  ___   ______ _____  |"
"| |\  \|\   ___  \|\  \|\___   ___\ |\  \    /  /|/  /|/   _  / _   /| |"
"| \ \  \ \  \\ \  \ \  \|___ \  \_| \ \  \  /  / /  / /  / /__///  / / |"
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
" --- Vim-Plug ----------------------------------------------------------"
call plug#begin('~/AppData/Local/nvim/autoload')
" Plugins
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'miyakogi/conoline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'Yggdroot/indentLine'
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
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'lambdalisue/battery.vim'
" Themes
Plug 'tomasiser/vim-code-dark'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'phanviet/vim-monokai-pro'
Plug 'jacoborus/tender.vim'
Plug 'ajmwagar/vim-deus'
call plug#end()

" -----------------------------------------------------------------------"
" ---------------- PLUGIN SETTINGS --------------------------------------"
" -----------------------------------------------------------------------"
" --- Define mapleader for keymaps --------------------------------------"
let mapleader = ' '

" --- For NERDTree ------------------------------------------------------"
nnoremap <silent><leader>n :NERDTreeToggle<CR>

" --- For Tagbar --------------------------------------------------------"
nmap <F8> :TagbarToggle<CR>

" --- For lightline -----------------------------------------------------"
set laststatus=2
" The (sub)separator setting may not work in some terminals/devices
" strftime() may not be available in some systems
let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ 'component': {
      \   'percentwtot': '%3p%% (%L)',
      \   'charvaluehex': '0x%B',
      \   'clock': '%{strftime("%b%d %H:%M:%S")}',
      \   'battery': '%{battery#component()}' },
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [
      \     [ 'clock' ],
      \     [ 'percentwtot', 'lineinfo' ],
      \     [ 'fileformat', 'fileencoding' ] ] },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ [],
      \     [ 'percentwtot', 'lineinfo' ] ] },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator':  { 'left': "\ue0b1", 'right': "\ue0b3" }
      \  }
" Made specifically to work with codedark colorscheme
let s:p = g:lightline#colorscheme#codedark#palette
let s:c1  = ['NONE', 'NONE'] " none
let s:c2  = [ '#000000', 0 ] " black
let s:c3  = [ '#98c379', 2 ] " green
let s:c4  = [ '#c678dd', 5 ] " purple
let s:c5a = [ '#111111', 8 ] " grey
let s:c5b = [ '#30302C', 8 ] " grey
let s:c5c = [ '#949485', 8 ] " grey
let s:c5d = [ '#b0b0b0', 8 ] " grey
let s:c6  = [ '#e06b75', 9 ] " red
let s:c7  = [ '#61afef', 12] " blue
let s:c8  = [ '#dddddd', 15] " white
let s:effect = ['bold','italic']
" messy...
let s:p.normal.left = [[s:c5a[0], s:c3[0], s:c5a[1], s:c3[1], s:effect[0]],
      \ [s:c5c[0], s:c2[0], s:c5c[1], s:c2[1]]]
let s:p.normal.middle = [[s:c8[0], s:c1[0], s:c8[1], s:c1[1]]]
let s:p.normal.right = [[s:c5a[0], s:c5c[0], s:c5a[1], s:c5c[1]],
      \ [s:c5c[0], s:c5b[0], s:c5c[1], s:c5b[1]],
      \ [s:c5c[0], s:c2[0], s:c5c[1], s:c2[1]]]
let s:p.insert.left = [[s:c5a[0], s:c7[0], s:c5a[1], s:c7[1], s:effect[0]],
      \ [s:c5c[0], s:c2[0], s:c5c[1], s:c2[1]]]
let s:p.insert.middle = [[s:c8[0], s:c1[0], s:c8[1], s:c1[1]]]
let s:p.insert.right = [[s:c5a[0], s:c5c[0], s:c5a[1], s:c5c[1]],
      \ [s:c5c[0], s:c5b[0], s:c5c[1], s:c5b[1]],
      \ [s:c5c[0], s:c2[0], s:c5c[1], s:c2[1]]]
let s:p.visual.left = [[s:c5a[0], s:c4[0], s:c5a[1], s:c4[1], s:effect[0]],
      \ [s:c5c[0], s:c2[0], s:c5c[1], s:c2[1]]]
let s:p.visual.middle = [[s:c8[0], s:c1[0], s:c8[1], s:c1[1]]]
let s:p.visual.right = [[s:c5a[0], s:c5c[0], s:c5a[1], s:c5c[1]],
      \ [s:c5c[0], s:c5b[0], s:c5c[1], s:c5b[1]],
      \ [s:c5c[0], s:c2[0], s:c5c[1], s:c2[1]]]
let s:p.replace.left = [[s:c5a[0], s:c6[0], s:c5a[1], s:c6[1], s:effect[0]],
      \ [s:c5c[0], s:c2[0], s:c5c[1], s:c2[1]]]
let s:p.replace.middle = [[s:c8[0], s:c1[0], s:c8[1], s:c1[1]]]
let s:p.replace.right = [[s:c5a[0], s:c5c[0], s:c5a[1], s:c5c[1]],
      \ [s:c5c[0], s:c5b[0], s:c5c[1], s:c5b[1]],
      \ [s:c5c[0], s:c2[0], s:c5c[1], s:c2[1]]]
let s:p.inactive.left = [[s:c8[0], s:c5a[0], s:c8[1], s:c5a[1]]]
let s:p.inactive.middle = [[s:c8[0], s:c1[0], s:c8[1], s:c1[1]]]
let s:p.inactive.right = [[s:c5d[0], s:c5d[0], s:c5d[1], s:c5d[1]],
      \ [s:c8[0], s:c5a[0], s:c8[1], s:c5a[1]]]
let s:p.tabline.left = [[s:c3[0], s:c5b[0], s:c3[1], s:c5b[1]]]
let s:p.tabline.middle = [[s:c3[0], s:c1[0], s:c3[1], s:c1[1]]]
let s:p.tabline.right = [[s:c3[0], s:c5b[0], s:c3[1], s:c5b[1]]]
let s:p.tabline.tabsel = [[s:c5b[0], s:c3[0], s:c5b[1], s:c3[1]]]
" Toggle the display of seconds in the statusline (you may find it distracting)
let g:displaySeconds=1
function ToggleDisplayClockSeconds()
  if g:displaySeconds==1
    let g:displaySeconds=0
    let g:lightline.component.clock = '%{strftime("%b%d %H:%M")}'
  else
    let g:displaySeconds=1
    let g:lightline.component.clock = '%{strftime("%b%d %H:%M:%S")}'
  endif
  " Reload lightline
  call lightline#disable()
  call lightline#enable()
endfunction
nnoremap <silent><A-t> :call ToggleDisplayClockSeconds()<CR>

" --- For battery.vim ---------------------------------------------------"
let g:battery#component_format='%v%% %s'
let g:battery#update_interval=20000
let g:displayBattery=0
" Some terminals/devices may not support the following characters
" Placeholders
let g:battery#symbol_charging=''
let g:battery#symbol_discharging=''
" Change the battery icon accordingly
function SetBatteryIcon()
  let symbol=''
  let critical=0
  if battery#value() <= '20'
    let critical=1
    let symbol=''
  elseif battery#value() <= '30'
    let symbol=''
  elseif battery#value() <= '40'
    let symbol=''
  elseif battery#value() <= '50'
    let symbol=''
  elseif battery#value() <= '60'
    let symbol=''
  elseif battery#value() <= '70'
    let symbol=''
  elseif battery#value() <= '80'
    let symbol=''
  elseif battery#value() <= '90'
    let symbol=''
  else
    let symbol=''
  endif
  if battery#is_charging()
    let g:battery#symbol_charging=''.symbol
  else
    if critical==0
      let g:battery#symbol_discharging=symbol
    else
      let g:battery#symbol_discharging='!'.symbol
    endif
  endif
  call battery#update()
endfunction
" Toggle the display of the battery level in the statusline
function ToggleDisplayBattery()
  call SetBatteryIcon()
  if g:displayBattery==1
    let g:displayBattery=0
    let g:lightline.active.right = [
          \     [ 'clock' ],
          \     [ 'percentwtot', 'lineinfo' ],
          \     [ 'fileformat', 'fileencoding' ] ]
  elseif g:displayBattery==0
    let g:displayBattery=1
    let g:lightline.active.right = [
          \     [ 'battery', 'clock' ],
          \     [ 'percentwtot', 'lineinfo' ],
          \     [ 'fileformat', 'fileencoding' ] ]
  endif
  " Reload lightline
  call lightline#disable()
  call lightline#enable()
endfunction
nnoremap <silent><A-b> :call ToggleDisplayBattery()<CR>
" Update the battery icon every second when DisplayBattery is on
function TriggerSetBatteryIcon(timerA)
  if g:displayBattery==1
    call SetBatteryIcon()
  endif
endfunction
let timerA = timer_start(1000, 'TriggerSetBatteryIcon', {'repeat': -1})

" --- For NERDCommenter -------------------------------------------------"
let NERDSpaceDelims=0

" --- For Conoline ------------------------------------------------------"
let g:conoline_auto_enable = 1
let g:conoline_color_normal_dark = 'ctermbg=None'
let g:conoline_color_insert_dark = 'ctermbg=None'
let g:conoline_color_normal_nr_dark = 'ctermbg=None ctermfg=white
      \ guifg=white'
let g:conoline_color_insert_nr_dark = 'ctermbg=None ctermfg=white
      \ guifg=white'

" --- For creating presentations in vim (use Goyo plugin) ---------------"
autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()
function SetVimPresentationMode()
  set laststatus=0
  hi NonText guifg=bg ctermfg=bg
  set nonu
  DisableWhitespace
  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <Left> :N<CR>
endfunction

" --- For vim-anyfold ---------------------------------------------------"
autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_toplevel=0
set foldlevel=99

" --- For base16 colorscheme --------------------------------------------"
let base16colorspace=256  " Access colors present in 256 colorspace

" --- For fzf -----------------------------------------------------------"
let g:fzf_layout = { 'down': '~40%' }

" --- For SuperTab ------------------------------------------------------"
let g:SuperTabDefaultCompletionType = "<c-n>"

" --- For vimtex --------------------------------------------------------"
let g:tex_flavor='latex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:vimtex_view_general_viewer = 'SumatraPDF' 
let g:vimtex_view_general_options='-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk='-reuse-instance'

" --- For UtilSnips -----------------------------------------------------"
" Trigger configuration
let g:UltiSnipsExpandTrigger=",,"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

" --- For vim-sleuth ----------------------------------------------------"
let g:sleuth_automatic = 0

" --- For indentLine ----------------------------------------------------"
autocmd VimEnter * if bufname('%') == '' | IndentLinesDisable | endif
let g:indentLine_char = '¦'
let g:indentLine_enabled = 0
nnoremap <leader>i :IndentLinesToggle<CR>

" -----------------------------------------------------------------------"
" ---------------- SOME SETTINGS ----------------------------------------"
" -----------------------------------------------------------------------"
" --- Set colorscheme ---------------------------------------------------"
" For 256 color support
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Colorscheme
colorscheme codedark
set background=dark

" --- Disable Python indent defaults ------------------------------------"
let g:python_recommended_style = 0

" --- Set g:python3_host_prog -------------------------------------------"
let g:python3_host_prog = '~/AppData/Local/Programs/Python/Python38/python.exe'

" --- Global settings ---------------------------------------------------"
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

" --- Highlights --------------------------------------------------------"
highlight LineNr guibg=bg guifg=darkgrey
highlight Cursor ctermbg=white guibg=white
highlight iCursor ctermbg=white guibg=white
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight ModeMsg ctermbg=NONE guibg=NONE
highlight MoreMsg ctermbg=NONE guibg=NONE
highlight ModeArea ctermbg=NONE guibg=NONE
highlight ErrorMsg ctermbg=NONE guibg=NONE
highlight Error ctermbg=NONE guibg=NONE
highlight CocListBlackBlack ctermbg=NONE guibg=NONE
highlight CocListHighlightedText ctermbg=NONE guibg=NONE
highlight CocListFloating ctermbg=NONE guibg=NONE
highlight Directory ctermbg=NONE guibg=NONE
highlight VertSplit ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight ColorColumn ctermbg=darkgrey guibg=#111111

" --- Set OmniCompletion on ---------------------------------------------"
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" Spell check
set complete+=kspell
set completeopt=menuone,longest

" --- Change guicursor --------------------------------------------------"
set guicursor=a:block-Cursor

" -----------------------------------------------------------------------"
" ---------------- SOME KEYMAPS -----------------------------------------"
" -----------------------------------------------------------------------"
" --- Write files and source vimrc --------------------------------------"
nnoremap <leader>w :w<CR>
nnoremap <leader>so :source ~/AppData/Local/nvim/init.vim<CR>

" --- Window handling ---------------------------------------------------"
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>s :wincmd s<CR>
nnoremap <leader>x :wincmd c<CR>
nnoremap <leader>r :wincmd r<CR>
nnoremap <leader>T :wincmd T<CR>
nnoremap <leader>= :wincmd =<CR>
nnoremap <leader>o :wincmd o<CR>
" Split Resizing
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <A-+> :resize +2<CR>
nnoremap <silent> <A--> :resize -2<CR>

" --- Navigation in Insert Mode -----------------------------------------"
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

" --- Scroll up/down with keys ------------------------------------------"
nnoremap <silent><C-j> <C-e>
nnoremap <silent><C-k> <C-y>
" 5x FASTER
nnoremap <silent><A-j> 5<C-e>
nnoremap <silent><A-k> 5<C-y>

" --- Scroll left/right with keys ---------------------------------------"
nnoremap <C-h> 3zh
nnoremap <C-l> 3zl

" --- Move lines up/down ------------------------------------------------"
nnoremap <A-s> :m .+1<CR>==
nnoremap <A-w> :m .-2<CR>==
inoremap <A-s> <Esc>:m .+1<CR>==gi
inoremap <A-w> <Esc>:m .-2<CR>==gi
vnoremap <A-s> :m '>+1<CR>gv=gv
vnoremap <A-w> :m '<-2<CR>gv=gv

" --- Tab handling ------------------------------------------------------"
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>

" --- Map command to go to init.vim file --------------------------------"
cabbrev init e ~/AppData/Local/nvim/init.vim
cabbrev ginit e ~/AppData/Local/nvim/ginit.vim

" --- Activate/Deactivate Spelllang to EN -------------------------------"
nnoremap <leader>p :setlocal spell spelllang=en_us<CR>
nnoremap <leader>pt :setlocal spell spelllang=pt_pt<CR>
nnoremap <leader><S-p> :set nospell<CR>

" --- Auto-closing brackets in Insert Mode ------------------------------"
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" --- Map to terminal ---------------------------------------------------"
nnoremap <leader>b <C-w>s<C-w>j:terminal<CR>

" --- Map F5 to Ctrl-] (recommended for non EN Keyboards) ---------------"
nnoremap <F5> <C-]><CR>

" -----------------------------------------------------------------------"
