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
badd +43 src/readorders.jl
badd +1670 term://~/Obsi/Prods/03-⇅\ monitor//19039:/bin/bash
badd +12 src/gptreadorders.jl
badd +0 margin_trades_BTCUSDT_202531DD_213120.csv
badd +1 margin_trades_BTCUSDT_202534DD_213443.csv
badd +0 margin_trades_BTCUSDT_202553DD_215311.csv
badd +0 \[
badd +0 SUBSCRIBE,
badd +1 ⇅monitor.models.drawio
argglobal
%argdel
$argadd src/readorders.jl
set stal=2
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit src/gptreadorders.jl
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
let s:l = 12 - ((11 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 12
normal! 023|
lcd ~/Obsi/Prods/03-⇅\ monitor
tabnext
argglobal
if bufexists(fnamemodify("term://~/Obsi/Prods/03-⇅\ monitor//19039:/bin/bash", ":p")) | buffer term://~/Obsi/Prods/03-⇅\ monitor//19039:/bin/bash | else | edit term://~/Obsi/Prods/03-⇅\ monitor//19039:/bin/bash | endif
if &buftype ==# 'terminal'
  silent file term://~/Obsi/Prods/03-⇅\ monitor//19039:/bin/bash
endif
balt ~/Obsi/Prods/03-⇅\ monitor/src/readorders.jl
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1749 - ((50 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1749
normal! 040|
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
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
