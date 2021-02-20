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
"|    - do all the requirements for each language server                |"
"|    - install sumatraPDF, sqlite, etc.                                |"
"|                                                                      |"
"------------------------------------------------------------------------"

" -----------------------------------------------------------------------"
" ---------------- ADD PLUGINS ------------------------------------------"
" -----------------------------------------------------------------------"
" --- Start Vim-Plug ----------------------------------------------------"
call plug#begin('~/AppData/Local/nvim/autoload')

" --- File explorer -----------------------------------------------------"
Plug 'preservim/nerdtree'

" --- Smooth Scrolling --------------------------------------------------"
Plug 'psliwka/vim-smoothie'

" --- Better start screen -----------------------------------------------"
Plug 'mhinz/vim-startify'
"Plug 'glepnir/dashboard-nvim'

" --- Icon support ------------------------------------------------------"
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" --- Indentation -------------------------------------------------------"
Plug 'tpope/vim-sleuth'

" --- Auto comment ------------------------------------------------------"
Plug 'preservim/nerdcommenter'

" --- Better escape -----------------------------------------------------"
Plug 'jdhao/better-escape.vim'

" --- Fold text ---------------------------------------------------------"
Plug 'pseewald/vim-anyfold'

" --- Surround text -----------------------------------------------------"
Plug 'tpope/vim-surround'

" --- Complete brackets -------------------------------------------------"
Plug 'jiangmiao/auto-pairs'

" --- RFC ---------------------------------------------------------------"
Plug 'mhinz/vim-rfc'

" --- Cheat.sh ----------------------------------------------------------"
Plug 'dbeniamine/cheat.sh-vim'

" --- Git ---------------------------------------------------------------"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" --- Sql.nvim ----------------------------------------------------------"
Plug 'tami5/sql.nvim'

" --- Telescope ---------------------------------------------------------"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'

" --- Treesitter --------------------------------------------------------"
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'

" --- Snippets ----------------------------------------------------------"
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" --- LSP ---------------------------------------------------------------"
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'mfussenegger/nvim-jdtls'

" --- View tags ---------------------------------------------------------"
Plug 'liuchengxu/vista.vim'

" --- Colorschemes ------------------------------------------------------"
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'lifepillar/vim-solarized8'
Plug 'phanviet/vim-monokai-pro'
Plug 'jacoborus/tender.vim'
Plug 'ajmwagar/vim-deus'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'jacoborus/tender.vim'
Plug 'glepnir/oceanic-material'
Plug 'KeitaNakamura/neodark.vim'
Plug 'ackyshake/Spacegray.vim'

" --- End Vim-Plug ------------------------------------------------------"
call plug#end()

" -----------------------------------------------------------------------"
" ---------------- PLUGIN SETTINGS --------------------------------------"
" -----------------------------------------------------------------------"
" --- Define mapleader for keymaps --------------------------------------"
let mapleader = ' '

" --- For base16 colorscheme --------------------------------------------"
let base16colorspace=256  " Access colors present in 256 colorspace

" --- For NERDTree ------------------------------------------------------"
let NERDTreeMinimalUI=1
let NERDTreeStatusline='%=%='
nnoremap <silent><leader>n :NERDTreeToggle<CR>

" --- For vim-smoothie --------------------------------------------------"
let g:smoothie_no_default_mappings = 1
" Keymaps
nnoremap <silent><A-j> :call smoothie#downwards()<CR>
nnoremap <silent><A-k> :call smoothie#upwards()<CR>

" --- For vim-startify --------------------------------------------------"
function GetNvimVersion()
  redir => s
  silent! version
  redir END
  return 'NVIM v'.matchstr(s, 'NVIM v\zs[^\n]*')
endfunction
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_bookmarks = [
      \ {'i': '~\AppData\Local\nvim\init.vim'},
      \ {'n': '~\AppData\Local\nvim'},
      \ ]
let g:startify_commands = [
      \ {'f': 'Telescope frecency'},
      \ {'p': 'PlugUpdate'},
      \ ]
let g:startify_files_number = 5
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header_quotes =
      \ startify#fortune#predefined_quotes() +
      \ [[
      \ 'The career of a young theoretical physicist consists'.
      \ ' of treating the harmonic oscillator in ever-increasing'.
      \ ' levels of abstraction.','','- Sidney Coleman'
      \ ]]
