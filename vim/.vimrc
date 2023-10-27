"------- Vim configuration ---------------------------------------------------
"                                                                             '
" Maintainer:  hagenw (hagenw@posteo.de)                                      '
" Version:     1.0                                                            '
" License:     MIT                                                            '
"                                                                             '
"-----------------------------------------------------------------------------


"------- COMMON SETTINGS -----------------------------------------------------
"                                                                             '
" Standard tabsize, text highlight and color theme.                           '
"-----------------------------------------------------------------------------'
set nocompatible          " no compatibility to vi
syntax on                 " syntax highlighting
set hlsearch              " highlight searched words
set incsearch             " display immediately matched pattern
set sw=4                  " shift width = tab size on the screen
set ts=4                  " tab size
set expandtab             " expand tabs to shifts
set autoindent            " autoindent
set autowrite             " store changes automatically
set autoread              " update file automatically on change
set wildmenu              " show possibilities of tab completion for :


"------- COLORSCHEME ---------------------------------------------------------
"                                                                             '
" Bubblelights (https://github.com/hagenw/bubblelights)                       '
"-----------------------------------------------------------------------------'
colorscheme bubblelights


"------- TEXT WRAPPING -------------------------------------------------------
"                                                                             '
" Wrap text after 80 characters and use BufNewFile to highlight lines that    '
" extand above this margin. If you change the textwidth in the file, run :e   '
" to update the highlight. Run :set fo=cawq to wrap only comments.            '
"-----------------------------------------------------------------------------'
set textwidth=80
set formatoptions-=t  " no automatic text wrapping
set formatoptions+=c  " wrap comments automatically
au BufRead,BufNewFile *
    \ if exists('w:matchId') |
    \     call matchdelete(333) |
    \ endif |
    \ exe 'let w:matchId = matchadd(''ColorColumn'', '.
    \     '''\%''.(&textwidth+1).''v'', 100, 333)'


"------- KEYBOARD SHORTCUTS --------------------------------------------------
"                                                                             '
"     ,         ,,        ,k        ,l        ,c        ,e                    '
"     <C-y>     <C-p>     <C-r>     ,r        ,q                              '
"     <C-n>     <C-b>                                                         '
"     <A-Up>    <A-Down>  <A-Left>  <A-Right> +         -         _           '
"                                                                             '
" Keyboard shortcuts for various actions, grouped in subsections.             '
"-----------------------------------------------------------------------------'
"
"----- Leader key
" Set the leader key from \ to ,
let mapleader = ","
" Show all available leader shortcuts
nnoremap <leader>k :map ,<CR>
"
"----- Copy/Paste
" Copy into system clipboard (http://bit.ly/2hgxFrp)
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
"
"----- Replace highlighted word
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
"
"----- Working with multiple files
" Toggle between open files by CRTL-n and CRTL-b
nmap <silent> <C-n> :bnext<CR>
nmap <silent> <C-b> :bprev<CR>
" Close current tab/buffer
map <leader>q :bdel<CR>
" Switch to last file in buffer
nnoremap <leader><leader> <C-^>
" Close Quickfix window
map <leader>c :ccl<CR>
" Execute open file
nnoremap <leader>e :w<CR>:!./%<CR>
"
"----- Split windows
" Move between split windows by meta and key files
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
" Allow the same in insert mode
imap <silent> <A-Up> <C-o>:wincmd k<CR>
imap <silent> <A-Down> <C-o>:wincmd j<CR>
imap <silent> <A-Left> <C-o>:wincmd h<CR>
imap <silent> <A-Right> <C-o>:wincmd l<CR>
" Resize split windows just by + and -
nmap - <C-W>-
nmap + <C-W>+
" Make window fullscreen and show window name for other windows
nmap <silent> _ :wincmd _<CR>
set wmh=0
"
"----- Line numbers
" Toggle displaying line number
nnoremap <silent> <leader>l :set invnumber<CR>


"------- SPELLCHECKING -------------------------------------------------------
"                                                                             '
"     zg    zw                                                                '
"                                                                             '
" The spell files are stored under ~/.local/share/vim/spell to store them     '
" outside of ~/.vim. This requires the `set runtimepath` part.                '
" The additional spellfile  `spell.utf-8.add` stores all the words added by   '
" `zg´. With `zw´ a word can be marked as wrong.                              '
"-----------------------------------------------------------------------------'
set spelllang=en,de
set spellsuggest=fast,20
set runtimepath+=$HOME/.local/share/vim
set spellfile=$HOME/.local/share/vim/spell/spell.utf-8.add


"------- HIGHLIGHT SEARCH RESULT UNDER CURSOR --------------------------------
"                                                                             '
"     n    N    \                                                             '
"                                                                             '
" After a search `n´ and `N´ are used to jump to the matched patterns.        '
" This highlights the current jumped to pattern with the IncSearch instead    '
" of the Search color. `\´ removes the highlight of the search pattern.       '
"-----------------------------------------------------------------------------'
nnoremap <silent> n n:call HighlightNearCursor(@/)<CR>
nnoremap <silent> N N:call HighlightNearCursor(@/)<CR>
nnoremap <silent> \ :noh<CR>
function HighlightNearCursor(pattern)
    " find word under cursor and in this word the search string
    let my_pattern="/\\k*\\%#\\k*\\&".a:pattern."/"
    execute 'match IncSearch ' my_pattern
endfunction


"------- HIGHLIGHT WRONG WHITESPACES AND TABS --------------------------------
"                                                                             '
"     :Whitespace    :NoWhitespace                                            '
"     :Tabs          :NoTabs                                                  '
"                                                                             '
" It uses the buildin :list command to show tabs and line end whitespaces.    '
" The new defined commands are only shortcuts to :set list, :set nolist.      '
" The appearance can be changes by :hi SpecialKey                             '
"-----------------------------------------------------------------------------'
set listchars=tab:>~,nbsp:_,trail:.  " chars to show for tab and space
command Whitespace      set list
command NoWhitespace    set nolist
command Tabs            set list
command NoTabs          set nolist


"------- REMOVE WRONG WHITESPACES AND TABS -----------------------------------
"                                                                             '
"     :RemoveWhitespace    :RemoveWhitespaceBrakets                           '
"     :ReplaceTabs         :RemoveTabs                                        '
"                                                                             '
" White spaces at the end of a line are removed. The same can be done between '
" brackets and function parameters. Tabs are replaced by whitespaces.         '
"-----------------------------------------------------------------------------'
" The command :let @/ = "" empties the search pattern
command RemoveWhitespace         %s/\s\+$// | let @/ = ""
command RemoveWhitespaceBrakets  %s/( /(/g <bar> %s/ )/)/g | let @/ = ""
command ReplaceTabs              %retab
command RemoveTabs               %retab


"------- TABLINE -------------------------------------------------------------
"                                                                             '
"     ,1    ,2    ,3    ,4    ,5    ,6    ,7    ,8    ,9    ,0                '
"                                                                             '
" Buffer line at top of the screen (https://github.com/ap/vim-buftabline).    '
" It can be styled by setting the highlight entries BufTabLineCurrent,        '
" BufTabLineActive, BufTabLineHidden, BufTabLineFill.                         '
"-----------------------------------------------------------------------------'
let g:buftabline_show = 1     " Show only when more than 1 file is open
let g:buftabline_numbers = 0  " Show numbers on tabs
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)


"------- GREP ----------------------------------------------------------------
"                                                                             '
"     :ag    :Ack                                                             '
"                                                                             '
" Use ag to search project files (https://github.com/mileszs/ack.vim)         '
"-----------------------------------------------------------------------------'
set grepprg=grep\ -nH\ $*
let g:ackprg = 'ag --vimgrep'
cnoreabbrev ag Ack!
nnoremap <leader>a :Ack!<space>


"------- CTRLP ---------------------------------------------------------------
"                                                                             '
"     ,f    ,b                                                                '
"                                                                             '
" Use CtrlP for finding files (https://github.com/ctrlpvim/ctrlp.vim)         '
"-----------------------------------------------------------------------------'
map <leader>f :w<CR>:CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.aux,*.log,*.bst,*.pdf,*.toc,*.out
" Ignore files from .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"------- SYNTAX CHECKING -----------------------------------------------------
"                                                                             '
"     <F8>                                                                    '
"                                                                             '
" Flake8 for Python (https://github.com/nvie/vim-flake8)                      '
"                                                                             '
" DEPRECATED                                                                  '
"                                                                             '
"-----------------------------------------------------------------------------'
" autocmd FileType python map <buffer> <F8> :call Flake8()<CR>
let g:flake8_show_in_file=0
let g:flake8_show_in_gutter=0
let g:flake8_quickfix_height=10
highlight link Flake8_Error      IncSearch
highlight link Flake8_Warning    Search   
highlight link Flake8_Complexity Search
highlight link Flake8_Naming     Search
highlight link Flake8_PyFlake    Search


"------- LINTER --------------------------------------------------------------
"                                                                             '
"     <F8>    ,<F8>    ,n                                                     '
"                                                                             '
" Configure ale (https://github.com/dense-analysis/ale)                       '
" to use ruff (https://github.com/astral-sh/ruff) for Python linting          '
"-----------------------------------------------------------------------------'
" Run ruff for <F8>
autocmd FileType python map <buffer> <F8> :ALELint<CR>
" Fix with ruff for ,<F8>
autocmd FileType python map <buffer> <leader><F8> :ALEFix<CR>

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Use it only for Python files to run ruff
let g:ale_linters = {
    \ 'python': ['ruff'],
    \ }
let g:ale_fixers = {
    \ 'python': ['ruff'],
    \ }

" Ensure ale is not run automatically
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_filetype_changed = 0

" Use quickfix window instead of location list
let g:ale_set_quickfix = 1
" Open quickfix/location window automatically
let g:ale_open_list = 1

" Goto next error
map <leader>n :ALENextWrap<CR>

" Highlight related char in code with search color
highlight link ALEError Search
highlight link ALEWarning Search
highlight link ALEInfo Search
highlight link ALEStyleError IncSearch
highlight link ALEStyleWarning Search


"------- INSERT SPECIAL CHARACTERS -------------------------------------------
"                                                                             '
"     <AltGr-u>        <AltGr-a>        <AltGr-o>                             '
"                                                                             '
"     :Specialchars    :Charactermap                                          '
"                                                                             '
" <CTRL-K> followed by two chars can create special chars, e.g. <CTRL-K>D*    '
" results in Δ. To show a list of all possible digraphs you have to type      '
" :digraph. To better remember this we create alias for this command.         '
"-----------------------------------------------------------------------------'
command Specialchars echo "Use <STRG-K><char1><char2> to insert special char"
    \ | digraph
command Charactermap echo "Use <STRG-K><char1><char2> to insert special char"
    \ | digraph
" Umlauts on english keyboard
" AltGr + o
imap ø ö
" AltGr + u
imap ↓ ü
" AltGr + a
imap æ ä


"------- CSV FILES -----------------------------------------------------------
"                                                                             '
"     <F5>                                                                    '
"                                                                             '
" Color csv files and provide for selection commands.                         '
" (https://github.com/mechatroner/rainbow_csv)                                '
"-----------------------------------------------------------------------------'
let g:rcsv_colorpairs = [
    \ ['211', '#ff87af'],
    \ ['150', '#afd787'],
    \ ['222', '#ffd787'],
    \ ['110', '#87afd7'],
    \ ['251', '#c6c6c6'],
    \ ['140', '#af87d7'],
    \ ['152', '#afd7d7']]


"------- TEMPLATES AND AUTOCOMMANDS FOR NEW FILES ----------------------------
"                                                                             '
"     <F5>                                                                    '
"                                                                             '
" Things to do when opening a new file.                                       '
"-----------------------------------------------------------------------------'
filetype plugin on
filetype indent on
" The next line allows to get dynamic content into the skeleton file. Just place
" [:VIM_EVAL:] [:END_EVAL:] around your code. Have a look at the skeleton.plt
" file for an example.
autocmd BufNewFile *
    \ %s#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
" Markdown renderer (https://github.com/ianks/octodown)
autocmd BufEnter   *.md  exe 'noremap <F5> :!octodown %:p<CR>'
" Markdown syntax (https://github.com/vim-pandoc/vim-pandoc-syntax)
autocmd BufEnter   *.md  set filetype=markdown.pandoc
" Suffix specific actions
autocmd BufNewFile *.plt 0r ~/.vim/templates/skeleton.plt  " gnuplot template
autocmd FileType   *.plt :set makeprg=gnuplot %            " make for gnuplot
autocmd BufNewFile *.sh  0r ~/.vim/templates/skeleton.sh   " bash template


"------- POWERLINE -----------------------------------------------------------
"                                                                             '
" Settings for the Powerline plugin (https://github.com/powerline/powerline)  '
"-----------------------------------------------------------------------------'
set laststatus=2                    " show statusline
let g:Powerline_colortheme = 'default'


"------- BETWEEN VIM SESSIONS ------------------------------------------------
"                                                                             '
" Tell vim to remember certain things when we exit.                           '
" '   :  number of files, for which marks will be stored                      '
" <   :  number of lines to save for each register                            '
" :	  :  number of lines to save from the command line history                '
" /	  :  number of lines to save from the search history                      '
" h	  :  disable 'hlsearch' highlighting when starting                        '
" %	  :  the buffer list (only restored when starting Vim without file        '
"        arguments)                                                           '
" n	  :  name used for the viminfo file (must be the last option)             '
"-----------------------------------------------------------------------------'
set undofile
set undodir=$HOME/.cache/vim/undo/
set viminfo='100,<100,h,:20,%,n~/.viminfo
autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif  " always jump to the last cursor position
 

"------- BUILDIN FILE BROWSER ------------------------------------------------
"                                                                             '
" netrw is the default file browser. For a discussion, see                    '
" https://shapeshed.com/vim-netrw/                                            '
"-----------------------------------------------------------------------------'
let g:netrw_home=$HOME.'/.cache/vim'
let g:netrw_liststyle = 3
let g:netrw_banner = 0


"------- SHOW CURRENT FILE NAME IN TERM TITLE --------------------------------
"                                                                             '
" Show only name of current file and truncate it at the beginning if too      '
" long. The titleold line restores the term title after closing vim.          '
"-----------------------------------------------------------------------------'
set title
set titlestring=%<%t
let &titleold=&term


"------- WORKING WITH LONG LINES ---------------------------------------------
"                                                                             '
" Break long lines, but preserve the breaking point to restore it later.      '
" See: https://vim.fandom.com/wiki/Working_with_long_lines                    '
"-----------------------------------------------------------------------------'
command! ShortLines :%s/.\{70,79} /&↵\r/g | 1
command! LongLines :%s/↵\n// | 1


"------- SPLITING AND JOINING OF STATEMENTS ----------------------------------
"                                                                             '
" Split/join code blog lines.                                                 '
" See: https://github.com/AndrewRadev/splitjoin.vim                           '
"-----------------------------------------------------------------------------'
let g:splitjoin_trailing_comma = 1
let g:splitjoin_python_brackets_on_separate_lines = 1
