" iva-conv.vim - autoload functions
" Renders JSON files in the iva-prompt-format (a top-level array of turn
" objects with a "role") as a one-line-per-turn transcript.

" -------------------------------------------------------- transcript view

" Toggle a rendered, syntax-colored transcript of the conversation in the
" current window. <CR> on a transcript line jumps to the JSON turn, q (or
" :IvaView again) goes back to the JSON buffer.
function! iva_conv#view() abort
  if exists('b:iva_view_src')
    let l:src = b:iva_view_src
    execute 'buffer' l:src
    return
  endif
  let l:turns = s:summaries()
  if empty(l:turns)
    echohl WarningMsg
    echomsg 'iva-conv: buffer is not a parseable iva conversation (invalid JSON?)'
    echohl None
    return
  endif
  let l:src = bufnr('%')
  let l:srcname = expand('%:t')
  let l:lines = []
  let l:map = []
  for [l:lnum, l:text] in l:turns
    call add(l:lines, l:text)
    call add(l:map, l:lnum)
  endfor
  silent keepalt enew
  setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
  call setline(1, l:lines)
  setlocal nomodifiable readonly
  let b:iva_view_src = l:src
  let b:iva_view_map = l:map
  execute 'silent! keepalt file' fnameescape('iva-view://' . l:srcname)
  setlocal filetype=ivaconv
  nnoremap <silent> <buffer> <CR> :call iva_conv#view_jump()<CR>
  nnoremap <silent> <buffer> q :call iva_conv#view()<CR>
endfunction

function! iva_conv#view_jump() abort
  let l:lnum = get(b:iva_view_map, line('.') - 1, 1)
  execute 'buffer' b:iva_view_src
  execute l:lnum
  normal! zv
endfunction

" ----------------------------------------------------------------- summaries

" Build the transcript as a list of [source lnum, summary line] pairs:
" one entry per turn, plus one per segment of a multi-speaker audio turn.
" Returns an empty list if the buffer cannot be parsed.
function! s:summaries() abort
  let l:lines = getline(1, '$')
  try
    let l:data = json_decode(join(l:lines, "\n"))
  catch
    return []
  endtry
  if type(l:data) != v:t_list
    return []
  endif

  let l:turns = s:scan(l:lines)

  " speaker id -> info, taken from the meta turn
  let l:speakers = {}
  for l:t in l:data
    if type(l:t) == v:t_dict && get(l:t, 'role', '') ==# 'meta'
      let l:speakers = get(l:t, 'speakers', {})
      break
    endif
  endfor

  let l:result = []
  let l:n = min([len(l:turns), len(l:data)])
  for l:k in range(l:n)
    let l:tr = l:turns[l:k]
    let l:turn = l:data[l:k]
    call add(l:result, [l:tr.start, s:turn_summary(l:turn, l:speakers)])
    let l:segs = []
    if type(l:turn) == v:t_dict && type(get(l:turn, 'meta', 0)) == v:t_dict
      let l:segs = get(l:turn.meta, 'segments', [])
    endif
    for l:j in range(len(l:tr.segs))
      if l:j < len(l:segs)
        call add(l:result,
              \ [l:tr.segs[l:j][0], s:seg_summary(l:segs[l:j], l:speakers)])
      endif
    endfor
  endfor
  return l:result
endfunction

" -------------------------------------------------------------------- scanner

" Find the line ranges of the top-level array elements (turns) and, inside
" each turn, the ranges of the objects in a "segments" array. Works on
" pretty-printed JSON (strings never span lines).
function! s:scan(lines) abort
  let l:depth = 0
  let l:turns = []
  let l:cur = {}
  let l:segdepth = -1
  let l:segstart = 0
  for l:i in range(len(a:lines))
    let l:lnum = l:i + 1
    let l:line = a:lines[l:i]
    " drop escapes, then blank out string contents, then count brackets
    let l:s = substitute(l:line, '\\.', '', 'g')
    let l:s = substitute(l:s, '"[^"]*"', '""', 'g')
    let l:opens = strlen(substitute(l:s, '[^{[]', '', 'g'))
    let l:closes = strlen(substitute(l:s, '[^}\]]', '', 'g'))
    let l:before = l:depth
    let l:depth += l:opens - l:closes
    let l:after = l:depth

    if empty(l:cur)
      if l:before == 1 && l:after >= 2
        let l:cur = {'start': l:lnum, 'end': 0, 'segs': []}
      endif
      continue
    endif

    if l:segdepth >= 0
      if l:before == l:segdepth && l:after == l:segdepth + 1
        let l:segstart = l:lnum
      elseif l:before == l:segdepth + 1 && l:after == l:segdepth
        call add(l:cur.segs, [l:segstart, l:lnum])
      elseif l:after < l:segdepth
        let l:segdepth = -1
      endif
    elseif l:line =~# '"segments"\s*:\s*\[\s*$' && l:after == l:before + 1
      let l:segdepth = l:after
    endif

    if l:before >= 2 && l:after <= 1
      let l:cur.end = l:lnum
      call add(l:turns, l:cur)
      let l:cur = {}
      let l:segdepth = -1
    endif
  endfor
  return l:turns
endfunction

" ---------------------------------------------------------------- formatting

function! s:snippet(text, max) abort
  let l:t = substitute(a:text, '\s\+', ' ', 'g')
  if strchars(l:t) > a:max
    return strcharpart(l:t, 0, a:max - 1) . '…'
  endif
  return l:t
