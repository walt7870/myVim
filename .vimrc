set nocompatible                " 关闭所有拓展功能
filetype off                    " 关闭对文件类型的自动检查 
set rtp+=~/.vim/bundle/vundle/  " 加入运行时路径
call vundle#begin()                " 初始化

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"my Bundle here:
" " original repos on github
"Bundle 'kien/ctrlp.vim'
"Bundle 'sukima/xmledit'
"Bundle 'sjl/gundo.vim'
"Bundle 'jiangmiao/auto-pairs'
"Bundle 'klen/python-mode'
"Bundle 'Valloric/ListToggle'
"Bundle 'SirVer/ultisnips'
"Bundle 'scrooloose/syntastic'
"Bundle 't9md/vim-quickhl'
"Bundle 'Lokaltog/vim-powerline'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'toyamarinyon/vim-swift'
Bundle 'Valloric/YouCompleteMe'
Bundle 'flazz/vim-colorschemes' 
Bundle 'scrooloose/nerdtree'
map <F3> :NERDTreeToggle<CR>
Bundle 'mattn/emmet-vim'
"..................................
" vim-scripts repos
"Bundle 'YankRing.vim'
"Bundle 'vcscommand.vim'
"Bundle 'ShowPairs'
"Bundle 'SudoEdit.vim'
"Bundle 'EasyGrep'
"Bundle 'VOoM'
"Bundle 'VimIM'
"..................................
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"......................................
call vundle#end()
filetype plugin indent on
":------------------------------------
"自我需求配置
syntax enable
syntax on

"<F5>编译运行.c,.cpp,.sh,.java文件
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'python'
		exec "!python %"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
		"elseif &filetype == 'sh':!./%
	endif
endfunc
"自动插入头文件

"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
	elseif &filetype == 'python'
		call setline(1,"#!/usr/bin/env python")
		call append(line("."),"# coding=utf-8")
		call append(line(".")+1, "") 

	elseif &filetype == 'ruby'
		call setline(1,"#!/usr/bin/env ruby")
		call append(line("."),"# encoding: utf-8")
		call append(line(".")+1, "")

		"    elseif &filetype == 'mkd'
		"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author:walt-niu ") 
		call append(line(".")+2, "	> Mail: ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py  normal G



"给html文件设置模板
"autocmd BufNewFile *.html exec ":call SetHtml()"
"func SetHtml()
"call setline(1,"html:5")

"endfunc

if filereadable("/home/niu/.vim/tmp/html")
	autocmd BufNewFile *.html 0 read /home/niu/.vim/tmp/html
endif



"去除回车自动注释
"set paste
"<F12>格式化代码
map <F12> gg=G
"不备份
set nobackup
"设置colorscheme主题
colorscheme blacklight 
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py' "设置ycm文件位置

map <F4> :call F4()<cr>
func F4()
	exec "wq"
endfunc


set cursorline
"hi CursorLine term=reverse cterm=reverse gui=reverse
"hi CursorLine  term=standout ctermfg=10 gui=bold guifg=springgreen
hi CursorLine term=reverse ctermbg=6 guibg=DarkCyan
set cursorcolumn
"hi CursorColumn term=reverse cterm=reverse gui=reverse
hi CursorColumn term=reverse ctermbg=6 guibg=DarkCyan



"代码补全
set completeopt=preview,menu
"自动补全
:inoremap( ()<ESC>i
:inoremap) <c-r>=ClosePair(')')<CR>
:inoremap{ {<CR>}<ESC>O
:inoremap} <c-r>=ClosePair('}')<CR>
:inoremap[ []<ESC>i
:inoremap] <c-r>=ClosePair(']')<CR>
:inoremap" ""<ESC>i
:inoremap" <c-r>=ClosePair('"')<CR>
:inoremap' ''<ESC>i
:inoremap' <c-r>=ClosePair('\'')<CR>
function! ClosePair(char)
	if getline('.')[col('.'-1)]==a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on

set completeopt=longest,menu


