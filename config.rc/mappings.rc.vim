" VIM - mappings

" Disable arrows
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

" Save buffer
nnoremap <M-Space> :w<cr>
inoremap <M-Space> <Esc>:w<cr>
nnoremap <M-s> :w<cr>
inoremap <M-s> <Esc>:w<cr>

" I don't use theses, but it may be useful when
" <M-Space> is not available (on some terminal)
nnoremap <C-s> :w<cr>
inoremap <C-s> <Esc>:w<cr>

"-- Toggle
"------------------------------------------------------------------

" wrap
nnoremap <M-w> :set wrap! wrap?<cr>

" relativenumber
nnoremap <M-r>	:set relativenumber! relativenumber?<CR>


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Open Tagbar
nnoremap <F8> :TagbarToggle<CR>

" Discard last search highlight
nnoremap <silent> § :noh \| echo "Search cleared"<cr>

"-- Navigation
"------------------------------------------------------------------

" Goto tabs
nnoremap <M-J> gT
nnoremap <M-K> gt
inoremap <M-J> <esc>gT
inoremap <M-K> <esc>gt

" Open a zsh at cwd
nnoremap <M-z> :!zsh<cr>

"-- Normal helper
"------------------------------------------------------------------

nnoremap <M-o> o<esc>
nnoremap <M-O> O<esc>

"-- Insert helper
"------------------------------------------------------------------

" Insert a tabulation (Alt + i) in insert mode
set <M-i>=é
inoremap <M-i> <C-V><Tab>

" Disbale <M-i> in normal mode, as it hangs the terminal
nnoremap <M-i> <nop>

" Indent line in normal and insert mode (return to normal mode)
nnoremap <Tab> mi==`i
inoremap <Tab> <Esc>mi==`il

" Indent visual selection
" note that '<,'> is automatically inserted when pressing ':' in visual mode
vnoremap <Tab> :normal! ==<cr>

"-- Global code Manipulation
"------------------------------------------------------------------

" Format the file
nnoremap <C-f> gg=G``

"-- Vim dev helpers
"------------------------------------------------------------------

" Show highlight infos
nmap <F2> :echom "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" <CR>

" Toggle PASTE mode
nnoremap <M-p> :set paste! paste?<CR>

"-- OS integration
"------------------------------------------------------------------

" Copy/Paste with system clipboard
" > copy from visual mode
vnoremap <M-c> :'<,'>w !xclip -in -selection clipboard<cr>
" > paste in normal mode
nnoremap <silent> <M-v> :r !xclip -out -selection clipboard<cr>

" ask for sudo passwd and save the file
cnoremap w!! w !sudo tee % >/dev/null


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first make a new undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" logical undo
nnoremap U <C-r>





" Taken from visual-at.vim from Practical Vim 2nd Edition
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction
