set nocompatible              " be iMproved, required
syntax on
set backspace=indent,eol,start
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
"Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"Plugin 'FuzzyFinder'
" scripts not on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...
"
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
"**********安装插件××××××××××××××××××
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'

" 自动补全配置
set completeopt=longest,menu
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :
"\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" :
"\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1   " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2   "
"从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1  " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>  "force recomile with
"syntastic
"nnoremap <leader>lo :lopen<CR>   "open locationlist
"nnoremap <leader>lc :lclose<CR>  "close locationlist
inoremap <leader><leader> <C-x><C-o>
 "在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

filetype plugin indent on     " required
set nocompatible " 关闭 vi 兼容模式
set smartindent " 开启新行时使用智能自动缩进
"syntax on " 自动语法高亮
set number " 显示行号
set cursorline " 突出显示当前行
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set expandtab
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
set showcmd " 在状态栏显示正在输入的命令
imap <C-w> <Esc>:w<CR>i
filetype plugin indent on "依文件类型设置自动缩进
set smarttab "开启时，在行首按TAB将加入shiftwidth个空格，否则加入tabstop个空格
nnoremap <silent> [b :bprevious<CR>
nnoremap <F2> :set nonumber!<CR>
nnoremap <F3> :w<CR>:!clear<CR>:!clear&&python %<CR>
imap <F4> <Esc>:w<CR>i
nnoremap <F5> :source ~/.vimrc<CR>
nnoremap <F6> :w<CR>:!python %<CR>
nnoremap <F7> :w<CR>:!g++ % -o %<<CR>:!./%<<CR>
nnoremap <F8> :NERDTree<CR>
nnoremap <F9> :w<CR>:!make clean<CR><CR>:!make<CR>
nnoremap <F10> :w<CR>:!./%<<CR>
set mouse=a
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
inoremap <C-v> <Esc>:set paste!<CR>i<C-r>+<Esc>:set paste!<CR>i
setlocal makeprg=python\ %
filetype plugin indent on " 开启插件

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set foldmethod=indent
set foldlevel=99
set autochdir
set tags=tags;
set tags+=/home/zqp/local_install/tags
"inoremap ( ()<Esc>i
"nnoremap <silent> <F5> :NERDTree<CR>
"set nobackup " 覆盖文件时不备份
"set autochdir " 自动切换当前目录为当前文件所在的目录
"set backupcopy=yes " 设置备份时的行为为覆盖
"set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan " 禁止在搜索到文件两端时重新搜索
"set matchtime=2 " 短暂跳转到匹配括号的时间
"set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
"set cmdheight=1 " 设定命令行的行数为 1
"set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
"" 设置在状态行显示的信息
"set foldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为
" set foldclose=all " 设置为自动关闭折叠 
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 用空格键来开关折叠
"set ruler " 打开状态栏标尺
