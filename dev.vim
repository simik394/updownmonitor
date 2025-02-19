let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Obsi/Prods/03-⇅\ monitor
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +17 docker/monitor.Dockerfile
badd +820 term://~/Obsi/Prods/03-⇅\ monitor//85841:/bin/bash
badd +0 term://~/Obsi/Prods/03-⇅\ monitor//102017:/bin/bash
badd +2 utils/buildmonitor.sh
badd +2 utils/runmonitor.sh
badd +18 src/readbinws.jl
argglobal
%argdel
$argadd docker/monitor.Dockerfile
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit src/readbinws.jl
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 18 - ((17 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 18
normal! 0
lcd ~/Obsi/Prods/03-⇅\ monitor
tabnext
argglobal
if bufexists(fnamemodify("term://~/Obsi/Prods/03-⇅\ monitor//85841:/bin/bash", ":p")) | buffer term://~/Obsi/Prods/03-⇅\ monitor//85841:/bin/bash | else | edit term://~/Obsi/Prods/03-⇅\ monitor//85841:/bin/bash | endif
if &buftype ==# 'terminal'
  silent file term://~/Obsi/Prods/03-⇅\ monitor//85841:/bin/bash
endif
balt ~/Obsi/Prods/03-⇅\ monitor/docker/monitor.Dockerfile
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 2873 - ((40 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2873
normal! 030|
tabnext
argglobal
if bufexists(fnamemodify("term://~/Obsi/Prods/03-⇅\ monitor//102017:/bin/bash", ":p")) | buffer term://~/Obsi/Prods/03-⇅\ monitor//102017:/bin/bash | else | edit term://~/Obsi/Prods/03-⇅\ monitor//102017:/bin/bash | endif
if &buftype ==# 'terminal'
  silent file term://~/Obsi/Prods/03-⇅\ monitor//102017:/bin/bash
endif
balt term://~/Obsi/Prods/03-⇅\ monitor//85841:/bin/bash
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 156 - ((22 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 156
normal! 0
tabnext 1
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
