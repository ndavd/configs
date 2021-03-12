function ndavid#colors#set()
endfunction

" --- Highlights --------------------------------------------------------"

function s:make_hls() abort
  " Transparent background color for Nvim
  hi Normal guibg=NONE
  hi NonText guibg=NONE
  hi ModeMsg guibg=NONE
  hi MoreMsg guibg=NONE
  hi ModeArea guibg=NONE
  hi ErrorMsg guibg=NONE
  hi Error guibg=NONE
  hi Directory guibg=NONE
  hi VertSplit guibg=NONE
  hi SignColumn guibg=NONE
  hi EndOfBuffer guibg=NONE guifg=#5a5a5a
  " Number, CC, Cursor and Normal
  hi LineNr guibg=bg guifg=darkgrey
  hi CursorLine guibg=NONE
  hi CursorLineNr guibg=bg guifg=white
  hi ColorColumn ctermbg=darkgrey guibg=#111111
  hi Cursor ctermbg=white guibg=white
  " IncSearch
  hi IncSearch gui=reverse
  " Pmenu
  hi PmenuSel blend=0
  " Statusline
  hi StatusLine guibg=#303030 guifg=#a4a4a4
  hi StatusLineNC guibg=#111111 guifg=#949494
  " Listchars
  hi NonText guifg=#3a3a3a
  hi Whitespace guifg=#3a3a3a
  " Packer
  hi packerWorking guifg=#80aa9e
  hi packerSuccess guifg=#b8cb26 gui=bold
  hi packerFail guifg=#af2528 gui=bold
  " ScrollView
  hi ScrollView guibg=#ffffff
  " Telescope
  hi TelescopeBorder guifg=#ffffff
  hi TelescopePromptPrefix guifg=#ea6962
  " Lsp
  hi LspDiagnosticsDefaultError guibg=NONE guifg=#ea6962
  hi LspDiagnosticsVirtualTextError guibg=NONE guifg=#ea6962
  hi LspDiagnosticsFloatingError guibg=NONE guifg=#ea6962
  hi LspDiagnosticsSignError guibg=NONE guifg=#ea6962
  " Startify
  hi StartifyHeader gui=NONE guifg=#d4d4d4
  hi StartifyFooter gui=NONE guifg=#d4d4d4
endfunction
augroup make_custom_hls
  au!
  au ColorScheme * call s:make_hls()
augroup END
call s:make_hls()

" For codedark
function s:custom_codedark_hls()
  " Visual and Search
  hi Visual guibg=#0E1F2F
  hi Search guibg=#0E1F2F
  " MatchParen
  hi MatchParen guibg=#303030
  " Tabline
  hi TabLine guifg=#6b9956 guibg=#111111
  hi TabLineSel guifg=#111111 guibg=#6b9956
  hi TabLineFill guifg=#949494 guibg=NONE
endfunction
augroup CodedarkCustom
  au!
  au ColorScheme codedark call s:custom_codedark_hls()
augroup END

" For gruvbox-material
function s:set_gruvbox_material()
  let g:gruvbox_material_background = 'hard'
  let g:gruvbox_material_disable_italic_comment = 1
  let g:gruvbox_material_visual = 'red background'
  let g:gruvbox_material_transparent_background = 1
  let g:gruvbox_material_menu_selection_background = 'red'
  let g:gruvbox_material_palette = 'material'
  colorscheme gruvbox-material
endfunction
function s:custom_gruvbox_material_hls()
  let l:bg_visual_blue = ['#0E1F2F', 'blue']
  let l:palette = gruvbox_material#get_palette('hard', 'material')
  call gruvbox_material#highlight('Cursor', l:palette.none, ['white','white'])
  call gruvbox_material#highlight('ErrorMsg', l:palette.red, l:palette.none, 'bold')
  call gruvbox_material#highlight('Visual', l:palette.none, l:bg_visual_blue)
  call gruvbox_material#highlight('VisualNOS', l:palette.none, l:bg_visual_blue)
  call gruvbox_material#highlight('IncSearch', l:palette.none, l:palette.none, 'reverse')
endfunction
augroup GruvboxMaterialCustom
  au!
  au ColorScheme gruvbox-material call s:custom_gruvbox_material_hls()
augroup END

" --- Set colorscheme ---------------------------------------------------"

set background=dark
call s:set_gruvbox_material()
