let g:NERDTreeWinPos = "left"

" 我的快捷键

" 共享剪贴板
set clipboard+=unnamed
" NERDTree
map <S-l> :tabn<cr>             " 下一个tab
map <S-h> :tabp<cr>             " 上一个tab
map <A-n> :tabnew<cr>           " 新tab
map <S-k> :bn<cr>               " 下一个文件
map <S-j> :bp<cr>               " 上一个文件
let NERDTreeIgnore = ['\.pyc$']
nmap <F3> :NERDTreeFocus<CR>

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

" 关掉quickfix快捷键
map <C-c> :cclose<cr>


" 新文件标题
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
        call append(4,"* @author Jerry Liang(liangjr@fenbi.com)")
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

" elsint 语法检查配置
let g:syntastic_javascript_checkers = ['eslint']
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 2

let g:syntastic_check_on_open = 0
let g:syntastic_html_checkers=['eslint']
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 1
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

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
"set ignorecase
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
