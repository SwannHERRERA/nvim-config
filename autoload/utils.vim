function! utils#Get_titlestr() abort
  let l:title_str = ''
  if g:is_linux
      let l:title_str = hostname() . '  '
  endif

  let l:buf_path = expand('%:p:~')
  let l:title_str = l:title_str . l:buf_path . '  '
  if &buflisted && l:buf_path != ""
    let l:title_str = l:title_str . strftime('%Y-%m-%d %H:%M %Z',getftime(expand('%')))
  endif

  return l:title_str
endfunction

" Check if we are inside a Git repo.
function! utils#Inside_git_repo() abort
  let res = system('git rev-parse --is-inside-work-tree')
  if match(res, 'true') == -1
    return v:false
  else
    " Manually trigger a specical user autocmd InGitRepo (to use it for
    " lazyloading of fugitive by packer.nvim).
    " See also https://github.com/wbthomason/packer.nvim/discussions/534.
    doautocmd User InGitRepo
    return v:true
  endif
endfunction

" Create command alias safely, see https://stackoverflow.com/q/3878692/6064933
" The following two functions are taken from answer below on SO:
" https://stackoverflow.com/a/10708687/6064933
function! utils#Cabbrev(key, value) abort
  execute printf('cabbrev <expr> %s (getcmdtype() == ":" && getcmdpos() <= %d) ? %s : %s',
        \ a:key, 1+len(a:key), <SID>Single_quote(a:value), <SID>Single_quote(a:key))
endfunction

function! s:Single_quote(str) abort
  return "'" . substitute(copy(a:str), "'", "''", 'g') . "'"
endfunction
