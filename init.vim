"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

let g:vim_dir = expand('~/.config/nvim')

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" if don't have dein, install it
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

execute 'set runtimepath+=' . s:dein_repo_dir

" setup dein
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    
    let s:rc_dir = g:vim_dir . '/toml'
    let s:toml = s:rc_dir . '/dein.toml'
    call dein#load_toml(s:toml, {'lazy': 0})
    
    call dein#end()
    call dein#save_state()
endif

" install check
if dein#check_install()
    call dein#install()
endif

" remove check  
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif

filetype plugin indent on
syntax enable
"end dein Scripts-----------------------------

" run script
execute 'source ' . g:vim_dir . '/plugin/hl_dein_toml.vim'

" 画面
set autoread
set hidden
set title
set number
set showmatch matchtime=1
set splitright
set completeopt=menuone

" コマンド表示
set showcmd
set laststatus=2
set wildmode=list:longest

" 文字
set encoding=utf-8

" ハイライト
autocmd ColorScheme * highlight LineNr ctermfg=141 ctermbg=240
autocmd ColorScheme * highlight CursorLine ctermbg=235

" インデント
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent

" 編集
set clipboard=unnamed

" カーソル
set cursorline
set virtualedit=onemore
set whichwrap=b,s,h,l,<,>,[,],~
set backspace=indent,eol,start

" ケースマッチング
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

" キーマップ
inoremap jj <ESC>
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <Space>fw :w !sudo tee %

" nnoremap <Space>ju :e! ++enc=shift-jis \| :set fenc=utf-8
" nnoremap <Space>uj :e! ++enc=utf-8     \| :set fenc=shift-jis
