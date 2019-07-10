" Always moves to the start of git commit message and not the last remembered
" position (https://stackoverflow.com/a/16728794)
:autocmd BufWinEnter <buffer> normal! gg0
