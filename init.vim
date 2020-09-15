let mapleader=" "       " 设置leader键为空格

" 基础
set nocompatible        " 不与 Vi 兼容
set backspace=2         " 解决插入模式下delete/backspce键失效问题
set showmode		    " 在底部显示，当前处于命令模式还是插入模式
set showcmd		        " 命令模式下，在底部显示，当前键入的指令
set mouse=a		        " 支持使用鼠标。
set encoding=utf-8	    " 使用 utf-8 编码
set t_Co=256		    " 启用256色
let &t_ut=''            " 修复vim配色问题
syntax on		        " 打开语法高亮
filetype on
filetype indent on	    " 开启文件类型检查，并且载入与该类型对应的缩进规则
filetype plugin on
filetype plugin indent on

" 缩进
set autoindent		    " 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set tabstop=4           " 按下 Tab 键时，Vim 显示的空格数
set shiftwidth=4	    " 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数
set expandtab		    " 由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格
set softtabstop=4	    " Tab 转为多少个空格
set foldmethod=indent   " 收缩代码块
set foldlevel=99

" 外观
set list
set listchars=tab:▸\ ,trail:▫
set number		    " 显示行号
set relativenumber	    " 显示光标所在的当前行的行号，其他行都为相对于该行的相对行号
set cursorline	    " 光标所在的当前行高亮
set textwidth=80	    " 设置行宽
set wrap		        " 自动折行
set linebreak		    " 不会在单词内部折行
set wrapmargin=2	    " 指定折行处与编辑窗口的右边缘之间空出的字符数
set scrolloff=20	    " 垂直滚动时，光标距离顶部/底部的位置
set laststatus=2	    " 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示
set ruler		        " 在状态栏显示光标的当前位置（位于哪一行哪一列）
set termguicolors       " 开启真彩色

" 搜索
set showmatch           " 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set hlsearch            " 搜索时，高亮显示匹配结果
exec "nohlsearch"
" 开启vim的时候自动取消高亮
set incsearch           " 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set ignorecase          " 搜索时忽略大小写
set smartcase           " 大小写智能搜索

" 编辑
set undofile            " 保留撤销历史
set autochdir           " 自动切换工作目录
" set visualbell          " 出错时，发出视觉提示，通常是屏幕闪烁
set history=100         " Vim 需要记住多少次历史操作
set wildmenu            " 这两个是智能自动补全
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 下次编辑的时候让光标记忆上次更改的地方

" 改键

" 设置括号、引号自动补全
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ` ``<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O


" 设置空格+回车为取消搜索高亮
noremap <LEADER><CR> :nohlsearch<CR>

" 更改=为下一个并居中，-为上一个搜索结果并居中
noremap = nzz
noremap - Nzz

" 可以让上下移动速度快一点
noremap J 5j
noremap K 5k
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

" 开启or关闭拼写检查
map <LEADER>sc :set spell!<CR>

" 分屏操作，hjkl选择分屏位置
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

" scv为分屏垂直布局、sch为分屏水平布局
map scv <C-w>t<C-w>H
map sch <C-w>t<C-w>K

" 根据leader键+hjkl进行分屏间移动
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

" 方向键控制分屏大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>


" ta新建标签页、th上一个标签页、tl下一个标签页
map ta :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

" 插件
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


" ===
" === 设置配色
" ===

colorscheme onedark

" ===
" === 导览
" ===

map tt :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1
map ff :Tagbar<CR>

" ===
" === 自动补全插件
" ===

let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-jedi',
    \ 'coc-json',
    \ 'coc-markdownlint',
    \ 'coc-sh'
    \ ]

" 用tab选择补全候选
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
