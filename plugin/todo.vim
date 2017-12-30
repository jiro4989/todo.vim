" Vim plugin for write todo note.
" Last Change: 2017/12/30
" Maintainer:  Jiro <jiroron666@gmail.com>
" License:     This file is placed in the public domain.

if exists("g:loaded_todo")
  finish
endif
let g:loaded_todo = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists(":ToggleDone")
  command! -nargs=0 ToggleDone call todo#toggle(getline('.'))
  nnoremap X :ToggleDone<CR>
endif

if !exists(":CreateTodoFile")
  command! -nargs=0 CreateTodoFile call todo#create_new_todonote()
  nnoremap <Leader>tc :CreateTodoFile<CR>
endif

let &cpo = s:save_cpo
unlet s:save_cpo
