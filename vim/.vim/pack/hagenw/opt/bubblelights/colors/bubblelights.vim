" Vim color scheme
"
" Name:        bubblelights.vim
" Maintainer:  hagenw (hagenw@posteo.de)
" Version:     0.5
" License:     MIT
"
" Based on `southernlights` (https://github.com/jalvesaq/southernlights)
" and `bubblegum` (https://github.com/baskerville/bubblegum).

"
" For vim in the terminal no background color is specified in order to select
" your default terminal background color. The background should be dark and a
" good choice for this theme would be 238 (#444444).
"
" For a list of the 256 available colors, see
" https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
"
" To show the colors directly in this file you can use the Colorizer
" (github.com/chrisbra/Colorizer) plugin and run `:ColorHighlight´
"

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "bubblelights"

if &term =~ "xterm" || &term =~ "256"
    let &t_Co = 256
endif

if $DISPLAY == "" && &t_Co < 256
    hi String       ctermfg=white       cterm=NONE
    hi Boolean      ctermfg=red         cterm=NONE
    hi Special      ctermfg=darkyellow  cterm=NONE
    hi Number       ctermfg=magenta     cterm=NONE
    hi Comment      ctermfg=darkcyan    cterm=NONE
    hi Function     ctermfg=cyan        cterm=NONE
    hi PreProc      ctermfg=lightblue   cterm=NONE
    hi Type         ctermfg=lightgreen  cterm=NONE
    hi Character    ctermfg=NONE        cterm=NONE
    finish
endif

"
" Terminal colors
" 0             1           2           3           4           5           6           7
" black         darkred     darkgreen   darkyellow  darkblue    darkmagenta darkcyan    darkwhite
" ctermfg=0     ctermfg=1   ctermfg=2   ctermfg=3   ctermfg=4   ctermfg=5   ctermfg=6   ctermfg=7
"
" 8             9           10          11          12          13          14          15
" gray          red         green       yellow      blue        magenta     cyan        white
" ctermfg=8     ctermfg=9   ctermfg=10  ctermfg=11  ctermfg=12  ctermfg=13  ctermfg=14  ctermfg=15
"

"
" PREFERRED GROUPS
" (see `:h w18`)
"
hi Normal                   ctermfg=253     ctermbg=NONE    cterm=NONE      guifg=#dadada   guibg=#444444   gui=NONE
hi Comment                  ctermfg=147     ctermbg=NONE    cterm=NONE      guifg=#afafff   guibg=NONE      gui=NONE

hi Constant                 ctermfg=219     ctermbg=NONE    cterm=NONE      guifg=#ffafff   guibg=NONE      gui=NONE
hi String                   ctermfg=229     ctermbg=NONE    cterm=NONE      guifg=#ffffaf   guibg=NONE      gui=NONE
hi Character                ctermfg=223     ctermbg=NONE    cterm=NONE      guifg=#ffd7af   guibg=NONE      gui=NONE
hi Number                   ctermfg=223     ctermbg=NONE    cterm=NONE      guifg=#ffd7af   guibg=NONE      gui=NONE
hi Boolean                  ctermfg=209     ctermbg=NONE    cterm=NONE      guifg=#ff875f   guibg=NONE      gui=NONE
hi Float                    ctermfg=223     ctermbg=NONE    cterm=NONE      guifg=#ffd7af   guibg=NONE      gui=NONE

hi Identifier               ctermfg=6       ctermbg=NONE    cterm=NONE      guifg=#a1b5cd   guibg=NONE      gui=NONE
hi Function                 ctermfg=117     ctermbg=NONE    cterm=NONE      guifg=#87d7ff   guibg=NONE      gui=NONE

hi Statement                ctermfg=11      ctermbg=NONE    cterm=BOLD      guifg=#cdcdc1   guibg=NONE      gui=NONE
hi Conditional              ctermfg=11      ctermbg=NONE    cterm=BOLD      guifg=#cdcdc1   guibg=NONE      gui=NONE
hi Repeat                   ctermfg=11      ctermbg=NONE    cterm=BOLD      guifg=#cdcdc1   guibg=NONE      gui=NONE
hi Label                    ctermfg=11      ctermbg=NONE    cterm=BOLD      guifg=#cdcdc1   guibg=NONE      gui=NONE
hi Operator                 ctermfg=204     ctermbg=NONE    cterm=NONE      guifg=#ff5f87   guibg=NONE      gui=NONE
hi Keyword                  ctermfg=11      ctermbg=NONE    cterm=BOLD      guifg=#cdcdc1   guibg=NONE      gui=NONE
hi Exception                ctermfg=11      ctermbg=NONE    cterm=BOLD      guifg=#cdcdc1   guibg=NONE      gui=NONE

