" _vimrc
" 修改于：2019-03-09
" 1、换用vim-plug管理插件，去除过时、冗余插件，默认不加载特定编程语言相关插件

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('$VIM/vimfiles/bundle')

Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
" need supporting termguicolors
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree' "打开费时且明显卡顿，用Leaderf替代
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

Plug 'Yggdroot/LeaderF'
Plug 'dyng/ctrlsf.vim'

" 对齐文本
Plug 'godlygeek/tabular'
" 使用Tab键补全
Plug 'ervandew/supertab'
" 使用quickmenu
Plug 'skywind3000/quickmenu.vim'
" 通用编程插件
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
" 对齐代码的虚线，写Python尤其需要
Plug 'Yggdroot/indentLine'
Plug 'Chiel92/vim-autoformat'
Plug 'w0rp/ale'
"Plug 'Valloric/YouCompleteMe'
" Async completion framework made ease
Plug 'maralla/completor.vim'

" 片段，使用ultisnips片段引擎，支持shell、Vimscript、python脚本
Plug 'SirVer/ultisnips'
" 给ultisnips提供snippets
Plug 'honza/vim-snippets'

" 快速执行
Plug 'thinca/vim-quickrun'
" 异步执行
Plug 'skywind3000/asyncrun.vim'

"特定编程语言相关插件，默认不加载
"Plug 'vim-ruby/vim-ruby'
" CSS HTML快速编辑
"Plug 'mattn/emmet-vim'

" Plug from https://github.com/vim-scripts/
" 用不同颜色高亮单词或选中块
Plug 'vim-scripts/Mark'

" Initialize plugin system
call plug#end()

" }}}


" 文件类型侦测 {{{

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" }}}


" 定义快捷键的前缀，即 <Leader>
let mapleader=","


" vim自身（非插件）快捷键 {{{

" alt键不映射到菜单栏
set winaltkeys=no

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 设置快捷键遍历子窗口
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的窗口
nnoremap <Leader>jw <C-W>j

" 加载_vimrc
nmap <leader>s :source $VIM/_vimrc<cr>
" 编辑_vimrc
nmap <leader>e :e $VIM/_vimrc<cr>

" 保存当前缓冲区
nnoremap <leader>w :w<cr>
" 保存全部缓冲区
nnoremap <leader>W :wa<cr>

" 打开当前目录CMD
"map <leader>cmd :!start<cr>
" 打印当前时间
"map <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

" 设置切换Buffer快捷键
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>

" 替换原始的Ctrl-A递加
" 数字递加快捷键更换为Ctrl-+
nnoremap <C-Kplus> <C-A>

" 替换原始的Ctrl-X递减
" 数字递减快捷键更换为Ctrl--
nnoremap <C-KMinus> <C-X>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-x is cut
if has("clipboard")
    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    vnoremap <S-Del> "+x
endif

" 正常模式下 alt+j,k,h,l 调整分割窗口大小
nnoremap <A-j> :resize +5<cr>
nnoremap <A-k> :resize -5<cr>
nnoremap <A-h> :vertical resize -5<cr>
nnoremap <A-l> :vertical resize +5<cr>

" 插入模式移动光标 alt + 方向键
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-h> <left>
inoremap <A-l> <Right>

"删除行末空格 -- 添加到quickmenu
"nnoremap <leader>tw :%s/\s\+$//<CR>:let @/=''<CR>

"清除行尾的^M符号
"nnoremap <silent> <F8> :%s//\r/g<CR>:set fileformat=dos<CR>

"行首插入行号
"nnoremap <silent> <F7> :g/^/exec"s/^/".strpart(line(".")." ",0,4)<CR>

"重定向：选中复制到系统剪切板 F3
vnoremap <F3> "+y

"重定向：当前行复制到系统剪切板 Shift+F3
"noremap <S-F3> "+yy
"vnoremap <S-F3> <C-C>"+yy
"inoremap <S-F3> <C-O>"+yy

"重定向：从系统剪切板粘贴 F4
noremap <F4> "+gP
cmap <F4> <C-R>+
if 1
    exe 'inoremap <script> <F4> <C-G>u'.paste#paste_cmd['i']
    exe 'vnoremap <script> <F4>'.paste#paste_cmd['v']
endif

"重定向：当系统剪切板粘贴 Shift+F4
"noremap <S-F4> "+p
"vnoremap <S-F4> <C-C>"+p
"inoremap <S-F4> <C-O>"+p

