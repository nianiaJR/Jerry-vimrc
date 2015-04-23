filetype off                  " required
set nocompatible              " be iMproved, required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set go=             " 不要图形按钮  
syntax on           " 语法高亮  
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set showcmd         " 输入的命令显示出来，看的清楚些  
  
set novisualbell    " 不要闪烁(不明白)  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

" 设置配色方案
set background=dark "背景使用黑色 

"colorscheme torte
"colorscheme murphy
"colorscheme desert 
"colorscheme desert 
"colorscheme elflord
"colorscheme ron
colorscheme slate
"colorscheme murphy
"colorscheme solarized
"字体 
"if (has("gui_running")) 
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 
"endif
" set ruler           " 显示标尺  
" set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  
" set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
" set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
" set foldenable      " 允许折叠  
" set foldmethod=manual   " 手动折叠
" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'pangloss/vim-javascript'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'git://github.com/digitaltoad/vim-jade.git'
" 搞明白的插件
"
" NERDTree目录插件
Plugin 'git://github.com/scrooloose/nerdtree.git'
"
" 颜色配置以及高亮支持
" vim-coffee-script
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
"
" Ag快速查找插件，比grep要快很多
Plugin 'rking/ag.vim'
"
" 编辑中4个空格的缩紧线条显示插件
Plugin 'Yggdroot/indentLine'
"
" javascript 语法规范检查
Bundle 'lykling/fecs.vim'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" 快捷键设置 和 对应的函数定义
"
" NERDTree
map <S-l> :tabn<cr>             " 下一个tab
map <S-h> :tabp<cr>             " 上一个tab
map <A-n> :tabnew<cr>           " 新tab
map <S-k> :bn<cr>               " 下一个文件
map <S-j> :bp<cr>               " 上一个文件
let NERDTreeIgnore = ['\.pyc$']
nmap <F3> :NERDTreeFocus<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建.c,.h,.sh,.java文件，自动插入文件头 
map <F4> :call SetTitle()<cr>'s
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
	endif
    if &filetype == 'javascript'
		call append(0,"/**") 
		call append(1,"*") 
		call append(2,"* @file") 
		call append(3,"*")
        call append(4,"* @author Jerry Liang(liangjiarui@baidu.com)")
        call append(5,"* Date: ".strftime("%Y-%m-%d"))
        call append(6,"*/")
    endif
	if &filetype == 'cpp'
		call append(0,"/**")
		call append(1,"* @author: Jerry")
		call append(2,"* Date: ".strftime("%Y-%m-%d"))
		call append(3,"* Tags: ")
		call append(4,"* difficulty: ")
		call append(5,"*/")
		call append(6,"#include<iostream>")
		call append(7,"")
		call append(8,"using namespace std;")
		call append(9,"")
		call append(10,"class Solution {};")
		call append(11,"int main(){}")
	endif
	if &filetype == 'c'
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc

map <F9> :call SaveInputData()<CR>
func! SaveInputData()
	exec "tabnew"
	exec 'normal "+gP'
	exec "w! /tmp/input_data"
endfunc

nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> +y
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
map <C-F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"横向屏幕扩大
nmap <C-l> :vertical resize +1<CR>
"横向屏幕缩小
nmap <C-h> :vertical resize -1<CR>
"纵向屏幕扩大
nmap <C-k> :resize +1<CR>
"纵向屏幕缩小
nmap <C-j> :resize -1<CR>
"quickfix的快速前移动和后撤"
nmap <silent> <C-N> :cn<CR>zv
nmap <silent> <C-P> :cp<CR>zv
"列出当前目录文件  
"map <F3> :tabnew .<CR>  
"打开树状文件目录  
"map <C-F3> \be  
"C，C++ 按F5编译运行
"map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'py'
		exec "!python %"
		exec "!python %<"
	endif
endfunc
"c,c++的调试
""map <f8> :call rungdb()<cr>
""func! rungdb()
""	exec "w"
""	exec "!g++ % -g -o %<"
""	exec "!gdb ./%<"
""endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd filetype c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"允许插件  
filetype plugin on
"共享剪贴板  
set clipboard+=unnamed 
"从不备份  
set nobackup
"make 运行
:set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
""set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
"set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
"set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=1
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse -=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap { {}<ESC>O
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDtee设定
"let NERDChristmasTree=1
"let NERDTreeAutoCenter=1
"let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
"let NERDTreeMouseMode=2
"let NERDTreeShowBookmarks=1
"let NERDTreeShowFiles=1
"let NERDTreeShowHidden=1
"let NERDTreeShowLineNumbers=1
"let NERDTreeWinPos='left'
"let NERDTreeWinSize=31
"nnoremap f :NERDTreeToggle
"map <F7> :NERDTree<CR>  
"colorscheme solarized

" 屏幕缩进竖线设置,插件indentLine
let g:indentLine_color_term=239
let g:indentLine_char='|'
let g:solarized_termcolors=256
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
