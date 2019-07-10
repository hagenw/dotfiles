" Vim color scheme
"
" Name:        southernlights256.vim
" Maintainer:  Jakson Aquino
" Last Change: Fri Apr 22, 2011  11:02AM
" License:     GNU/GPL
"
" Based on other color schemes. The starting point was 'torte'

"set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "southernlights"

if &term =~ "xterm" || &term =~ "256"
    let &t_Co = 256
endif

if $DISPLAY == "" && &t_Co < 256
    hi String cterm=NONE ctermfg=white
    hi Boolean cterm=NONE ctermfg=red
    hi Special cterm=NONE ctermfg=darkyellow
    hi Number cterm=NONE ctermfg=magenta
    hi Comment cterm=NONE ctermfg=darkcyan
    hi Function cterm=NONE ctermfg=cyan
    hi PreProc cterm=NONE ctermfg=lightblue
    hi Type cterm=NONE ctermfg=lightgreen
    hi Character cterm=NONE
    finish
endif

hi Boolean  ctermfg=209 guifg=#ff875f
hi Character    ctermfg=223 guifg=#ffd7af
hi Comment      ctermfg=147 guifg=#afafff
"hi Comment  ctermfg=4
hi Constant ctermfg=219 guifg=#ffafff
hi Conceal  ctermfg=221 ctermbg=black guifg=#ffd75f guibg=black
hi Cursor   ctermfg=Black   ctermbg=Green   cterm=bold  guifg=Black guibg=Green gui=bold
hi CursorLine   ctermbg=234 cterm=NONE  guibg=#1c1c1c gui=NONE
hi CursorColumn ctermbg=234 cterm=NONE  guibg=#1c1c1c gui=NONE
hi ColorColumn  ctermbg=234 cterm=NONE  guibg=#1c1c1c gui=NONE
"hi Directory   ctermfg=27  guifg=#005fff
hi Directory    ctermfg=12 guifg=#1cc7c9
hi Error    ctermbg=131 cterm=NONE
hi ErrorMsg ctermbg=131 cterm=NONE
hi Folded   ctermfg=14  ctermbg=240 guifg=#00ffff   guibg=#585858
hi Function ctermfg=117 guifg=#87d7ff
hi Identifier   ctermfg=cyan    guifg=cyan
hi LineNr          ctermfg=244     ctermbg=NONE     guifg=#808080    guibg=NONE
hi MatchParen      ctermfg=238      ctermbg=221      guifg=#444444    guibg=#ffdf5f
"hi NonText ctermfg=21  guifg=#0000ff
hi NonText ctermfg=12 guifg=#1cc7c9
hi Number   ctermfg=223 guifg=#ffd7af
" Set background to dark color or to transparent (NONE) to use default terminal
" background
"hi Normal   ctermfg=253 ctermbg=Black   guifg=#dadada guibg=Black
"hi PreProc  ctermfg=13  ctermbg=Black   guifg=#ff40ff
hi Normal   ctermfg=253 ctermbg=NONE   guifg=#dadada guibg=NONE
hi PreProc  ctermfg=13  ctermbg=NONE   guifg=#ff40ff
hi Operator ctermfg=204 guifg=#ff5f87
" Set colors for Tab completion menu
hi PmenuSel    ctermfg=119 ctermbg=22  guifg=#87ff5f   guibg=#008700
hi Pmenu ctermfg=Yellow  ctermbg=28  guifg=Yellow    guibg=#005f00
"hi Search term=bold ctermfg=0 ctermbg=244
hi Search       ctermfg=238     ctermbg=221     guifg=#444444    guibg=#ffdf5f
hi IncSearch    ctermfg=238     ctermbg=226     cterm=NONE       guifg=#FFFFFF   guibg=#D75F87   gui=NONE
hi ShowMarksHLl ctermfg=227 ctermbg=28  guifg=#ffff5f   guibg=#008700
hi SignColumn                           guibg=#585858
hi Special  ctermfg=221 guifg=#ffd75f
hi SpecialKey   ctermfg=14  guifg=#00ffff
hi SpellBad ctermfg=red ctermbg=NONE    cterm=UNDERLINE guisp=red   gui=undercurl
"hi SpellBad        ctermfg=210     ctermbg=NONE    cterm=underline  guifg=#FF8787   guibg=NONE      gui=underline
hi SpellLocal   ctermfg=Green   ctermbg=NONE    cterm=UNDERLINE guisp=#00AA00   gui=undercurl
hi SpellRare    ctermfg=Magenta ctermbg=NONE    cterm=UNDERLINE guisp=Magenta   gui=undercurl
"hi Statement    ctermfg=yellow  guifg=yellow    cterm=NONE  gui=NONE
"hi Statement    ctermfg=204 guifg=#ff5f87    cterm=NONE  gui=NONE
hi Statement    ctermfg=yellow  guifg=yellow    cterm=NONE  gui=NONE
hi StatusLine   ctermfg=white   ctermbg=241 guifg=white guibg=#4e4e4e gui=NONE cterm=bold
hi StatusLineNC ctermfg=black   ctermbg=241 guifg=black guibg=#4e4e4e gui=NONE cterm=NONE
hi VertSplit    ctermfg=black   ctermbg=241 guifg=black guibg=gray30 gui=NONE cterm=NONE
hi TabLineSel   ctermfg=black   ctermbg=244 cterm=NONE  guifg=black guibg=#808080 gui=NONE
hi TabLine      ctermfg=234 ctermbg=240 cterm=NONE  guifg=black guibg=#585858 gui=NONE
hi TabLineFill  ctermfg=black   ctermbg=235 cterm=NONE  guifg=black guibg=#262626 gui=NONE
hi String   ctermfg=229 guifg=#ffffaf
hi Title    cterm=bold  ctermfg=Magenta gui=bold    guifg=Magenta
hi Type     ctermfg=77  guifg=#5fd75f   gui=NONE
hi vimCommentString ctermfg=147 guifg=#afafff   gui=italic
hi Visual   ctermfg=248 guifg=#a8a8a8   ctermbg=237 guibg=#3a3a3a
hi WarningMsg   ctermfg=red