let s:ascii_darth_vader = [
      \ '  o       ⌌━━━ ⌍         ',
      \ '   o     | //   ░▏       ',
      \ '    o  _/,-||-_╲_\       ',
      \ '       / (■)(■)\\░\      ',
      \ '      / \_/_\__/\  ╲     ',
      \ '     (   ╱╱ii\\/ )  \_   ',
      \ '      ╲▁  ▔▔▔▔─⌍▁▁▁▁▁/   ',
      \ '       ▁▁▐ ▐  ▐ \        ',
      \ ]
function StartifyUpdateQuote()
  let s:get_quote = startify#fortune#boxed()
endfunction
function StartifyUpdateCentering()
  let g:startify_custom_header =
        \ startify#center([GetNvimVersion()]) +
        \ startify#center(['',
        \ '  Welcome to the Dark Side of text editing',
        \ 'Nvim is open source and freely distributable',
        \ '']) + startify#center(s:get_quote) +
        \ startify#center(s:ascii_darth_vader)
endfunction
autocmd VimEnter * call StartifyUpdateQuote()
      \| call StartifyUpdateCentering()
autocmd VimResized * if &ft=='startify'
      \| call StartifyUpdateCentering()
      \| call startify#insane_in_the_membrane(0)
      \| endif
autocmd User StartifyReady setl stl=%=\\ startify\ \%=
nnoremap <silent><leader><leader>s
      \ :call StartifyUpdateCentering()<CR>:Startify<CR>

" --- For Vista.vim -----------------------------------------------------"
let g:vista_default_executive = 'nvim_lsp'
let g:vista_icon_indent = ["└─ ", "├─ "]
autocmd VimResized * let g:vista_sidebar_width =
      \ string(nvim_win_get_width(0)*0.3)
let g:vista_update_on_text_changed = 1
let g:vista_cursor_delay = 10
nnoremap <silent><leader>v :Vista!!<CR>

" --- For NERDCommenter -------------------------------------------------"
let NERDSpaceDelims=0
let g:NERDAltDelims_c     = 1
let g:NERDAltDelims_cpp   = 1
let g:NERDCompactSexyComs = 1

" --- For creating presentations in vim ---------------------------------"
autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()
function SetVimPresentationMode()
  set laststatus=0
  hi NonText guifg=bg ctermfg=bg
  set nonu
  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <Left> :N<CR>
endfunction

" --- For vim-anyfold ---------------------------------------------------"
let g:anyfold_fold_toplevel=0
set foldlevel=99
autocmd BufWritePre *.md let b:noanyfold="true"
if !exists('b:noanyfold')
  if bufname(0) != ''
    AnyFoldActivate
  endif
endif

" --- For vim-sleuth ----------------------------------------------------"
let g:sleuth_automatic = 0

" --- For gitgutter -----------------------------------------------------"
let g:gitgutter_map_keys = 0

" --- For better-escape -------------------------------------------------"
let g:better_escape_interval = 200
let g:better_escape_shortcut = 'kj'

" --- For nvim-treesitter -----------------------------------------------"
lua require('treesitter_config')

" --- For sql.nvim ------------------------------------------------------"
let g:sql_clib_path = "C:/Sqlite3/sqlite3.dll"

" --- For nvim-telescope ------------------------------------------------"
" Load config file
lua require('telescope_config')
"autocmd! Filetype TelescopePrompt
"autocmd Filetype TelescopePrompt set noshowmode
"\| autocmd BufLeave <buffer> set showmode
" Media command ( nvim media player :D ) SOON
"command Media lua require'telescope.builtin'.find_files{ find_command =
      "\ {'fd', '--type', 'f', '-e', 'mp4' }, previewer = false }
" Keymaps
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>gl :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>gs :lua require('telescope.builtin').grep_string()<CR>
nnoremap <leader>ga :lua require('telescope.builtin').lsp_code_actions()<CR>
nnoremap <leader><leader>h :lua require('telescope.builtin').help_tags()<CR>
nnoremap z= :lua require('telescope.builtin').spell_suggest()<CR>

" --- For lspconfig -----------------------------------------------------"
" Load config file
lua require('lspconfig_config')
" Format command ( for proper formatting )
command! Format execute 'lua vim.lsp.buf.formatting()'
command! LineDiag lua vim.lsp.diagnostic.show_line_diagnostics()
" Keymaps
nnoremap <silent>gD         :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gd         :lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>gk :lua vim.lsp.buf.hover()<CR>
nnoremap <silent><leader>gr :lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>gR :lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>gp :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent><leader>gn :lua vim.lsp.diagnostic.goto_next()<CR>

