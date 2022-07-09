let s:expect_ver = printf('nvim-%s', '0.7.2')
let s:actual_ver = matchstr(execute('version'), 'NVIM v\zs[^\n]*')

if !has(s:expect_ver)
  echohl Error | echomsg printf("%s required, but got nvim %s!", s:expect_ver, s:actual_ver) | echohl None
  finish
endif

let s:core_conf_files = [
	\ 'globals.vim',
	\ 'options.vim',
    \ 'autocommands.vim',
    \ 'mappings.vim',
    \ 'plugins.vim',
	\ ]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor

set background=dark " or light if you want light mode
colorscheme gruvbox
