" Gnuplot scripts
" NOTE: the default name for this is *.gpi !
au BufNewFile,BufRead *.gnu		setf gnuplot
au BufNewFile,BufRead *.gp      setf gnuplot
au BufNewFile,BufRead *.plt     setf gnuplot
au BufNewFile,BufRead *.gpi     setf gnuplot
" Change ~.md from modula2 to markdown and enable spell checking
au BufNewFile,BufRead *.md      setf markdown
au BufNewFile,BufRead *.md      set spell
" Enable spell checking for LaTeX and git commits
" For mail it is enabled in after/ftplugin/mail.vim
au BufNewFile,BufRead *.tex     set spell
au FileType gitcommit           set spell
" Enable line numbers for programming
au BufNewFile,BufRead *.py      set number
" Enable groovy Syntax for Jenkins files
au BufNewFile,BufRead Jenkinsfile setf groovy
" Load vim-tmux plugin for tmux.conf file
au FileType tmux                packadd vim-tmux
" Load vim-bash plugin for bash files
au BufNewFile,BufRead *.sh      packadd vim-bash
au FileType bash                packadd vim-bash