"quickfix快捷键
nmap <leader>jn :cn<CR>
nmap <leader>jp :cp<CR>

" 使用jj从插入模式下快速回到normal模式
inoremap jj <ESC>

" }}}


" 搜索设置 {{{

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 高亮显示搜索结果
set hlsearch

" }}}


" 设置字符编码 {{{

" encoding VIM缓冲区以及界面的字符编码；
" termencoding 终端使用的字符编码；
" fileencodings/fileencoding 磁盘文件的字符编码
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp936,ucs-bom,gb18030,gbk,gb2312,latin1

" 解决vim的菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 设置中文帮助
set helplang=cn

" }}}


" GUI配置 {{{

" 配色方案
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

set background=dark
colorscheme molokai

" 禁止显示滚动条
"set guioptions-=l
"set guioptions-=L
"set guioptions-=r
"set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 设置字体
set guifont=Consolas:h14

" 窗口大小
set lines=35 columns=140

" }}}


" 辅助信息 {{{

" time out for key codes
set ttimeout
" wait up to 100ms after Esc for special key
set ttimeoutlen=100

" display incomplete commands
set showcmd

" 光标移动到buffer的顶部和底部时保持3行距离
"set scrolloff=3

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number

" 高亮显示当前行/列
set cursorline
"set cursorcolumn

" 关闭错误信息响铃
"set noerrorbells
" 关闭使用可视响铃代替呼叫
"set novisualbell
" 置空错误铃声的终端代码
"set t_vb=

"启动时不显示 捐赠提示
set shortmess=atl

" 插入模式输入括号时可以短暂跳转到匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=2

" vim 自身命令行模式智能补全
set wildmenu

" }}}


" 禁止折行
set nowrap

" 100个历史命令
set history=100

" 自动切换当前目录为当前文件所在的目录
"set autochdir

" Vim的默认寄存器和系统剪贴板共享
"set clipboard+=unnamed

" backspace设置
" 插入模式下可以删除行首的缩进
" 可以删除前一行行末的回车
" 进入插入模式后，可以删除原有字符
set backspace=indent,eol,start
" 按左方向键可以移动到上一行
" 按右方向键可以移动到下一行
set whichwrap+=<,>,[,]

" 选择模式下光标可以移动到行尾字符的右边一个字符（past line），但是复制时不会包括移动出的那个字符
set selection=exclusive
" 使用鼠标和shift键进入选择模式
set selectmode=mouse,key

" 语法分析 {{{

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" }}}


" 缩进 {{{

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 继承前一行的缩进方式，特别适用于多行注释
"set autoindent
" 使用C样式的缩进
"set cindent
" 为C程序提供自动缩进
"set smartindent

" }}}


" 代码折叠 {{{

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" }}}


" 环境恢复 {{{

" 设置不备份
set nobackup

" 保存 undo 历史。必须先行创建 .undo_history/
if has("persistent_undo")
    set undodir=$VIM/.undo_history/
    set undofile
endif

" }}}


" 启动时窗口最大化 {{{

"if has("win32")
"	au GUIEnter * simalt ~x
"endif

" }}}


" NERDTree {{{

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>

" NERDTree窗口宽度
let NERDTreeWinSize=30
" NERDTree窗口位置（'left' or 'right'）
let NERDTreeWinPos="left"

" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeMouseMode=2

" 让Tree把自己给装饰得多姿多彩漂亮点
let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定书签文件
let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'

" 是否默认显示行号
let NERDTreeShowLineNumbers=0
" 是否默认显示文件
let NERDTreeShowFiles=1
" 显示隐藏文件
let NERDTreeShowHidden=1
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1

" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

