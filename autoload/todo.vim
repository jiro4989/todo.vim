let s:save_cpo = &cpo
set cpo&vim

function! todo#toggle(line)
  if a:line =~ '^\s*-\s*\[x\]'
    call setline('.', substitute(a:line, '\[x\]<[^>]\+>', '\[ \]', ''))
  else
    let l:now = strftime('%Y/%m/%d %H:%M:%S')
    call setline('.', substitute(a:line, '\[\s*\]\s*', '\[x\]<' . l:now . '> ', ''))
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