hi PreProc                  ctermfg=13      ctermbg=NONE    cterm=NONE      guifg=#cdbfaf   guibg=NONE      gui=NONE
hi Include                  ctermfg=13      ctermbg=NONE    cterm=NONE      guifg=#cdbfaf   guibg=NONE      gui=NONE
hi Define                   ctermfg=13      ctermbg=NONE    cterm=NONE      guifg=#cdbfaf   guibg=NONE      gui=NONE
hi Macro                    ctermfg=13      ctermbg=NONE    cterm=NONE      guifg=#cdbfaf   guibg=NONE      gui=NONE
hi PreCondit                ctermfg=13      ctermbg=NONE    cterm=NONE      guifg=#cdbfaf   guibg=NONE      gui=NONE

hi Type                     ctermfg=77      ctermbg=NONE    cterm=NONE      guifg=#5fd75f   guibg=NONE      gui=NONE
hi StorageClass             ctermfg=77      ctermbg=NONE    cterm=NONE      guifg=#5fd75f   guibg=NONE      gui=NONE
hi Structure                ctermfg=77      ctermbg=NONE    cterm=NONE      guifg=#5fd75f   guibg=NONE      gui=NONE
hi Typedef                  ctermfg=77      ctermbg=NONE    cterm=NONE      guifg=#5fd75f   guibg=NONE      gui=NONE

hi Special                  ctermfg=221     ctermbg=NONE    cterm=NONE      guifg=#ffd75f   guibg=NONE      gui=NONE
hi SpecialChar              ctermfg=221     ctermbg=NONE    cterm=NONE      guifg=#ffd75f   guibg=NONE      gui=NONE
hi Tag                      ctermfg=221     ctermbg=NONE    cterm=NONE      guifg=#ffd75f   guibg=NONE      gui=NONE
hi Delimiter                ctermfg=221     ctermbg=NONE    cterm=NONE      guifg=#ffd75f   guibg=NONE      gui=NONE
hi SpecialComment           ctermfg=221     ctermbg=NONE    cterm=NONE      guifg=#ffd75f   guibg=NONE      gui=NONE
hi Debug                    ctermfg=221     ctermbg=NONE    cterm=NONE      guifg=#ffd75f   guibg=NONE      gui=NONE

hi Underlined               ctermfg=81      ctermbg=NONE    cterm=UNDERLINE guifg=#5fd7ff   guibg=NONE      gui=UNDERLINE

hi Ignore                   ctermfg=fg      ctermbg=NONE    cterm=NONE      guifg=fg        guibg=NONE      gui=NONE

hi Error                    ctermfg=fg      ctermbg=131     cterm=NONE      guifg=NONE      guibg=#af5f5f   gui=NONE

hi Todo                     ctermfg=238     ctermbg=147     cterm=BOLD      guifg=#444444   guibg=#afafff   gui=BOLD


"
" MINOR GROUPS
"
hi StatusLine               ctermfg=15      ctermbg=241     cterm=BOLD      guifg=#ffffff   guibg=#4e4e4e   gui=NONE
hi StatusLineNC             ctermfg=238     ctermbg=241     cterm=NONE      guifg=#444444   guibg=#4e4e4e   gui=NONE

hi TabLine                  ctermfg=fg      ctermbg=237     cterm=NONE      guifg=fg        guibg=#3a3a3a   gui=NONE
hi TabLineSel               ctermfg=250     ctermbg=NONE    cterm=BOLD      guifg=#a8a8a8   guibg=#444444   gui=NONE
hi TabLineFill              ctermfg=fg      ctermbg=237     cterm=NONE      guifg=fg        guibg=#3a3a3a   gui=NONE

" Buftabline plugin
" https://github.com/ap/vim-buftabline
" Alternative color for BufTabLineCurrent might be 109
hi BufTabLineCurrent        ctermfg=250     ctermbg=NONE    cterm=BOLD      guifg=#a8a8a8   guibg=#444444   gui=NONE
hi BufTabLineActive         ctermfg=fg      ctermbg=237     cterm=NONE      guifg=fg        guibg=#3a3a3a   gui=NONE
hi BufTabLineHidden         ctermfg=248     ctermbg=237     cterm=NONE      guifg=#a8a8a8   guibg=#3a3a3a   gui=NONE
hi BufTabLineFill           ctermfg=fg      ctermbg=237     cterm=NONE      guifg=fg        guibg=#3a3a3a   gui=NONE

