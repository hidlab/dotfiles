set number
set noautoindent
set cindent
set expandtab
set tabstop=4
set shiftwidth=4
set ruler
set list
set nowrap

"encoding
set fileencoding=cp932
set fileformat=dos

"バックアップファイル出力設定
set backupdir=$VIM/bak
"undoファイル出力設定
set undodir=$VIM/undo

"swpファイル生成dir指定
let &directory = &backupdir

let $mydoc='$HOME/Documents'
let $desktop='$HOME/Desktop'

"初期カレントディレクトリの設定
:cd $desktop

nnoremap <C-j> <C-D>
nnoremap <C-k> <C-U>

"vim起動時のみ
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

"neobundle.vimの初期化
call neobundle#begin(expand('~/.vim/bundle'))
"NeoBundle更新用設定
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

"プラグイン読込
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
NeoBundle 'grep.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'haya14busa/incsearch.vim'

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"markdown用プラグイン
NeoBundle 'plasticboy/vim-markdown'

NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'

"vim-quickrunの設定
let g:quickrun_config = {}
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

filetype plugin indent on
NeoBundleCheck

au BufRead,BufNewFile *.md set filetype=markdown
