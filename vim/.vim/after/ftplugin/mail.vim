" Writing mails with mutt
setlocal spell
setlocal textwidth=75
" Allow flowed text (http://bit.ly/2xkpXS3)
" Add format option 'w' to add trailing white space, indicating that paragraph
" continues on next line. This is to be used with mutt's 'text_flowed' option.
" See:
"   http://bit.ly/2xkpXS3
"   https://brianbuccola.com/line-breaks-in-mutt-and-vim/
"   https://joeclark.org/ffaq.html
setlocal formatoptions+=w
setlocal nojoinspaces
" Mark trailing spaces, so we know we are doing flowed format right
"match ErrorMsg '\s\+$'
set list
" Showing the empty space at the end of the line increases the textwidth by one,
" so we show the texrtwidth indicator one farer to the right.
if exists('w:matchId') |
    \     call matchdelete(333) |
    \ endif |
    \ exe 'let w:matchId = matchadd(''ColorColumn'', '.
    \     '''\%''.(&textwidth+2).''v'', 100, 333)'