" --- For nvim-jdtls ----------------------------------------------------"
augroup lsp
  au!
  au FileType java lua require'nvimjdtls_config'
augroup END

" --- For vim-vsnip and Neosnippet --------------------------------------"
function SnippetSettings(whichOne)
  if a:whichOne == 'neo'
    let g:completion_enable_snippet = 'Neosnippet'
    imap <C-k> <Plug>(neosnippet_jump)
    smap <C-k> <Plug>(neosnippet_jump)
  elseif a:whichOne == 'vsnip'
    let g:completion_enable_snippet = 'vim-vsnip'
    imap <expr> <C-k> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-k>'
    smap <expr> <C-k> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-k>'
    imap <expr> <C-j> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-j>'
    smap <expr> <C-j> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-j>'
  endif
endfunction

" --- For completion.nvim -----------------------------------------------"
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
" Enable Neosnippet snippets for html & tex
" Use vim-vsnip for the rest
autocmd BufEnter * if &filetype =~ 'tex\|html' |
      \ call SnippetSettings('neo') | else |
        \ call SnippetSettings('vsnip') | endif
let g:completion_confirm_key = '<CR>'
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
let g:completion_enable_auto_paren = 0
let g:completion_matching_strategy_list =
      \ ['exact', 'substring', 'fuzzy', 'all']

" -----------------------------------------------------------------------"
" ---------------- NVIM SETTINGS ----------------------------------------"
" -----------------------------------------------------------------------"
" --- Enable 256 color support ------------------------------------------"
set termguicolors

" --- Set colorscheme ---------------------------------------------------"
" Colorscheme
colorscheme codedark
set background=dark

" --- Disable recommended styles ----------------------------------------"
let g:python_recommended_style = 0
let g:rust_recommended_style = 0

" --- Set g:python3_host_prog -------------------------------------------"
let g:python3_host_prog=
      \'~/AppData/Local/Programs/Python/Python38/python.exe'

" --- Time format language ----------------------------------------------"
language time en_us

" --- Global settings ---------------------------------------------------"
set nowrap
set clipboard=unnamed
set noshowmode
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu rnu
set nohls
set list
set ignorecase
set smartcase
set noswapfile
set nobackup
set undofile
set pumblend=15
set textwidth=80
set colorcolumn=
set updatetime=100
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set inccommand=split

" --- Listchars ---------------------------------------------------------"
if &list
  let g:listchar_index = 0
  let g:listchar_options = [
        \ 'tab:\ ,conceal:┊,nbsp:⍽,extends:>,precedes:<,trail:·',
        \ 'tab:\ ,conceal:┊,nbsp:⍽,extends:>,precedes:<,trail:·'.
        \ ',eol:﬋'
        \ ]
  " Nice chars ﲒ ﮊ ⌴ ⍽   ▷▻⊳►▶▚‽⊛ψψδ…﬋↲↵┊
  function CycleListchars() abort
    execute 'set listchars='.g:listchar_options[
          \ float2nr(
          \ fmod(g:listchar_index, len(g:listchar_options))
          \ )]
    let g:listchar_index += 1
  endfunction
  " Cycle listchars
  nnoremap <silent><leader><leader>cl :call CycleListchars()<CR>
  call CycleListchars()
endif

" --- Set statusline ----------------------------------------------------"
function ActiveStatusline()
  if MakeStatln()
    setl statusline =%#StatlnM#
    setl statusline+=\ %{DetectMode()}
    setl statusline+=\ %#StatlnSepM#\%#StatlnBG#
    setl statusline+=%#StatlnBG#
    setl statusline+=\ %{FugitiveHeadWIcon()}
    setl statusline+=%{WebDevIconsGetFileTypeSymbol()}\ %f\ %m%<
    setl statusline+=%= " Separate right and left
    "setl statusline+=%{&ff}\ \\ %{&fenc!=#\"\"?&fenc:&enc}
    setl statusline+=\ %#StatlnSep1#\%#StatlnCmp1#\ %2l(%L):%-2c
    setl statusline+=\ \%#StatlnCmp2#
    setl statusline+=\ %{strftime('%a\ %d/%m\ \\ %H:%M:%S\ ')}
  endif
