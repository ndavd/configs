" --- Set statusline ----------------------------------------------------"

" Load webdevicons config
lua require('webdevicons_config').my_setup()

function ActiveStatusline()
  if MakeStatln()
    let l:stl = "%#StatlnM# %{DetectMode()} "
          \ ."%#StatlnSepM#%#StatlnBG# "
    if FugitiveHead() != ''
      let l:stl .= "%#StatlnGit# "
            \ ."%#StatlnBG#%{FugitiveHead()} "
    endif
    let l:icon = luaeval("require'webdevicons_config'.get_icon"
          \ ."{do_hl={true,'StatlnBG','StatlnIconAc'}}")
    let l:stl .= l:icon." %f %m%<%="
          \ ." %#StatlnSep1#%#StatlnCmp1# %2l(%L):%-2c"
          \ ." %#StatlnCmp2#"
          \ ." %{strftime('%a %d/%m  %H:%M:%S ')}"
    execute("setl stl=".escape(l:stl, ' '))
  endif
endfunction

function InnactiveStatusline()
  if MakeStatln()
    let l:icon =
          \ luaeval("require'webdevicons_config'.get_icon{}")
    let l:stl = " ".l:icon
          \ ." %f %m%<%#StatlnInacSep1#%#StatlnBG#%="
          \ ."%#StatlnInacSep1#%#StatlnInacCmp#"
          \ ." %2l(%L):%-2c%#StatlnInacSep2# "
    execute("setl stl=".escape(l:stl, ' '))
  endif
endfunction

function MakeStatln()
  return &ft!~'dirvish\|vista_kind\|startify\|vim-plug'
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
au WinEnter,BufEnter,BufWrite * call ActiveStatusline()
au WinLeave,BufLeave * call InnactiveStatusline()

" Force statusline update every x time
let SLtimer = timer_start(500, 'UpdateStatusline', {'repeat':-1})
function! UpdateStatusline(SLtimer)
  execute 'let &ro=&ro'
endfunction

" Packer statusline
au FileType packer set stl =%=\\ \ Packer\ \%=
" Terminal statusline
au TermOpen * setl statusline =%=\\ \\ terminal\ \%=