" ?: 快速帮助文档
" o: 打开一个目录或者打开文件，创建的是buffer，也可以用来打开书签
" go: 打开一个文件，但是光标仍然留在NERDTree，创建的是buffer
" t: 打开一个文件，创建的是Tab，对书签同样生效
" T: 打开一个文件，但是光标仍然留在NERDTree，创建的是Tab，对书签同样生效
" i: 水平分割创建文件的窗口，创建的是buffer
" gi: 水平分割创建文件的窗口，但是光标仍然留在NERDTree
" s: 垂直分割创建文件的窗口，创建的是buffer
" gs: 和gi，go类似
" x: 收起当前打开的目录
" X: 收起所有打开的目录
" e: 以文件管理的方式打开选中的目录
" D: 删除书签
" P: 大写，跳转到当前根路径
" p: 小写，跳转到光标所在的上一级路径
" K: 跳转到第一个子路径
" J: 跳转到最后一个子路径
" <C-j>和<C-k>: 在同级目录和文件间移动，忽略子目录和子文件
" C: 将根路径设置为光标所在的目录
" u: 设置上级目录为根路径
" U: 设置上级目录为跟路径，但是维持原来目录打开的状态
" r: 刷新光标所在的目录
" R: 刷新当前根路径
" I: 显示或者不显示隐藏文件
" f: 打开和关闭文件过滤器
" q: 关闭NERDree
" A: 全屏显示NERDTree，或者关闭全屏

" }}}

" NERDTree for nerdtree-git-plugin {{{

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" }}}


" UndoTree {{{

nnoremap <F5> :UndotreeToggle<cr>

" }}}

" The-NERD-Commenter 注释代码用的，以下映射已写在插件中 {{{

let NERDMenuMode = 0
" <Leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
" <Leader>cc 注释当前行
" <Leader>cs 以”性感”的方式注释
" <Leader>cA 在当前行尾添加注释符，并进入Insert模式
" <Leader>cu 取消注释
" <Leader>cm 添加块注释

" }}}


" tagbar {{{

" toggle tagbar display
nmap <leader>tb :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
let g:tarbar_width=40
autocmd BufReadPost *.py,*.cpp,*.c,*.h,*.cc,*.cxx,*.hpp,*.lua call tagbar#autoopen()

" }}}


" vim-quickrun {{{

let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}

let g:quickrun_no_default_key_mappings = 1
"nmap <Leader>r <Plug>(quickrun)
"map <F10> :QuickRun<CR>

" }}}


" LeaderF {{{

let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}

let g:Lf_NormalMap = {
	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
	\ }

" }}}


" CtrlSF {{{

" :CtrlSF pattern dir  // 如果后面不带 dir 则默认是 . 当前目录搜索
" 使用 Ctrl + j/k 在匹配项中跳转

" 设置ctrlsf 使用ag
let g:ctrlsf_ackprg = 'ag'

" }}}


" quickmenu.vim {{{

" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "LH"

" clear all the items
call g:quickmenu#reset()

" bind to F12
noremap <silent><F12> :call quickmenu#toggle(0)<cr>

" section 1, text starting with "#" represents a section (see the screen capture below)
call g:quickmenu#append('# Develop', '')

call g:quickmenu#append('item 1.1', 'echo "1.1 is selected"', 'select item 1.1')
call g:quickmenu#append('item 1.2', 'echo "1.2 is selected"', 'select item 1.2')
call g:quickmenu#append('item 1.3', 'echo "1.3 is selected"', 'select item 1.3')

" section 2
call g:quickmenu#append('# Misc', '')

call g:quickmenu#append('删除行尾空格', '%s/\s\+$//', ':%s/\s\+$//')
call g:quickmenu#append('行首插入行号', 'g/^/exec"s/^/".strpart(line(".")." ",0,4)', ':g/^/exec"s/^/".strpart(line(".")." ",0,4)')
call g:quickmenu#append('item 2.3', 'echo "2.3 is selected"', 'select item 2.3')
call g:quickmenu#append('item 2.4', 'echo "2.4 is selected"', 'select item 2.4')

" }}}


" UltiSnips {{{

let g:UltiSnipsExpandTrigger = '<tab>'
" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
let g:UltiSnipsJumpForwardTrigger = '<tab>' " 在snippets间前向跳转
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>' " 在snippets间后向跳转
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"

" }}}


" airline设置 {{{

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" }}}


" airline设置 {{{

" Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)
"set encoding=utf-8
set langmenu=zh_CN.UTF-8
" 设置打开文件的编码格式
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set fileencoding=utf-8
"解决菜单乱码
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"解决consle输出乱码
"set termencoding = cp936
"设置中文提示
language messages zh_CN.utf-8
"设置中文帮助
"set helplang=cn
"设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double

"let laststatus = 2
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
"tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
"tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
"tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1

"字体DejaVu Sans Mono for Powerline，需放在配置文件最后面
set guifont=DejaVu_Sans_Mono_for_Powerline:h13:cANSI

"配置wombat主题
let g:airline_theme='wombat'

" }}}
