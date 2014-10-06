"""""""""""""""""""""""""""""
" General Settings.
"""""""""""""""""""""""""""""
execute pathogen#infect()

set nocompatible              " be iMproved, required

"""""""""""""""""""""""""""""
" General Settings.
"""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set cindent
set autoindent
set smartindent
set bs=2		                       " allow backspacing over everything in insert mode
set history=50		                   " keep 50 lines of command line history
set ruler		                       " show the cursor position all the time
set shiftwidth=4
set nu
set mouse=a
set foldmethod=syntax
let php_folding= 1

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
" Display Settings.
"""""""""""""""""""""""""""""
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
set incsearch
set t_Co=256
syntax on
set hlsearch
colorscheme molokai 

"""""""""""""""""""""""""""""
" Tab Control
"""""""""""""""""""""""""""""
map tn :tabnew<cr>

"""""""""""""""""""""""""""""
" Taglist settings.
"""""""""""""""""""""""""""""
map tl :Tlist<cr>
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_WinWidth = 40
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
 
"""""""""""""""""""""""""""""
" DoxygenToolkit.
"""""""""""""""""""""""""""""
" map <F3> :Dox<cr>
" map <F4> :DoxAuthor<cr>
" map <F5> :DoxBlock<cr>
" map <F6> O/**< */<Left><Left>
" let g:DoxygenToolkit_briefTag_pre="@brief  "
" let g:DoxygenToolkit_paramTag_pre="@param "
" let g:DoxygenToolkit_returnTag="@returns   "
" let g:DoxygenToolkit_authorName="Hansel"

"""""""""""""""""""""""""""""
" Winmanager.
"""""""""""""""""""""""""""""
" map wm :WMToggle<cr>
" let g:persistentBehaviour = 0
" let g:winManagerWidth = 35 
" let g:winManagerWindowLayout = 'FileExplorer|BufExplorer'
"""   