endfunction
function InnactiveStatusline()
  if MakeStatln()
    setl statusline =%#StatlnInacCmp#
    setl statusline+=\ %{WebDevIconsGetFileTypeSymbol()}\ %f\ %m%<
    setl statusline+=\ %#StatlnInacSep1#\%#StatlnBG#%=
    setl statusline+=%#StatlnInacSep1#\%#StatlnInacCmp#\ %2l(%L):%-2c
    setl statusline+=%#StatlnInacSep2#\ \ ""
  endif
endfunction
function MakeStatln()
  if &ft == 'nerdtree' || &ft == 'vista_kind' ||
        \ &ft == 'startify'
    return v:false
  else
    return v:true
  endif
endfunction
function FugitiveHeadWIcon()
  let l:current_branch = FugitiveHead()
  return l:current_branch != "" ?
        \ " ".l:current_branch." " : l:current_branch
endfunction
function DetectMode()
  if match(['n','c'], mode())!=-1
    let l:clr='#6b9956'
  elseif match(['i','ix','t','s','S',"\<C-s>"], mode())!=-1
    let l:clr='#61afef'
  elseif match(['R'], mode())!=-1
    let l:clr='#e06b75'
  elseif match(['v','V',"\<C-v>"], mode())!=-1
    let l:clr='#c678dd'
  endif
  let l:mmap = {
        \ 'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE',
        \ 'v': 'VISUAL', 'V': 'V·LINE', "\<C-v>": 'V·BLOCK',
        \ 'c': 'COMMAND', 's': 'SELECT', 'S': 'S·LINE',
        \ "\<C-s>": 'S·BLOCK', 't': 'TERMINAL'
        \ }
  execute('hi StatlnM guifg=#111111 guibg='.l:clr.' gui=bold')
  execute('hi StatlnSepM guifg='.l:clr.' guibg=NONE')
  return get(l:mmap, mode(), '')
endfunction
" Update Statusline when entering/leaving
au WinEnter,BufEnter * call ActiveStatusline()
au WinLeave,BufLeave * call InnactiveStatusline()
" Force statusline update every x time
let SLtimer = timer_start(500, 'UpdateStatusline', {'repeat':-1})
function! UpdateStatusline(SLtimer)
  execute 'let &ro=&ro'
endfunction

" --- Break Stuff :D ----------------------------------------------------"
function CrazySpinChars()
  let @S="$x^^P"
  function UpdateCrazySpin(timer)
    normal @S
    "v/^$/normal @a
  endfunction
  let @S=''
  let l:timer = timer_start(300, 'UpdateCrazySpin', {'repeat':-1})
endfunction
nnoremap <silent><leader><leader>cs :call CrazySpinChars()<CR>

" --- Have cursorline active only on the active window ------------------"
"hi CursorLine guibg=NONE guibg=#101010
"hi CursorLineNr guifg=white guibg=#101010
"au WinEnter,BufEnter * if &ft!='startify' | setl cursorline
      "\ | hi CursorLine guibg=#101010 | endif
"au WinLeave,BufLeave * setl nocursorline | hi CursorLine guibg=NONE

