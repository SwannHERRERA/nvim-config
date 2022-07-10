" Save key strokes (now we do not need to press shift to enter command mode).
" Vim-sneak has also mapped `;`, so using the below mapping will break the map
" used by vim-sneak
nnoremap ; :
xnoremap ; :

" Quicker way to open command window
nnoremap q; q:

" Keep cursor position after yanking
nnoremap y myy
xnoremap y myy

augroup restore_after_yank
  autocmd!
  autocmd TextYankPost *  call s:restore_cursor()
augroup END

" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_

function! s:restore_cursor() abort
  silent! normal `y
  silent! delmarks y
endfunction

