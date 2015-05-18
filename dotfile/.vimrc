"""""""""""""""""""""""""""""
" Pathegen setup.
"""""""""""""""""""""""""""""
"by default all plugins are in ~/.vim/bundle
execute pathogen#infect()	
syntax on
filetype plugin indent on

"""""""""""""""""""""""""""""
" Notes
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" General Settings.
"""""""""""""""""""""""""""""
set sts=4			"set softtabstop this works for <Tab> and <BS>
set cindent			"next two lines affect the actual number of blanks for cindent
set shiftwidth=4
set nu
""set autoindent
""set smartindent
""set bs=2		        " allow backspacing over everything in insert mode
""set history=50		" keep 50 lines of command line history
""set ruler		        " show the cursor position all the time
""set mouse=a
""set foldmethod=syntax

"""""""""""""""""""""""""""""
" character encoding
"""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=gbk,utf-8,gb18030,gb2312,big5

"""""""""""""""""""""""""""""
" General key mapping.
"""""""""""""""""""""""""""""
map co :copen<cr>
map cc :cclose<cr>

"""""""""""""""""""""""""""""
" Appearance Settings.
"""""""""""""""""""""""""""""
syntax enable			" Switch syntax highlighting on, when the terminal has colors
set hlsearch			" Also switch on highlighting the last used search pattern.
set background=light
let g:solarized_termcolors=256	" No support for OS X terminal, degrade to 256 colors
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

" Adjusting font according to gui type
if has("gui_running")
    if has("gui_macvim")
	set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15
    elseif has("gui_win32")
	set guifont=Consolas:h11:cANSI
    endif
endif

"""""""""""""""""""""""""""""
" Tab Control
"""""""""""""""""""""""""""""
map tn :tabnew<cr>

"""""""""""""""""""""""""""""
" VIM Airline
"""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""
map nt :NERDTree<cr>
map nc :NERDTreeClose<cr>
" works only for gui
if has("gui_running")
    set NERDTreeMouseMode=2
endif



