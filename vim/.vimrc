let mapleader = ","
let maplocalleader = "\\"

set tabstop=4
set number

set nohlsearch
set incsearch


" Status line settings {{{
set statusline=%f                " Current file
set statusline+=\ --             " Separator"
set statusline+=\ %y             " Filetype
set statusline+=\ --\            " Separator
set statusline+=Line\ [%4l/%L]   " Current line / total lines in file
set statusline+=\ --\            " Separator
set statusline+=Char\ [%3c]      " Current column
set statusline+=%=               " Swap to right side
set statusline+=%F               " Print full path of file
" }}}


" Basic abbrev and remap settings {{{

" Move current line down one
noremap <leader>- ddp

" Move current line up one
noremap <leader>_ ddkP

" Delete two lines but break the undo sequence 
" to allow each line to be undone individually
nnoremap <leader>d ddi<c-g>u<esc>dd

" Make word uppercase
noremap <leader>u viwU
inoremap <leader>u <esc>viwU

" Make word lowercase
noremap <leader>l viwu
inoremap <leader>l <esc>viwu

" Shortcut to open .vimrc and to refresh changes
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Wrap current word in single quotes or double quotes
nnoremap <leader>" ea"<esc>bi"<esc>lel
nnoremap <leader>' ea'<esc>bi'<esc>lel