" --- Highlights --------------------------------------------------------"
" Transparent background color for Nvim
hi Normal guibg=NONE
hi NonText guibg=NONE
hi EndOfBuffer guibg=NONE
hi ModeMsg guibg=NONE
hi MoreMsg guibg=NONE
hi ModeArea guibg=NONE
hi ErrorMsg guibg=NONE
hi Error guibg=NONE
hi Directory guibg=NONE
hi VertSplit guibg=NONE
hi SignColumn guibg=NONE
" Number, CC, Cursor and Normal
hi LineNr guibg=bg guifg=darkgrey
hi CursorLine guibg=NONE
hi CursorLineNr guibg=bg guifg=white
hi ColorColumn ctermbg=darkgrey guibg=#111111
hi Cursor ctermbg=white guibg=white
" Visual and Search (for codedark theme)
hi Visual guibg=#0E1F2F
hi Search guibg=#0E1F2F
" IncSearch
hi IncSearch gui=reverse
" Pmenu
hi PmenuSel blend=0
" MatchParen
hi MatchParen guibg=#303030
" Statusline
hi Statusline guibg=#303030 guifg=#d4d4d4
hi StatuslineNC guibg=#111111 guifg=#949494
hi StatlnBG guibg=NONE guifg=#949494
hi StatlnCmp1 guibg=#303030 guifg=#949494
hi StatlnSep1 guibg=NONE guifg=#303030
hi StatlnCmp2 guibg=#949494 guifg=#000000
hi StatlnInacCmp guibg=#111111 guifg=#b0b0b0
hi StatlnInacSep1 guibg=NONE guifg=#111111
hi StatlnInacSep2 guibg=#111111 guifg=#949494
" Tabline
hi TabLine guifg=#6b9956 guibg=#111111
hi TabLineSel guifg=#111111 guibg=#6b9956
hi TabLineFill guifg=#949494 guibg=NONE
" Listchars
hi NonText guifg=#3a3a3a
hi Whitespace guifg=#3a3a3a
" Minimap
hi MinimapCurrentLine ctermfg=darkblue guifg=#213456 guibg=NONE
hi MinimapBg ctermfg=darkgrey guifg=#303030 guibg=NONE
" Telescope
hi TelescopeBorder guifg=#ffffff
" Lsp
hi LspDiagnosticsDefaultError guibg=NONE guifg=#ea6962
hi LspDiagnosticsVirtualTextError guibg=NONE guifg=#ea6962
hi LspDiagnosticsFloatingError guibg=NONE guifg=#ea6962
hi LspDiagnosticsSignError guibg=NONE guifg=#ea6962
" Startify
hi StartifyHeader gui=NONE guifg=#d4d4d4
hi StartifyFooter gui=NONE guifg=#d4d4d4

" --- Change guicursor --------------------------------------------------"
set guicursor=a:block-Cursor
"set guicursor=a:block-Cursor,i:hor20-Cursor

" --- Mouse options -----------------------------------------------------"
set mouse=a
behave xterm

" --- Fix Highlight Errors ----------------------------------------------"
let g:vimsyn_noerror = 1

" --- Highlight when yanking --------------------------------------------"
augroup LuaHighlight
  au!
  au TextYankPost *
        \ silent! lua require'vim.highlight'.on_yank({on_visual=false})
augroup END

" -----------------------------------------------------------------------"
" ---------------- VIM KEYMAPS ------------------------------------------"
" -----------------------------------------------------------------------"
" --- Write files and source --------------------------------------------"
nnoremap <leader>w :w<CR>
nnoremap <leader>ss :so ~/AppData/Local/nvim/init.vim<CR>

" --- Window handling ---------------------------------------------------"
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>x :wincmd c<CR>
nnoremap <silent><leader>r :wincmd r<CR>
nnoremap <silent><leader>T :wincmd T<CR>
nnoremap <silent><leader>= :wincmd =<CR>
nnoremap <silent><leader>o :wincmd o<CR>
nnoremap <silent><leader>sv :wincmd v<CR>
nnoremap <silent><leader>sh :wincmd s<CR>
" Split Resizing
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <A-+> :resize +2<CR>
nnoremap <silent> <A--> :resize -2<CR>

" --- Scroll up/down with keys ------------------------------------------"
nnoremap <silent><C-j> <C-e>
nnoremap <silent><C-k> <C-y>

" --- Scroll left/right with keys ---------------------------------------"
nnoremap <C-h> 3zh
nnoremap <C-l> 3zl

" --- Move lines up/down ------------------------------------------------"
nnoremap <silent><A-s> :m .+1<CR>==
nnoremap <silent><A-w> :m .-2<CR>==
inoremap <silent><A-s> <Esc>:m .+1<CR>==gi
inoremap <silent><A-w> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-s> :m '>+1<CR>gv=gv
vnoremap <silent><A-w> :m '<-2<CR>gv=gv

" --- Tab handling ------------------------------------------------------"
nnoremap <silent><leader>tc :tabc<CR>
nnoremap <silent><leader>tn :tabn<CR>
nnoremap <silent><leader>tp :tabp<CR>

" --- Activate/Deactivate Spelllang to EN -------------------------------"
nnoremap <leader>p :setlocal spell spelllang=en_us<CR>
nnoremap <leader>pt :setlocal spell spelllang=pt_pt<CR>
nnoremap <leader><S-p> :set nospell<CR>

" --- Map to terminal ---------------------------------------------------"
nnoremap <leader>bb <C-w>s<C-w>j:terminal<CR>

" -----------------------------------------------------------------------"
