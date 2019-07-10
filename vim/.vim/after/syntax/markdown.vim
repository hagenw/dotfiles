" Add Jekyll support to Markdown
" See: https://github.com/PProvost/vim-markdown-jekyll

" YAML front matter
syntax match Comment /\%^---\_.\{-}---$/ contains=@Spell

" Match Liquid Tags and Filters
syntax match liquidTag /{[{%].*[}%]}/

hi def link liquidTag Statement
