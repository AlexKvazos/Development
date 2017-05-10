" ----------------------
" AlexKvazos
" ----------------------


" --------------------------------------------------
" GENERAL
" --------------------------------------------------
set history=1000                      " lots of command line history
set cf                                " error files / jumping
set ffs=unix,dos,mac                  " support these files
set isk+=_,$,@,%,#,-                  " none word dividers
set viminfo='1000,f1,:100,@100,/20
set modeline                          " make sure modeline support is enabled
set autoread                          " reload files (no local changes only)
set encoding=utf-8                    " Set default encoding to UTF-8
let g:vroom_use_vimux = 0

"----------------------------------------------------------------------------
"" Color schemes for gnome and tmux
"----------------------------------------------------------------------------
""if $COLORTERM == 'gnome-terminal'
  "set term=gnome-256color
  ""else
    "if $TERM == 'xterm'
    "    "set term=xterm-256color
    "      "end
    "      "endif
    "      "set term=xterm-256color
set t_Co=256


" ------------------------------------------------
" VIMPLUG
" ------------------------------------------------
set nocompatible                      " required
filetype off

call plug#begin('~/.vim/plugged')

" util
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'chrisbra/Colorizer'
Plug 'haya14busa/incsearch.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

" theme
Plug 'crusoexia/vim-monokai'

" lang
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

call plug#end()
filetype plugin indent on


" --------------------------
" UI
" --------------------------
set ruler                  " show the cursor position all the time
set showcmd                " show command
set number                 " line numbers
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set ch=1                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling

" ----------------------------
" Visual feedback
" ----------------------------
set expandtab
set nospell
set showmatch
set mat=5
set incsearch
set ignorecase
set visualbell             " shut the fuck up
set cursorline             " highlight the cursor line


" -----------------------------------
"  Text Formatting
" -----------------------------------
set autoindent             " automatic indent new lines
set smartindent            " be smart about it
set nowrap                 " do not wrap lines
set softtabstop=2          " yep, two
set shiftwidth=2           " ..
set tabstop=4
set expandtab              " expand tabs to spaces
set nosmarttab             " fuck tabs
set formatoptions+=n       " support for numbered/bullet lists
set virtualedit=block      " allow virtual edit in visual block ..


" --------------------------
" color scheme
" --------------------------
syntax on
colorscheme monokai

" ----------------------
" Omnicompletion
" ----------------------
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,javascript.jsx setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" ----------------------------------------------------------------------------
"   Highlight And Remove Trailing Whitespace
"  ----------------------------------------------------------------------------
set list listchars=trail:.,tab:>.
highlight SpecialKey ctermfg=DarkGray ctermbg=Black
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun


" ---------------------------------
" Incsearch
" --------------------------------
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


" ------------------------------------
" nerdtree
" ------------------------------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFocus<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ------------------------------------
" airline
" ------------------------------------
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
set laststatus=2
set guifont=Droid\ Sans\ Mono\ for\ Powerline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" ------------------------------------
" Syntastic
" ------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ---------------------------
" Ctrlp
" ---------------------------
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" -------------------------------
" Neocomplete
" -------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
  \}

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ------------------------------------
" Neosnippets
" ------------------------------------
" Plugin key-mappings.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"
"" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


" ------------------------------
" Backup directory
" ------------------------------
set directory=~/tmp
set backupdir=~/tmp

" --------------------------
" Javascript
" --------------------------
let g:javascript_plugin_jsdoc = 1
let g:used_javascript_libs = 'angularjs,underscore,react,chai'
let g:jsx_ext_required = 0

" ------------------------------
" Indent guides
" ------------------------------
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" -----------------------------------
" Mappings
" -----------------------------------

" leader
let mapleader = ","

" panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set splitright

" buffers
nmap <leader>t :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR" buffernmap <leader>T :enew<CR>

" faster line scrolling
nmap <C-e> 10:<C-e>

" adjust viewports to same size
map <Leader>= <C-w>=

" toggle nerdtree
nmap <leader>n :NERDTreeToggle<CR>

autocmd FileType javascript,css autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
