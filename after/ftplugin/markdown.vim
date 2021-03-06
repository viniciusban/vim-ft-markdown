" Vim filetype plugin file
" Language:     Markdown
" Maintainer:   viniciusban


" Avoid loading indent file.
"
" Not only for markdown, but for all filetypes. That's how vim works.
"
" I disable loading indent file for markdown because:
"
"   1. vim-polyglot erroneously set configs in indent file;
"   2. Theses configs messes with list formatting;
"   3. "vim-polyglot/after/indent" is loaded after this script.
"
" Thus, the whole process is:
"
"   1. Read the markdown file;
"   2. Run this script (disable ident file);
"   3. Load the markdown file to buffer;
"   4. Re-enable filetype for all filetypes in "BufEnter" event.
filetype indent off

augroup vim-ft-markdown
    autocmd!
    autocmd BufEnter *.{md,mdown,mkd,mkdn,markdown,mdwn} filetype indent on
augroup END


" =========================
" Let's do something useful
" =========================

setlocal autoindent

" folded headings
let g:markdown_folding=1
setlocal foldlevel=1

" Automatically continue blockquote on line break
setlocal comments=n:>,b:>

" Indenting in lists and blockquotes with tab
setlocal tabstop=3

" Indenting with >>
setlocal shiftwidth=2

" Numbered and unnumbered lists
setlocal formatlistpat=^\\s*\\d\\+[:.)]\\s\\\|^\\s*[-*+]\\s

" Format lists correctly with "gq" and "gw"
setlocal formatoptions=tcqlnr

" Make headings
nnoremap <silent> <buffer> <localleader>1 :keeppatterns :s/^#* */# /<CR>:keeppatterns :s/ *#*$//<CR>
nnoremap <silent> <buffer> <localleader>2 :keeppatterns :s/^#* */## /<CR>:keeppatterns :s/ *#*$//<CR>
nnoremap <silent> <buffer> <localleader>3 :keeppatterns :s/^#* */### /<CR>:keeppatterns :s/ *#*$//<CR>
nnoremap <silent> <buffer> <localleader>4 :keeppatterns :s/^#* */#### /<CR>:keeppatterns :s/ *#*$//<CR>

" Go to next/previous heading (any level)
nnoremap <silent> <buffer>  ]] :normal m'<CR>:keeppatterns /^#\+ /<CR>
nnoremap <silent> <buffer>  [[ :normal m'<CR>:keeppatterns ?^#\+ ?<CR>

" Go to next/previous heading (of some level)
nnoremap <silent> <buffer>  ]1 :normal m'<CR>:keeppatterns /^# /<CR>
nnoremap <silent> <buffer>  [1 :normal m'<CR>:keeppatterns ?^# ?<CR>
nnoremap <silent> <buffer>  ]2 :normal m'<CR>:keeppatterns /^## /<CR>
nnoremap <silent> <buffer>  [2 :normal m'<CR>:keeppatterns ?^## ?<CR>
nnoremap <silent> <buffer>  ]3 :normal m'<CR>:keeppatterns /^### /<CR>
nnoremap <silent> <buffer>  [3 :normal m'<CR>:keeppatterns ?^### ?<CR>

" Add a codeblock paragraph
autocmd FileType markdown inoremap <buffer> <localleader>` ```<CR><CR>```<C-O>k
