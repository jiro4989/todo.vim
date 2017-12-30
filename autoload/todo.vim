let s:save_cpo = &cpo
set cpo&vim

" マークダウンのチェックボックスにマークON/OFFする
function! todo#toggle(line)
  if a:line =~ '^\s*-\s*\[x\]'
    call setline('.', substitute(a:line, '\[x\]<[^>]\+>', '\[ \]', ''))
  else
    let l:now = strftime('%Y/%m/%d %H:%M:%S')
    call setline('.', substitute(a:line, '\[\s*\]\s*', '\[x\]<' . l:now . '> ', ''))
    unlet l:now
  endif
endfunction

" todoメモファイルをDocuments配下に作成して開く
function! todo#create_new_todonote()
  let l:todo_dir = $HOME . "/Documents/todo/"
  if !isdirectory(l:todo_dir)
    call mkdir(l:todo_dir)
  endif

  let l:todo_file = l:todo_dir . strftime('%Y%m%d.txt')
  if filereadable(l:todo_file)
    exec ':e ' . escape(l:todo_file, ' ')
  else
    exec ':e ' . escape(l:todo_file, ' ')
    call setline(1, '- [ ] ')
  endif

  unlet l:todo_dir
  unlet l:todo_file
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
