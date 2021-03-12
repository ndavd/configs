function ndavid#stl#set()
endfunction

" --- Set statusline ----------------------------------------------------"

" Load webdevicons config
lua require('webdevicons_config').my_setup()

let s:bg=synIDattr(synIDtrans(hlID('StatusLine')),'bg')

function s:active_stl()
  if s:make_stl()
    let stl =' %#StatusLineMode#%-11{">> ".ndavid#stl#mode()}%*'
    let icon = luaeval("require'webdevicons_config'.get_icon"
          \ ."{do_hl={true,'StatusLine','StatusLineIcon'}}")
    let stl .= icon.' %f %{ndavid#stl#modified()}%<'.'%#StatusLineBranch#'
          \ .'%{ndavid#stl#branch(1)}%* %{sy#repo#get_stats_decorated()}'
    let &l:stl = stl
  endif
endfunction

function s:innactive_stl()
  if s:make_stl()
    let icon = luaeval("require'webdevicons_config'.get_icon{}")
    let stl = ' %-11{">> "}'
          \.icon.' %f %{ndavid#stl#modified()}%<%{ndavid#stl#branch(0)} '
          \.'%{sy#repo#get_stats_decorated()}'
    let &l:stl = stl
  endif
endfunction

function ndavid#stl#modified()
  if &modifiable
    if &modified
      return '[+] '
    else | return '' | endif
  else | return '[-] ' | endif
endfunction

function ndavid#stl#branch(active)
  let branch = FugitiveHead(8)
  if a:active
    if branch=~#'master\|main'
      execute 'hi StatusLineBranch guifg=#58ca73 guibg='.s:bg
    else | execute 'hi! link StatusLineBranch StatusLine' | endif
  endif
  return branch == '' ? '' : ' ' . branch
endfunction

function s:make_stl()
  return &ft!~'dirvish\|vista_kind\|startify\|vim-plug'
endfunction

function ndavid#stl#mode()
  if match(['i','ix','s','S',"\<C-s>"], mode())!=-1
    let fg='#7daea3'
  elseif match(['R'], mode())!=-1
    let fg='#ea6962'
  elseif match(['v','V',"\<C-v>"], mode())!=-1
    let fg='#89a645'
  endif
  let mode_map = {
        \ 'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE',
        \ 'v': 'VISUAL', 'V': 'V·LINE', "\<C-v>": 'V·BLOCK',
        \ 'c': 'COMMAND', 's': 'SELECT', 'S': 'S·LINE',
        \ "\<C-s>": 'S·BLOCK'
        \ }
  let mode = get(mode_map, mode(), '')
  if mode=~'NORMAL\|COMMAND'
    execute 'hi! link StatusLineMode StatusLine'
  else
    execute 'hi StatusLineMode guibg='.s:bg.' guifg='.fg.' gui=bold'
  endif
  return mode
endfunction

" Update Statusline when entering/leaving
au WinEnter,BufEnter,BufWrite * call s:active_stl()
au WinLeave,BufLeave * call s:innactive_stl()

" Packer statusline
au FileType packer let &l:stl='%=  Packer %='
" Startify statusline
au User StartifyReady let &l:stl='%=  startify %='
" Dirvish statusline
au FileType dirvish let &l:stl='%f%<%=dirvish   '
" Terminal statusline
au TermOpen * let &l:stl='%=  terminal %='