" Menu (e.g. after autocompletion)
hi Pmenu                    ctermfg=240     ctermbg=221     cterm=NONE      guifg=#585858   guibg=#ffd75f   gui=NONE
hi PmenuSel                 ctermfg=238     ctermbg=226     cterm=NONE      guifg=#444444   guibg=#ffff00   gui=NONE
hi PmenuSbar                ctermfg=NONE    ctermbg=253     cterm=NONE      guifg=NONE      guibg=#dadada   gui=NONE
hi PmenuThumb               ctermfg=NONE    ctermbg=248     cterm=NONE      guifg=NONE      guibg=#a8a8a8   gui=NONE
hi WildMenu                 ctermfg=238     ctermbg=226     cterm=BOLD      guifg=#444444   guibg=#ffff00   gui=BOLD

" Selection
hi Visual                   ctermfg=238     ctermbg=253     cterm=NONE      guifg=#a8a8a8   guibg=#3a3a3a   gui=NONE
hi VisualNOS                ctermfg=238     ctermbg=253     cterm=NONE      guifg=#a8a8a8   guibg=#3a3a3a   gui=NONE

hi VertSplit                ctermfg=0       ctermbg=241     cterm=NONE      guifg=#000000   guibg=#626262   gui=NONE
hi LineNr                   ctermfg=244     ctermbg=NONE    cterm=NONE      guifg=#808080   guibg=NONE      gui=NONE

hi Title                    ctermfg=13      ctermbg=NONE    cterm=BOLD      guifg=#ff00ff   guibg=NONE      gui=BOLD
hi SpecialKey               ctermfg=168     ctermbg=NONE    cterm=BOLD      guifg=#d75f87   guibg=NONE      gui=NONE
hi NonText                  ctermfg=12      ctermbg=NONE    cterm=NONE      guifg=#5c5cff   guibg=NONE      gui=NONE
hi MatchParen               ctermfg=168     ctermbg=238     cterm=BOLD      guifg=#d75f87   guibg=#444444   gui=NONE
hi Directory                ctermfg=12      ctermbg=NONE    cterm=NONE      guifg=#5c5cff   guibg=NONE      gui=NONE

hi ErrorMsg                 ctermfg=NONE    ctermbg=131     cterm=NONE      guifg=NONE      guibg=#af5f5f   gui=NONE
hi WarningMsg               ctermfg=9       ctermbg=NONE    cterm=NONE      guifg=#ff0000   guibg=NONE      gui=NONE
hi MoreMsg                  ctermfg=228     ctermbg=NONE    cterm=NONE      guifg=#ffff87   guibg=NONE      gui=NONE
hi ModeMsg                  ctermfg=fg      ctermbg=NONE    cterm=BOLD      guifg=fg        guibg=NONE      gui=BOLD
hi Question                 ctermfg=228     ctermbg=NONE    cterm=NONE      guifg=#ffff87   guibg=NONE      gui=NONE

" Pink IncSearch and orange Search
" Alternative color for IncSearch bg: 226 as for menu selection
hi Search                   ctermfg=240     ctermbg=221     cterm=NONE      guifg=#444444   guibg=#ffdf5f   gui=NONE
hi IncSearch                ctermfg=238     ctermbg=168     cterm=NONE      guifg=#444444   guibg=#d75f87   gui=NONE

hi Folded                   ctermfg=14      ctermbg=240     cterm=NONE      guifg=#00ffff   guibg=#585858   gui=NONE
hi FoldColumn               ctermfg=244     ctermbg=NONE    cterm=NONE      guifg=#808080   guibg=NONE      gui=NONE
hi SignColumn               ctermfg=244     ctermbg=NONE    cterm=NONE      guifg=#808080   guibg=NONE      gui=NONE
hi ColorColumn              ctermfg=NONE    ctermbg=237     cterm=NONE      guifg=NONE      guibg=#3a3a3a   gui=NONE

hi Cursor                   ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#444444   guibg=#d75f87   gui=BOLD
hi CursorLine               ctermfg=NONE    ctermbg=237     cterm=NONE      guifg=NONE      guibg=#3a3a3a   gui=NONE
hi CursorColumn             ctermfg=NONE    ctermbg=237     cterm=NONE      guifg=NONE      guibg=#3a3a3a   gui=NONE

hi vimCommentString         ctermfg=147     ctermbg=NONE    cterm=NONE      guifg=#afafff   guibg=NONE      gui=NONE

