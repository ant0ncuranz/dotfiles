set nocompatible
filetype plugin indent on

" open Tagbar if .java file
autocmd VimEnter * if &ft ==# 'java' | call JavaCommands() | endif

" auto toggle relativenumber on focus
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END<Paste>

:function JavaCommands()
:	Tagbar
:endfunction

let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        rightbelow new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

set mouse=a
set number relativenumber
set backspace=2
set numberwidth=3
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set laststatus=2
set ttimeoutlen=50
set background=dark
set autowrite
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

" Custom mappings
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-h> 0
nnoremap <C-j> 3j3<C-e>
nnoremap <C-k> 3k3<C-y>
nnoremap <C-l> $
tnoremap <Esc> <C-\><C-n>
nnoremap <C-Space> :call Term_toggle(10)<cr>
tnoremap <C-Space> <C-\><C-n>:call Term_toggle(10)<cr>

" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F17> <Plug>(JavaComplete-Imports-Add)
imap <F17> <Plug>(JavaComplete-Imports-Add)
let mapleader=','

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_c = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

" NERDTree
let NERDTreeQuitOnOpen = 1

" ale
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = '1'
let g:ale_completion_delay = 0
let g:ale_sign_warning = '>>'
let g:ale_c_gcc_options = '-std=c99 -Wall'
let g:ale_c_clang_options = '-std=c99 -Wall'

let g:ale_linters = {
\   'scss': ['sasslint'],
\   'java': ['javac'],
\}

" Neoformat
let g:neoformat_java_astyle = {
	\ 'exe':   'astyle', 
	\ 'args':  ['--mode=java', '--style=kr', '-f -p -xg -U'],
	\ 'stdin': 1,
	\}
let g:neoformat_enabled_java = ['astyle']
" run Neoformat on :w
:augroup astyle
:  autocmd!
:  autocmd BufWritePre * Neoformat
:augroup END

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1

" Add custom menus
let s:menus = {}

let s:menus.main = {
	\ 'description': 'Main menu'
	\ }
let s:menus.main.command_candidates = [
	\ ['[Wiki] Goto default wiki', 'VimwikiIndex'],
	\ ['[Java] Add import', 'JCimportsAdd'],
	\ ['[Java] Add missing imports', 'JCimportsAddMissing'],
	\ ['[Java] Remove unused imports', 'JCimportsRemoveUnused'],
	\ ['[Java] New Java Class', 'JCclassNew'],
	\ ['[Java] Generate getter and setter', 'JCgenerateAccessorSetterGetter'],
	\ ['[Java] Generate abstract methods', 'JCgenerateAbstractMethods'],
	\ ]

nnoremap <C-P> :Denite menu:main -ignorecase<CR>

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'rstacruz/sparkup', { 'rtp': 'vim/' }
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
" Plug 'terryma/vim-multiple-cursors'
Plug 'lervag/vimtex'
Plug 'w0rp/ale'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'majutsushi/tagbar'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/denite.nvim'
Plug 'sbdchd/neoformat'
Plug 'brooth/far.vim'
Plug 'vimwiki/vimwiki'

call plug#end()

colorscheme gruvbox
hi Normal ctermbg=NONE

call denite#custom#var('menu', 'menus', s:menus)
