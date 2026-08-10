" Syntax highlighting for the iva-conv transcript view (:IvaView).
if exists('b:current_syntax')
  finish
endif

syntax match IvaConvMeta /^▸ meta\>.*/
syntax match IvaConvSystem /^▸ system\>.*/
syntax match IvaConvTool /^▸ tool\[.*/
syntax match IvaConvAssistant /^▸ assistant\>.*/
" human turns: any other turn line, plus indented segment lines
syntax match IvaConvHuman /^▸ \%(meta\>\|system\>\|assistant\>\|tool\[\)\@!.*/
syntax match IvaConvHuman /^ \+\S.*/

" Override these in your vimrc to pick your own colors, e.g.
"   highlight IvaConvHuman ctermfg=cyan guifg=#7fd7ff
"   highlight IvaConvAssistant ctermfg=green guifg=#a5d6a7
hi def link IvaConvMeta Comment
hi def link IvaConvSystem Number
hi def link IvaConvTool Function
hi def link IvaConvHuman Identifier
hi def link IvaConvAssistant String

let b:current_syntax = 'ivaconv'
