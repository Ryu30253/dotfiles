tart Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
 
" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
NeoBundle 'surround.vim' 
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
NeoBundle 'Lokaltog/vim-easymotion'
Requiredsymotion-fl
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplete.vim'
"neocomplete設定　ここから
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

if !exists('g:neocomplete#sources#dictionary#dictionaries')
	let g:neocomplete#sources#dictionary#dictionaries = {}
endif
let dict = g:neocomplete#sources#dictionary#dictionaries

let g:neocomplete#sources#buffer#disabled_pattern = '\.log\|\.log\.\|\.jax\|Log.txt'
let g:neocomplete#enable_ignore_case = 0
let g:neocomplete#enable_smart_case  = 1
let g:neocomplete#enable_fuzzy_completion = 0

call neocomplete#custom_source('_', 'sorters',  ['sorter_length'])
call neocomplete#custom_source('_', 'matchers', ['matcher_head'])

inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"
inoremap <expr><C-e>  pumvisible() ? neocomplete#close_popup() : "<End>"
inoremap <expr><C-c>  neocomplete#cancel_popup()
inoremap <expr><C-u>  neocomplete#undo_completion()
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
"ここまで　neocomplete設定

NeoBundle 'junegunn/vim-easy-align'
"NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/neomru.vim'
NeoBundle "thinca/vim-quickrun"
NeoBundle "Shougo/unite.vim"
NeoBundle "osyo-manga/unite-quickfix"
NeoBundle "osyo-manga/shabadou.vim"
" 横分割をするようにする
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config = {
\   "_" : {
\       "hook/close_unite_quickfix/enable_hook_loaded" : 1,
\       "hook/unite_quickfix/enable_failure" : 1,
\       "hook/close_quickfix/enable_exit" : 1,
\       "hook/close_buffer/enable_failure" : 1,
\       "hook/close_buffer/enable_empty_data" : 1,
\       "outputter" : "multi:buffer:quickfix",
\       "hook/shabadoubi_touch_henshin/enable" : 1,
\       "hook/shabadoubi_touch_henshin/wait" : 20,
\       "outputter/buffer/split" : ":botright 8sp",
\       "runner/vimproc/updatetime" : 40,
\   }
\}

" 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
set splitbelow
set splitright
NeoBundle 'ujihisa/quicklearn'
nnoremap <space>l :<C-u>Unite quicklearn -immediately<Cr>

"NeoBundle 'osyo-manga/unite-quickrun_config'
NeoBundle 'scrooloose/syntastic.git'

NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Shougo/vimfiler'

NeoBundle 'LeafCage/yankround.vim'

call neobundle#end()
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

[Backspace] で既存の文字を削除できるように設定
"  start - 既存の文字を削除できるように設定
"  eol - 行頭で[Backspace]を使用した場合上の行と連結
"  indent - オートインデントモードでインデントを削除できるように設定
set backspace=start,eol,indent
" 特定のキーに行頭および行末の回りこみ移動を許可する設定
"  b - [Backspace]  ノーマルモード ビジュアルモード
"  s - [Space]      ノーマルモード ビジュアルモード
"   - [→]          ノーマルモード ビジュアルモード
"  [ - [←]          挿入モード 置換モード
"  ] - [→]          挿入モード 置換モード
"  ~ - ~            ノーマルモード
set whichwrap=b,s,[,],,~
" マウス機能有効化
set mouse=a
" シンタックスハイライト有効化 (背景黒向け。白はコメントアウト
" されている設定を使用)
syntax on
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
"highlight Normal ctermbg=grey ctermfg=black
"highlight StatusLine term=none cterm=none ctermfg=grey ctermbg=black
"highlight CursorLine term=none cterm=none ctermfg=darkgray ctermbg=none
set nohlsearch " 検索キーワードをハイライトしないように設定
set cursorline " カーソルラインの強調表示を有効化
" 行番号を表示
set number
" ステータスラインを表示
set laststatus=2 " ステータスラインを常に表示
set statusline=%F%r%h%= " ステータスラインの内容
" インクリメンタル検索を有効化
set incsearch
" 補完時の一覧表示機能有効化
set wildmenu wildmode=list:full
" 自動的にファイルを読み込むパスを設定 ~/.vim/userautoload/*vim
set runtimepath+=~/.vim/
runtime! userautoload/*.vim
nmap s <Plug>(easymotion-s2)
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
set autoindent
set shiftwidth=3
set tabstop=3
set smartindent

" 挿入モードでのカーソル移動
inoremap <C-b> <C-g>u<C-h>
inoremap <C-h> <C-g>u<C-h>
inoremap <C-j> <Esc>

vnoremap <C-j> <Esc>

" unite.vim
"入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer
file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j>
unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j>
unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l>
unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l>
unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC> "

"Textobj-multiblock マッピング
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

"YankRound マッピング
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

"半角文字の設定
"set guifont=Sauce Code Powerline:h14

"全角文字の設定
"set guifontwide=Sauce Code Powerline:h14
"Display
"colorscheme desert
set background=dark
syntax on   "シンタックスカラーリングを設定する
set title    "編集中のファイル名を表示する
set showcmd    "入力中のコマンドを表示する
set ruler    "座標を表示する
set showmatch   "閉じ括弧の入力時に対応する括弧を表示する


set matchtime=3 "showmatchの表示時間
set laststatus=2    "ステータスラインを常に表示する

set wildmenu	"コマンドモードの補完をTabキーでできるように
set ignorecase "補完するときに大文字小文字区別しない

".gvimrc カラー設定
""カラー設定した後にCursorIMを定義する方法
colorscheme mycolor

if has('multi_byte_ime')
	highlight Cursor guifg=NONE guibg=Green
	highlight CursorIM guifg=NONE guibg=Purple
endif

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
"""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine('Enter')
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
	endif
endfunction

function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction

