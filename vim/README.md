# VIM config files

VIM configuration,
extensions,
and color theme.

The used color theme is
[bubblelights](https://github.com/hagenw/bubblelights),
which requires to
[update your terminal colors](https://github.com/hagenw/bubblelights?tab=readme-ov-file#terminal-color-palette)
as well.

The configuration expects
that files for spell checking
are available under
`~/.local/share/vim/spell`.

## Keyboard short cuts

| Keyboard short cut            | Description                              |
| ----------------------------- | ---------------------------------------- |
| <kbd>,</kdb>                  | leader key                               |
| <kbd>,</kbd><kbd>k</kbd>      | show all available leader commands       |
| <kbd>,</kbd><kbd>r</kbd>      | replace highlighted word                 |
| <kbd>CTRL</kbd>-<kbd>r</kbd>  | replace highlighted word                 |
| <kbd>,</kbd><kbd>q</kbd>      | close current tab/buffer                 |
| <kbd>,</kbd><kbd>c</kbd>      | close quick fix window                   |
| <kbd>,</kbd><kbd>e</kbd>      | execute open file                        |
| <kbd>,</kbd><kbd>l</kbd>      | toggel line numbers                      |
| <kbd>,</kbd><kbd>f</kbd>      | quickly open files                       |
| <kbd>,</kbd><kbd>b</kbd>      | quickly open buffer                      |
| <kbd>F8</kbd>                 | lint with `ruff`                         |
| <kbd>,</kbd><kbd>F8</kbd>     | format and fix with `ruff`               |
| <kbd>,</kbd><kbd>n</kbd>      | move to next quick fix entry             |
| <kbd>z</kbd><kbd>g</kbd>      | add word to known words for spellchecker |
| <kbd>z</kbd><kbd>w</kbd>      | mark word as wrong for spellchecker      |
| <kbd>n</kbd>                  | move to next searched word below         |
| <kbd>N</kbd>                  | move to next searched word above         |
| <kbd>\\</kbd>                 | clear word search                        |
| <kbd>CTRL</kbd>+<kbd>y</kbd>  | copy to clip board                       |
| <kbd>CTRL</kbd>+<kbd>n</kbd>  | go to next open file/buffer              |
| <kbd>CTRL</kbd>+<kbd>b</kbd>  | go to previous open file/buffer          |
| <kbd>,</kbd><kbd>,</kbd>      | switch to last open file in buffer       |
| <kbd>ALT</kbd>+<kbd>↑</kbd>   | go to split window above                 |
| <kbd>ALT</kbd>+<kbd>↓</kbd>   | go to split window below                 | 
| <kbd>ALT</kbd>+<kbd>←</kbd>   | go to split window left                  |
| <kbd>ALT</kbd>+<kbd>→</kbd>   | go to split window right                 |
| <kbd>+</kbd>                  | increase window size                     |
| <kbd>-</kbd>                  | decrease window size                     |
| <kbd>_</kbd>                  | make window fullscreen                   |
| <kbd>AltGr</kbd>+<kbd>u</kbd> | ü                                        |
| <kbd>AltGr</kbd>+<kbd>o</kbd> | ö                                        |
| <kbd>AltGr</kbd>+<kbd>a</kbd> | ä                                        |
| <kbd>F5</kbd>                 | color highlighting for an open CSV file  |


## Provided extensions

| Plugin                                                    | Description                              |
| --------------------------------------------------------- | ---------------------------------------- |
| [BufTabLine](https://github.com/ap/vim-buftabline)        | ![tab line](./images/tab-line.png)       |
| [ack](https://github.com/mileszs/ack.vim)                 | run your favorite search tool from vim   |
| [ale](https://github.com/dense-analysis/ale)              | code linting and formatting              |
| [rainbow_csv](https://github.com/mechatroner/rainbow_csv) | CSV color highlighting                   |
| [powerline](https://github.com/powerline/powerline)       | ![status line](./images/status-line.png) |
