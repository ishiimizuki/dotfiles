"-------------------------------------------------------------------------------
" plugin
"-------------------------------------------------------------------------------
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim.git
  call neobundle#rc(expand('~/.vim/.bundle'))
endif

NeoBundle 'Shougo/vimproc'
NeoBundle 'taichouchou2/vim-endwise.git'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neocomplcache-rsense'
NeoBundle 'taichouchou2/rsense-0.3'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-rails'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'AutoClose'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-rake'
NeoBundleLazy 'ujihisa/unite-rake'
NeoBundleLazy 'taichouchou2/unite-rails_best_practices'
NeoBundleLazy 'taichouchou2/unite-reek'
NeoBundleLazy 'taichouchou2/alpaca_complete'

let s:bundle_rails = 'unite-rails unite-rails_best_practices unite-rake alpaca_complete'

NeoBundleLazy 'vim-ruby/vim-ruby'
NeoBundleLazy 'taka84u9/vim-ref-ri'
NeoBundleLazy 'skwp/vim-rspec'
NeoBundleLazy 'ruby-matchit'

filetype plugin on
filetype plugin indent on


"-------------------------------------------------------------------------------
" 基本設定 Basics
"-------------------------------------------------------------------------------
set nocompatible                 " Vi互換をオフ
set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set formatoptions-=ro            " 改行時のコメントアウト自動継続を無効化
set vb t_vb=                     " ビープをならさない
set browsedir=buffer             " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set modelines=0                  " モードラインは無効
let mapleader = ","              " キーマップリーダー
set clipboard=unnamed            " OSのクリップボードを使用する"

"map  
"map!  

filetype plugin on

"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------
set t_Co=256
"colorscheme railscasts
colorscheme molokai
"autocmd VimEnter * :GuiColorScheme darkspectrum

" ハイライト on
syntax enable
" 補完候補の色づけ for vim7
" hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
" hi PmenuSel ctermbg=blue ctermfg=black
" hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
" hi PmenuSbar ctermbg=0 ctermfg=9
" hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF

"-------------------------------------------------------------------------------
" インデント Indent
"-------------------------------------------------------------------------------
set autoindent   " 自動でインデント
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xhtml      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et

  "--------------------------------------------------
  " Syntax Check or Execute
  "--------------------------------------------------
  
endif

" 選択した範囲のインデントサイズを連続して変更する
vnoremap < <gv
vnoremap > >gv

"-------------------------------------------------------------------------------
" 表示 Apperance
"-------------------------------------------------------------------------------
set shortmess+=I      " 起動時のメッセージを消す
set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex      " 印字不可能文字を16進数で表示

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" カーソル行をハイライト
set cursorline

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

highlight CursorLine guibg=#262626 " カーソル行のカラーを設定
highlight NonText    guifg=#666666 " NonTextのカラーを設定
highlight Pmenu      guibg=#666666 " ポップアップメニューのカラーを設定
highlight PmenuSel   guibg=#8cd0d3 guifg=#666666
highlight PmenuSbar  guibg=#333333

" コマンド実行中は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast

set splitbelow       " 横分割したら新しいウィンドウは下に
set splitright       " 縦分割したら新しいウィンドウは右に

"-------------------------------------------------------------------------------
" 移動設定 Move
"-------------------------------------------------------------------------------
"nnoremap h <Left>
"nnoremap j gj
"nnoremap k gk
"nnoremap l <Right>
"nnoremap <Down> gj
"nnoremap <Up>   gk

" インサートモードでもCtrl + hjklで移動

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"フレームサイズを怠惰に変更する

" 前回終了したカーソル行に移動

" 最後に編集された位置に移動

" 矩形選択で自由に移動する
"set virtualedit+=block


"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

"Escの2回押しでハイライト消去

"選択した文字列を検索
"選択した文字列を置換

"s*置換後文字列/g<Cr>でカーソル下のキーワードを置換


"-------------------------------------------------------------------------------
" 編集関連 Edit
"-------------------------------------------------------------------------------
" insertモードを抜けるとIMEオフ
"set noimdisable
"set iminsert=0 imsearch=0
"set noimcmdline
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" Tabキーを空白に変換
set expandtab

" コンマの後に自動的にスペースを挿入
"inoremap , ,<Space>

" インサートモード中に<C-o>でyankした内容をputする

" 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
" autocmd BufWritePre * :%s/\t/  /ge

"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding
"-------------------------------------------------------------------------------
" 文字コード認識はbanyan/recognize_charcode.vimへ
set fileformats=unix,dos,mac  " 改行文字
set encoding=utf-8    " デフォルトエンコーディング
set fenc=utf-8
"set fencs=iso-2022-jp,enc-jp,cp932
autocmd FileType svn    :set fileencoding=utf-8
autocmd FileType js     :set fileencoding=utf-8
autocmd FileType css    :set fileencoding=utf-8
autocmd FileType html   :set fileencoding=utf-8
autocmd FileType xml    :set fileencoding=utf-8
autocmd FileType java   :set fileencoding=utf-8
autocmd FileType php    :set fileencoding=utf-8
autocmd FileType python :set fileencoding=utf-8

" ワイルドカードで表示するときに優先度を低くする拡張子
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932

"--------------------------------------------------------------------------------
" easy motion settings
"--------------------------------------------------------------------------------

" ホームポジションに近いキーを使う
let g:EasyMotion_keys='qwertyuiopasdfghjklzxcvbnm'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key=';'
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