hi SpellBad                 ctermfg=9       ctermbg=NONE    cterm=UNDERLINE guifg=#ff0000   guibg=NONE      gui=UNDERLINE
hi SpellCap                 ctermfg=111     ctermbg=NONE    cterm=UNDERLINE guifg=#87afff   guibg=NONE      gui=UNDERLINE
hi SpellRare                ctermfg=179     ctermbg=NONE    cterm=UNDERLINE guisp=#dfaf5f   guibg=NONE      gui=UNDERCURL
hi SpellLocal               ctermfg=179     ctermbg=NONE    cterm=UNDERLINE guisp=#dfaf5f   guibg=NONE      gui=UNDERCURL

hi Conceal                  ctermfg=221     ctermbg=NONE    cterm=NONE      guifg=#ffd75f   guibg=NONE      gui=NONE
hi ShowMarksHLl             ctermfg=227     ctermbg=28      cterm=NONE      guifg=#ffff5f   guibg=#008700   gui=NONE

" CtrlP (https://github.com/ctrlpvim/ctrlp.vim)
hi CtrlPNoEntries           ctermfg=fg      ctermbg=168     cterm=NONE      guifg=fg        guibg=#d75f87   gui=NONE
hi CtrlPMatch               ctermfg=168     ctermbg=NONE    cterm=NONE      guifg=#d75f87   guibg=NONE      gui=NONE
hi CtrlPLinePre             ctermfg=244     ctermbg=NONE    cterm=NONE      guifg=#808080   guibg=NONE      gui=NONE

" diff
hi DiffAdd                  ctermfg=119     ctermbg=22      cterm=NONE      guifg=#87ff5f   guibg=#005f00   gui=NONE
hi DiffChange               ctermfg=NONE    ctermbg=241     cterm=NONE      guifg=NONE      guibg=#626262   gui=NONE
hi DiffDelete               ctermfg=197     ctermbg=88      cterm=NONE      guifg=#ff005f   guibg=#870000   gui=NONE
hi DiffText                 ctermfg=11      ctermbg=243     cterm=NONE      guifg=#cdcdc1   guibg=#767676   gui=NONE
hi link wdiffOld diffDelete
hi link wdiffNew diffAdd

" mail
hi mailHeader               ctermfg=229     ctermbg=NONE    cterm=NONE      guifg=#ffffaf   guibg=NONE      gui=NONE
hi mailSubject              ctermfg=11      ctermbg=NONE    cterm=NONE      guifg=#cdcdc1   guibg=NONE      gui=NONE
hi mailQuoted1              ctermfg=48      ctermbg=NONE    cterm=NONE      guifg=#00ff87   guibg=NONE      gui=NONE
hi mailQuoted2              ctermfg=51      ctermbg=NONE    cterm=NONE      guifg=#00ffff   guibg=NONE      gui=NONE
hi mailQuoted3              ctermfg=39      ctermbg=NONE    cterm=NONE      guifg=#00afff   guibg=NONE      gui=NONE
hi mailQuoted4              ctermfg=33      ctermbg=NONE    cterm=NONE      guifg=#0087ff   guibg=NONE      gui=NONE
hi mailQuoted5              ctermfg=27      ctermbg=NONE    cterm=NONE      guifg=#005fff   guibg=NONE      gui=NONE
hi mailQuoted6              ctermfg=21      ctermbg=NONE    cterm=NONE      guifg=#0000ff   guibg=NONE      gui=NONE
hi mailSignature            ctermfg=249     ctermbg=NONE    cterm=NONE      guifg=#b2b2b2   guibg=NONE      gui=NONE

" html
hi htmlLink                 ctermfg=105     ctermbg=NONE    cterm=UNDERLINE guifg=#8787ff   guibg=NONE      gui=UNDERLINE
hi htmlBold                                                 cterm=BOLD                                      gui=BOLD
hi htmlBoldItalic                                           cterm=BOLD,ITALIC                               gui=BOLD,ITALIC
hi htmlBoldUnderline                                        cterm=BOLD,UNDERLINE                            gui=BOLD,UNDERLINE
hi htmlBoldUnderlineItalic                                  cterm=BOLD,UNDERLINE,ITALIC                     gui=BOLD,UNDERLINE,ITALIC
hi htmlItalic                                               cterm=ITALIC                                    gui=ITALIC
hi htmlUnderline                                            cterm=UNDERLINE                                 gui=UNDERLINE
hi htmlUnderlineItalic                                      cterm=UNDERLINE,ITALIC                          gui=UNDERLINE,ITALIC

" vim:set textwidth=120:
