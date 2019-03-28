

" automatic installation of plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Townk/vim-autoclose'
Plug 'mileszs/ack.vim'
Plug 'guns/vim-clojure-static'

Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dgrnbrg/vim-redl'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jackiehluo/vim-material'
Plug 'MichaelBlume/vim-cljfmt'
Plug 'whatyouhide/vim-gotham'
Plug 'gonzaloserrano/vim-salve', { 'branch': 'revert-14-cljc-files' }

call plug#end()

let &t_Co=256
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" vim clojure static
syntax on
filetype plugin indent on

" Clojure
" Refresh all code into repl
nnoremap cll :Eval (clojure.tools.namespace.repl/refresh-all)<CR>
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^Given', '^When', '^Then']

" theme
colorscheme Tomorrow-Night-Eighties

" set t_Co=256
set encoding=utf-8
set lcs+=space:·
set autoindent
set tabstop=2
set laststatus=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list
set list listchars=tab:→\ ,trail:·,eol:¬
set ruler
set nowrap
set guioptions-=r
set guioptions-=l
set colorcolumn=80
set guioptions-=b
set guioptions-=T
set incsearch
set cursorline
set backspace=indent,eol,start
set showmatch
set nobackup
set noswapfile
set number
set autoread
set nornu

"
" ctrlP config
"
" Use this option to change the mapping to invoke CtrlP in |Normal| mode: >
let g:ctrlp_map = '<c-p>'

" Set the default opening command to use when pressing the above mapping: >
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.git', '.hg', 'Rakefile']
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn))|(node_modules|vendor|coverage|target)$'

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" use silver searcher
" http://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " use ag on Ack
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap \ :Ack<SPACE>

" Show Marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen

" Leave insert mode with `jk`
inoremap jk <ESC>

" Wrap forms with parenthesis with: <Space>i, <Space>I, <Space>w, <Space>W
nnoremap <Space> <Nop>
let maplocalleader=" "

" remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Omni complete on tab
function! SuperCleverTab()
  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

let mapleader = ","
map <Leader>m :Rmodel <CR>
map <Leader>c :Rcontroller <CR>
map <Leader>v :Rview <CR>
map <Leader>u :Runittest <CR>
