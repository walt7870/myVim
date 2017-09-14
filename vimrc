set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'

" the following are examples of different formats supported.
" keep plugin commands between vundle#begin/end.
" plugin on github repo
"plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

"nerdtree setting
map <F2> :NERDTreeToggle<CR>
"colorschemes setting
colorscheme molokai

"TAB替换为空格：
set ts=4
set expandtab
%retab!

"空格替换为TAB：
"set ts=4
"set noexpandtab
"%retab!


"设置行列高亮
set cursorcolumn
set cursorline

highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"highlght 主要是用来配色的，包括语法高亮等个性化的配置。可以通过:h
"highlight，查看详细信息
"
"CursorLine 和 CursorColumn 分别表示当前所在的行列
"
"cterm 表示为原生vim设置样式，设置为NONE表示可以自定义设置。
"
"ctermbg 设置终端vim的背景色
"
"ctermfg 设置终端vim的前景色
"
"guibg 和 guifg
"分别是设置gvim的背景色和前景色，本人平时都是使用终端打开vim，所以只是设置终端下的样式
"

"搜索结果高亮
set hlsearch
"设置粘贴不自动缩减
set paste
set pastetoggle=<F9> 
"取消换行自动注释
"set formatoptions=ql
