"Go go pathogen
call pathogen#infect()
call pathogen#helptags()

"Basic settings {{{

set nocompatible
filetype plugin on
filetype indent on
syntax enable

"Exterior
if ($TERM == 'linux')
	set t_Co=8
else
	set t_Co=256
endif

colors jellybeans
syntax on
set number
set guifont=Mono\ 11
set foldenable
set guioptions-=T

"tags - search for .tags file until Projects dir
set tags=./tags;~/Projects

"set lines=999
"set columns=9999
set ruler
set hidden
set backspace=indent,eol,start
"Show matching parenthesis
set showmatch

"Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
"This is mainly for Python
set expandtab

"Indent settings
set autoindent
set smartindent

"Case Settings
set ignorecase
set smartcase

"Search settings
set incsearch
set hlsearch

"Indent settings
set autoindent
set smartindent

"}}}

"Special events auto commands {{{

augroup specialEventsAutoCmds
autocmd!

"Remove trailing whitespace before saving
autocmd BufWritePre * :%s/\s\+$//e

"Source VIMRC right after saving it
autocmd BufWritePost .vimrc source $MYVIMRC

"Change currect directory to current buffer's
autocmd BufEnter * cd %:p:h

augroup END

" }}}

"Filetype specific settings {{{

augroup fileTypeAutoCommands
autocmd!

autocmd filetype vim setlocal foldmethod=marker
autocmd filetype vim setlocal foldlevelstart=0

autocmd filetype haskell setlocal expandtab
autocmd filetype haskell setlocal tabstop=4
autocmd filetype haskell setlocal shiftwidth=4
autocmd filetype haskell setlocal softtabstop=4
autocmd filetype haskell nnoremap <leader>r :!runhaskell %<cr>
autocmd filetype haskell nnoremap <leader><leader>r :!ghci %<cr>
autocmd FileType haskell nnoremap <buffer> <leader>t :HdevtoolsType<CR>
autocmd FileType haskell nnoremap <buffer> <silent> <leader>i :HdevtoolsInfo<CR>
autocmd FileType haskell nnoremap <buffer> <silent> <leader>u :HdevtoolsClear<CR>
"Show listchars
"autocmd filetype haskell set list
"autocmd filetype haskell set listchars=tab:>.,trail:.,extends:#,nbsp:.

"autocmd filetype prolog nnoremap <leader>pc :!gplc @%

augroup END

"}}}

"Key mappings (non-plugin-specific) {{{

let mapleader=","

map <leader>m :
nmap <silent> <leader>ev :e $MYVIMRC<cr>
"So that you open it XMonad instead
"nmap <silent> <leader>en :e ~/Dropbox/linux/todo.otl<cr>
nmap <silent> <leader>eobm :e ~/.config/openbox/menu.xml<cr>
nmap <silent> <leader>ex :e ~/.xmonad/xmonad.hs<cr>
nmap <silent> <Tab> :tabnext<cr>
nmap <silent> <S-Tab> :tabprevious<cr>
set pastetoggle=<F2>

nmap Q ggVG"+y<c-o><c-o>zz

nnoremap <silent> <Plug>unimpairedBlankUp   :<C-U>put!=repeat(nr2char(10),v:count)<Bar>']+1<CR>
nnoremap <silent> <Plug>unimpairedBlankDown :<C-U>put =repeat(nr2char(10),v:count)<Bar>'[-1<CR>
nmap [<Space> <Plug>unimpairedBlankUp
nmap ]<Space> <Plug>unimpairedBlankDown

:nnoremap <silent> ,/ :noh<return>
imap fj <esc>
imap jf <esc>
imap hg <c-n>
nmap <Leader>. i<space><esc>i
nmap <space> <c-d>
nmap <backspace> <c-u>
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-c><c-j> <c-w>j<c-w>c
nnoremap <c-c><c-k> <c-w>k<c-w>c
nnoremap zl zL
nnoremap zh zH

"}}}

"EasyMotion {{{
let g:EasyMotion_leader_key = '<Leader>n'
let g:EasyMotion_mapping_f = '<Space>'
let g:EasyMotion_mapping_F = '<Space><Space>'
let g:EasyMotion_keys = 'fjdksla;ruvmeic,ghtybnwox.qpz/4738291056FJDKSLA:RUVNEIC<GHTYBNWOX>QPZ?$&#*@(!)%^'
"}}}

"Fuzzy Finder {{{
nnoremap <silent> <Leader>ff :FufFile<CR>
nnoremap <silent> <Leader>fd :FufDirWithFullCwd<CR>
nnoremap <silent> <Leader>fbo :FufBookmarkDir<CR>
nnoremap <silent> <Leader>fbu :FufBuffer<CR>
nnoremap <silent> <Leader>fh :FufHelp<CR>
nnoremap <silent> <Leader>fc :FufCoverageFile<CR>
let g:fuf_keyOpen = '<tab>'
"}}}

"For C/C++
let g:C_MapLeader  = ',c'
filetype plugin indent on

"Colors for auto-complete menu
highlight Pmenu ctermbg=0 ctermfg=6
highlight PmenuSel cterm=bold ctermfg=3

"Syntastic
" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': ['hs'],
	\ 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_haskell_checkers = ['hdevtools', 'hlint']
nnoremap <Leader>se :Errors<CR>

"Tagbar
nnoremap <F8> :TagbarToggle<CR>

"Jsctags - Should be switched to a generic tags solution with exuberant ctags
"Depending on filetype
nnoremap <Leader>ct :silent !jsctags %<CR>

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist = {'python':1}

"EasyGrep
let g:EasyGrepRecursive = 1

