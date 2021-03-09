" --- Highlights --------------------------------------------------------"

function s:make_hls() abort
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
  hi StatlnGit guifg=#e37933
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
