"map <F2> :NERDTreeToggle<CR>
map <F2> :WMToggle<CR>
map <F3> :call Complie()<CR>
map <F12> :cn<CR>
map <F5> :!ctags -R *<CR>
map <F6> :!php -l %<CR>
inoremap <C-j> <Home>
inoremap <C-k> <End>

set shiftwidth=4
set ts=4
set expandtab
set cursorline
color torte

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
	elseif (&filetype=='python')
		exec "!python %"
	elseif (&filetype == 'php')
		exec "!php %"
	endif
endfunc

autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call SetTitle()" 
autocmd BufNewFile *.py exec ":call SetPyTitle()" 
autocmd BufNewFile *.php exec ":call SetPhpTitle()" 

func SetTitle()
    call setline(1,"  /********************************************************") 
    call append(line("."), "  *   Copyright (C) ".strftime("%Y")." All rights reserved.")
    call append(line(".")+1, "  *   ") 
    call append(line(".")+2, "  *   Filename:".expand("%:t")) 
    call append(line(".")+3, "  *   Author  :zhuye")
    call append(line(".")+4, "  *   Date    :".strftime("%Y-%m-%d")) 
    call append(line(".")+5, "  *   Describe:") 
    call append(line(".")+6, "  *")
    call append(line(".")+7, "  ********************************************************/") 
endfunc

func SetPhpTitle()
    call setline(1,"<?php") 
    call append(line("."),   "  /********************************************************")
    call append(line(".")+1, "  *   Copyright (C) ".strftime("%Y")." All rights reserved.")
    call append(line(".")+2, "  *   ") 
    call append(line(".")+3, "  *   Filename:".expand("%:t")) 
    call append(line(".")+4, "  *   Author  :zhuye")
    call append(line(".")+5, "  *   Date    :".strftime("%Y-%m-%d")) 
    call append(line(".")+6, "  *   Describe:") 
    call append(line(".")+7, "  *")
    call append(line(".")+8, "  ********************************************************/") 
endfunc

func SetPyTitle()
    call setline(1,"'''") 
    call append(line("."),   "  Copyright (C) ".strftime("%Y")." All rights reserved." )
    call append(line(".")+1, "  Filename:".expand("%:t")) 
    call append(line(".")+2, "  Author  :zhuye")
    call append(line(".")+3, "  Date    :".strftime("%Y-%m-%d")) 
    call append(line(".")+4, "  Describe:") 
    call append(line(".")+5, "'''") 
endfunc

set nocompatible              " be iMproved
filetype off                  " required!
filetype plugin on


"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'vim-scripts/Pydiction'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/winmanager'
Bundle 'scrooloose/nerdtree'
"Bundle 'majutsushi/tagbar'
"Bundle 'nathanaelkane/vim-indent-guides'
filetype plugin indent on     " required!

let g:ycm_confirm_extra_conf=0

let g:pydiction_location = '/home/zhuye/.vim/bundle/Pydiction/complete-dict'

let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"
let g:winManagerWidth = 50

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

" bug:在~/.vim/plugin目录下的winmanager.vim文件中找到以下函数定义并在第5行下添加第6行的内容：
"     function! <SID>ToggleWindowsManager()
"        if IsWinManagerVisible()
"           call s:CloseWindowsManager()
"        else
"           call s:StartWindowsManager()
"           exe 'q'
"        end
"     endfunction