" Surround highlighted words with either (, {, [ or <
vnoremap <leader>( di(<esc>pa)<esc>
vnoremap <leader>{ di{<esc>pa}<esc>
vnoremap <leader>[ di[<esc>pa]<esc>
vnoremap <leader>< di<<esc>pa><esc>

" Surround words from cursor with either (, {, [ or <
nnoremap <leader>( i(<esc>A)<esc>
nnoremap <leader>{ i{<esc>A}<esc>
nnoremap <leader>[ i[<esc>A]<esc>
nnoremap <leader>< i<<esc>A><esc>

inoremap ( ()<left>
inoremap [ []<left>

inoremap <leader>[ {<cr>}<up><esc>o<tab>
inoremap " ""<left>

nnoremap H 0
nnoremap L $

inoremap  <esc>bd1wa

iabbrev @@ Ashley.Barrell@ipo.gov.uk
iabbrev ccopy Copyright <C-R>=strftime("%Y")<esc> Ashley Barrell, all rights reserved
" }}}


" Generic C language specific settings {{{
augroup filetype_c
	autocmd!
	autocmd BufNewFile main.c 0r $VIM/vim80/templates/template.c
	autocmd BufNewFile main.cpp 0r $VIM/vim80/templates/template.cpp
	autocmd FileType c,cpp,cs nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType c,cpp,cs nnoremap <buffer> <leader>; mqA;<esc>`q

	autocmd FileType c,cpp,cs :inoreabbrev <buffer> whi while()<left>
	autocmd FileType c,cpp,cs :inoreabbrev <buffer> do do<cr>{<cr><cr>} while()<left>
	autocmd FileType c,cpp,cs :inoreabbrev <buffer> if if ()<left>
	autocmd FileType c,cpp,cs :inoreabbrev <buffer> for for (;;)<left><left><left>

	autocmd FileType c,cpp,cs :iabbrev <buffer> case case:<cr><cr><tab>break;<up><up><left>
	autocmd FileType c,cpp :iabbrev <buffer> #i #include
	autocmd FileType c,cpp :iabbrev <buffer> #d #define

	vnoremap <buffer> <leader>mc di<esc>:execute "vsp " . @* . ".h"<cr>
augroup END
" }}}


" C and CPP header specific settings {{{
augroup filetype_c_header
	autocmd!
	autocmd BufNewFile *.h 0r $VIM/vim80/templates/template.h
	autocmd BufNewFile *.h exe "1," . 7 . "g/#ifndef/s//#ifndef " .toupper(join([fnamemodify(expand("%"), ':t:r'), '_H'], ''))	
	autocmd BufNewFile *.h exe "1," . 7 . "g/#define/s//#define " .toupper(join([fnamemodify(expand("%"), ':t:r'), '_H'], ''))
	autocmd BufNewFile *.h exe "1," . 7 . "g,#endif,s,,#endif \\//" .toupper(join([fnamemodify(expand("%"), ':t:r'), '_H'], ''))
	autocmd BufNewFile *.h exe ":4"
	nnoremap <buffer> <leader>mc iclass <c-r>=fnamemodify(expand("%"), ':t:r')<cr><cr>{<cr><cr>}<up>
	autocmd BufNewFile *.h :inoreabbrev <buffer> pri private:<cr>
	autocmd BufNewFile *.h :inoreabbrev <buffer> pub public:<cr>
augroup END
" }}}


" C# filetype specific settings {{{
augroup filetype_c_sharp
	autocmd!
	autocmd BufNewFile *.cs 0r $VIM/vim80/templates/template.cs
	autocmd BufNewFile *.cs exe "1," . 9 . "g/namespace/s//namespace " .fnamemodify(getcwd(), ':t')
	autocmd BufNewFile *.cs exe "1," . 9 . "g/class/s//class " .fnamemodify(expand("%"), ':t:r')
	autocmd FileType cs :iabbrev <buffer> con Console
	autocmd FileType cs :iabbrev <buffer> cnwl Console.WriteLine
augroup END
" }}}


" Markdown file settings {{{
augroup filetype_markdown
	autocmd!
	autocmd FileType markdown :onoremap ih :<c-u>execute "normal! ?^[==,--]\\+$\r:nohlsearch\rkvg_"<cr>
	autocmd FileType markdown :onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
	"TODO: Add email eversion of the commands above
augroup END
" }}}


" Vimscript file settings {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim :iabbrev <buffer> aug augroup
	autocmd FileType vim :iabbrev <buffer> aut autocmd
	autocmd FileType vim :iabbrev <buffer> ft FileType

	autocmd FileType vim :iabbrev <buffer> bnf BufNewFile
	autocmd FileType vim :iabbrev <buffer> iab iabbrev
	autocmd FileType vim :iabbrev <buffer> buf <buffer>
	autocmd FileType vim :iabbrev <buffer> nno nnoremap
	autocmd FileType vim :iabbrev <buffer> lea <lt>leader>

	autocmd FileType vim nnoremap <buffer> <localleader>c mq0i"<esc>`q
	autocmd FileType vim nnoremap <buffer> <tab> za
augroup END
" }}}


" Bash file settings {{{
augroup filetype_bash
	autocmd!
	autocmd BufNewFile *.sh 0r $VIM/vim80/templates/template.sh
	autocmd BufNewFile *.sh exe "normal jo"
augroup END
" }}}


" Shared settings for other file types eg. shellscript, dockerfile ect {{{
augroup common_file_settings
	autocmd!
	autocmd FileType dockerfile,sh nnoremap <localleader># mq0i#<esc>`q

	" Make wrappers of equals symbols for a header that are 30 characters long
	autocmd FileType text,markdown nnoremap <leader>= 30i=<esc>o<enter><esc>30i=<esc>ki
augroup END
" }}}


" HTML file settings {{{
augroup filetype_html
	autocmd!
	autocmd BufNewFile *.html 0r $VIM/vim80/templates/template.html
	autocmd FileType html nnoremap <buffer> <leader>> vit<esc>i
	autocmd FileType html nnoremap <buffer> <leader>p <p><++></p>
	nnoremap <leader><leader> <esc>/<++><enter>
augroup END
" }}}


""" LaTeX file settings {{{
augroup filetype_tex
	autocmd!
	autocmd FileType tex :iabbrev sec <BSlash>section{}<left>
	autocmd FileType tex :iabbrev ssec <BSlash>subsection{}<left>
augroup END
""" }}}

