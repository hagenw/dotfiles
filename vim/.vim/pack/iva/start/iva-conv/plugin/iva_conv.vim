" iva-conv.vim - readable transcript view for iva-prompt-format conversations
" Renders a conversation JSON file (top-level array of turn objects with a
" "role") as a syntax-colored, one-line-per-turn transcript.
"
" Commands:
"   :IvaView   toggle the transcript view (read-only; <CR> jumps to the
"              JSON turn, q goes back)
"
" In autodetected conversation JSON buffers, <CR> also toggles the view.
"
" Options:
"   g:iva_conv_auto    autodetect iva conversation JSON files (default 1)
"   g:iva_conv_map_cr  map <CR> to toggle the view in detected buffers
"                      (default 1)

if exists('g:loaded_iva_conv')
  finish
endif
let g:loaded_iva_conv = 1

command! IvaView call iva_conv#view()

function! s:detect() abort
  if !get(g:, 'iva_conv_auto', 1)
    return
  endif
  if getline(1) !~# '^\s*\['
    return
  endif
  for l:line in getline(1, 30)
    if l:line =~# '"role"\s*:\s*"\(meta\|system\|human\|assistant\|tool\)"'
      if get(g:, 'iva_conv_map_cr', 1)
        nnoremap <silent> <buffer> <CR> :IvaView<CR>
      endif
      return
    endif
  endfor
endfunction

augroup iva_conv_detect
  autocmd!
  autocmd BufReadPost *.json call s:detect()
augroup END
