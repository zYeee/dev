"map <F2>         : NERDTreeToggle<CR>
"map <F2>         : WMToggle<CR>
map <silent> <F2> : Tagbar<CR>
map <F3>          : call Complie()<CR>
map <silent> <F4> : Tab/=<CR>
map <F12>         : !send<CR>
map <F5>          : GitGutterToggle<CR>
map <F6>          : !php -l %<CR>
map <C-a>         : DoxAuthor<CR>
map <C-f>         : Dox<CR>

nmap H gT
nmap L gt

map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

imap jj <Esc><Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

let mapleader=";"

autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd VimEnter * NERDTreeTabsToggle

set hls
" highlight
set shiftwidth=2
set ts=2
set expandtab
set cursorline
set ignorecase
set cc=80
set backspace=indent,eol,start
syntax on

set t_Co=256
colorscheme wombat256mod

func! Complie()
	exec "w"
	if &filetype == 'cpp'
		set makeprg=g++\ -o\ %<\ %\ leetcode.cpp
		silent make
		let file=expand("%:r")
		if filereadable(file)
			exec "!./%< && rm %<"
		else 
			copen
		" %在vim中代表当前文件名，%<代表不含扩展名的文件名
        endif
    elseif &filetype == 'c'
		set makeprg=gcc\ -o\ %<\ %
        silent make
        let file = expand("%:r")
        if filereadable(file)
			exec "!./%< && rm %<"
		else 
			copen
		" %在vim中代表当前文件名，%<代表不含扩展名的文件名
        endif
	elseif (&filetype=='python')
		exec "!python %"
	elseif (&filetype == 'php')
		exec "!php %"
	endif
endfunc

autocmd BufNewFile *.py exec ":call SetPyTitle()" 

autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType html set omnifunc=xmlcomplete#CompleteTags

func SetPyTitle()
     call setline(1,"#!/usr/bin/python2.7")
     call append(line("."),   "# -*- coding: utf-8 -*-")
endfunc

set nocompatible              " be iMproved
filetype off                  " required!
filetype plugin on


"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle.git'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'vim-scripts/taglist.vim'
"Bundle 'vim-scripts/php_localvarcheck.vim'
"Bundle 'joonty/vim-phpqa'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'newzealandpaul/wombat256mod'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'othree/xml.vim'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'klen/python-mode'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim' 
Bundle 'kien/ctrlp.vim'
Bundle 'aceofall/gtags.vim'
"Bundle 'php-vim/phpcd.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'gregsexton/gitv'
Bundle 'Lokaltog/vim-powerline'
Bundle 'easymotion/vim-easymotion'
"ack: http://beyondgrep.com/install/
"gtags: http://www.gnu.org/software/global/globaldoc_toc.html
"phpmd: wget -c http://static.phpmd.org/php/latest/phpmd.phar
filetype plugin indent on     " required!

"YouCompleteMe
"echo | clang -std=c++11 -stdlib=libc++ -v -E -x c++ -
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"


"winmanaget
"let g:NERDTree_title="[NERDTree]"
"let g:winManagerWindowLayout="NERDTree|TagList"
"let g:winManagerWidth = 50

"acp
"let g:AutoComplPop_IgnoreCaseOption=1

"tagbar
let g:tagbar_width=30

"DoxygenToolkit
let g:DoxygenToolkit_authorName="zhuye,yformat930@126.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

"function! NERDTree_Start()
"    exec 'NERDTree'
"endfunction
"
"function! NERDTree_IsValid()
"    return 1
"endfunction

" bug:在~/.vim/plugin目录下的winmanager.vim文件中找到以下函数定义并在第5行下添加第6行的内容：
"     function! <SID>ToggleWindowsManager()
"        if IsWinManagerVisible()
"           call s:CloseWindowsManager()
"        else
"           call s:StartWindowsManager()
"           exe 'q'
"        end
"     endfunction

"python-mode
let g:pymode_run_bind = "<C-r>"
let g:pymode_doc_bind = "<C-t>"
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

"nerdtreeTab
let g:nerdtree_tabs_open_on_console_startup = 1


let g:syntastic_check_on_open=1
let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"

"CtrlP
let g:ctrlp_map = '<c-p>'

"ack
let g:ack_default_options = " --php"

"gtags
set cscopetag
set cscopeprg='gtags-cscope'

let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