" html
hi htmlLink         cterm=UNDERLINE ctermfg=105 gui=UNDERLINE   guifg=#8787ff
hi htmlBold         cterm=BOLD          gui=BOLD
hi htmlBoldItalic       cterm=BOLD,ITALIC       gui=BOLD,ITALIC
hi htmlBoldUnderline        cterm=BOLD,UNDERLINE        gui=BOLD,UNDERLINE
hi htmlBoldUnderlineItalic  cterm=BOLD,UNDERLINE,ITALIC gui=BOLD,UNDERLINE,ITALIC
hi htmlItalic           cterm=ITALIC            gui=ITALIC
hi htmlUnderline        cterm=UNDERLINE         gui=UNDERLINE
hi htmlUnderlineItalic      cterm=UNDERLINE,ITALIC      gui=UNDERLINE,ITALIC

" mail
hi mailHeader  ctermfg=229 guifg=#ffffaf
hi mailSubject ctermfg=yellow guifg=yellow
hi mailQuoted1 ctermfg=48 guifg=#00ff87
hi mailQuoted2 ctermfg=51 guifg=#00ffff
hi mailQuoted3 ctermfg=39 guifg=#00afff
hi mailQuoted4 ctermfg=33 guifg=#0087ff
hi mailQuoted5 ctermfg=27 guifg=#005fff
hi mailQuoted6 ctermfg=21 guifg=#0000ff
hi mailSignature ctermfg=209 guifg=#ff875f

" diff
" the following code didn't work for me, I needed the lines below
"hi diffAdded   ctermfg=40  guifg=#00d700
"hi diffRemoved ctermfg=210 guifg=#ff8787
"hi diffFile    ctermfg=117 guifg=#87d7ff
"hi diffOldFile ctermfg=117 guifg=#87d7ff
"hi diffNewFile ctermfg=117 guifg=#87d7ff
"hi diffLine    ctermfg=yellow  guifg=yellow
hi DiffAdd  ctermfg=119 ctermbg=22
hi DiffChange   ctermbg=241
"hi DiffDelete  ctermbg=9 ctermfg=204
hi DiffDelete  ctermbg=88 ctermfg=197
hi DiffText     ctermfg=11 ctermbg=243

" wdiff
hi link wdiffOld diffRemoved
hi link wdiffNew diffAdded