endfunction

function! s:spk(id, speakers) abort
  let l:info = get(a:speakers, a:id, {})
  let l:name = type(l:info) == v:t_dict ? get(l:info, 'name', '') : ''
  return empty(l:name) ? a:id : l:name . ' (' . a:id . ')'
endfunction

function! s:val(v) abort
  if type(a:v) == v:t_string
    return '"' . s:snippet(a:v, 30) . '"'
  endif
  try
    return json_encode(a:v)
  catch
    return string(a:v)
  endtry
endfunction

function! s:turn_summary(turn, speakers) abort
  if type(a:turn) != v:t_dict
    return '▸ ?'
  endif
  let l:role = get(a:turn, 'role', '?')

  if l:role ==# 'meta'
    let l:parts = []
    for l:key in ['task', 'category', 'question', 'scenario', 'intent_type']
      if has_key(a:turn, l:key) && type(a:turn[l:key]) == v:t_string
        call add(l:parts, a:turn[l:key])
      endif
    endfor
    let l:sp = []
    for l:id in sort(keys(get(a:turn, 'speakers', {})))
      call add(l:sp, l:id . '=' . get(a:turn.speakers[l:id], 'name', '?'))
    endfor
    let l:res = '▸ meta │ ' . join(l:parts, ' · ')
    if !empty(l:sp)
      let l:res .= ' │ ' . join(l:sp, ' ')
    endif
    return l:res
  endif

  if l:role ==# 'system'
    let l:res = '▸ system │ ' . s:snippet(get(a:turn, 'text', ''), 90)
    let l:tools = []
    for l:tool in get(a:turn, 'tools', [])
      call add(l:tools, get(get(l:tool, 'function', {}), 'name', '?'))
    endfor
    if !empty(l:tools)
      let l:res .= ' │ tools: ' . join(l:tools, ', ')
    endif
    return l:res
  endif

  if l:role ==# 'human'
    let l:meta = type(get(a:turn, 'meta', 0)) == v:t_dict ? a:turn.meta : {}
    let l:audio = has_key(a:turn, 'audio') ? '♪ ' : ''
    if has_key(l:meta, 'segments')
      return '▸ ' . l:audio . get(a:turn, 'audio', 'conversation')
            \ . ' │ ' . len(l:meta.segments) . ' segments:'
    endif
    let l:who = has_key(l:meta, 'speaker')
          \ ? s:spk(l:meta.speaker, a:speakers) : 'human'
    let l:text = get(a:turn, 'text', get(l:meta, 'text', ''))
    return '▸ ' . l:audio . l:who . ' │ ' . s:snippet(l:text, 130)
  endif

  if l:role ==# 'assistant'
    let l:meta = type(get(a:turn, 'meta', 0)) == v:t_dict ? a:turn.meta : {}
    let l:tag = ''
    if get(l:meta, 'source', '') ==# 'truth'
      let l:tag = ' [truth]'
    elseif get(l:meta, 'source', '') ==# 'prediction'
      let l:tag = ' [pred]'
    endif
    if has_key(a:turn, 'tool_calls')
      let l:calls = []
      for l:c in a:turn.tool_calls
        let l:fn = get(l:c, 'function', {})
        let l:kv = []
        let l:args = get(l:fn, 'arguments', {})
        if type(l:args) == v:t_dict
          for l:key in sort(keys(l:args))
            call add(l:kv, l:key . '=' . s:val(l:args[l:key]))
          endfor
        endif
        call add(l:calls, get(l:fn, 'name', '?') . '(' . join(l:kv, ', ') . ')')
      endfor
      return '▸ assistant' . l:tag . ' ⚙ ' . s:snippet(join(l:calls, '; '), 120)
    endif
    if has_key(a:turn, 'choices')
      let l:cs = []
      for l:ch in a:turn.choices
        let l:pref = get(get(l:ch, 'meta', {}), 'preference', '')
        let l:mark = l:pref ==# 'chosen' ? '✓' : (l:pref ==# 'rejected' ? '✗' : '·')
        call add(l:cs, l:mark . ' ' . (has_key(l:ch, 'text')
              \ ? '"' . s:snippet(l:ch.text, 50) . '"' : '(silent)'))
      endfor
      return '▸ assistant' . l:tag . ' │ ' . join(l:cs, '  ')
    endif
    let l:text = s:snippet(get(a:turn, 'text', ''), 130)
    return '▸ assistant' . l:tag . ' │ ' . (empty(l:text) ? '(silent)' : l:text)
  endif

  if l:role ==# 'tool'
    let l:value = get(a:turn, 'value', '')
    if type(l:value) != v:t_string
      let l:value = json_encode(l:value)
    endif
    return '▸ tool[' . get(a:turn, 'id', '?') . '] → ' . s:snippet(l:value, 110)
  endif

  return '▸ ' . l:role
endfunction

function! s:seg_summary(seg, speakers) abort
  let l:who = has_key(a:seg, 'speaker')
        \ ? s:spk(a:seg.speaker, a:speakers) : '?'
  let l:time = ''
  if has_key(a:seg, 'start') && has_key(a:seg, 'end')
    let l:time = printf(' %g–%g', a:seg.start * 1.0, a:seg.end * 1.0)
  endif
  return '      ' . l:who . l:time . ' │ ' . s:snippet(get(a:seg, 'text', ''), 120)
endfunction
