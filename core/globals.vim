"{ Global Variable
"{{ Custom variables
let g:is_win = (has('win32') || has('win64')) ? v:true : v:false
let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false
let g:is_mac = has('macunix') ? v:true : v:false
let g:logging_level = 'info'
"}}


" Path to Python 3 interpreter (must be an absolute path), make startup
" faster. See https://neovim.io/doc/user/provider.html.
if executable('python')
   if g:is_win
    let g:python3_host_prog=substitute(exepath('python'), '.exe$', '', 'g')
  elseif g:is_linux || g:is_mac
    let g:python3_host_prog=exepath('python')
  endif
else
  echoerr 'Python 3 executable not found! You must install Python 3 and set its PATH correctly!'
endif

" Custom mapping <leader> (see `:h mapleader` for more info)
let g:mapleader = ','

" Enable highlighting for lua HERE doc inside vim script
let g:vimsyn_embed = 'l'

" Use English as main language
language en_US.utf-8

" use filetype.lua instead of filetype.vim
let g:do_filetype_lua = 1
let g:did_load_filetypes = 0
"}}

" Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
" related to checking files inside compressed files)
let g:loaded_zipPlugin = 1
let loaded_gzip = 1
let g:loaded_tarPlugin = 1

let g:loaded_tutor_mode_plugin = 1  " do not load the tutor plugin

" Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
"}}

" Disable sql omni completion, it is broken.
let g:loaded_sql_completion = 1
"}

