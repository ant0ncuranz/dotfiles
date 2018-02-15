set nocompatible              " be iMproved, required
filetype off                  " required
syntax enable
set mouse=a
set nu
set backspace=2

set numberwidth=3
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set laststatus=2
set ttimeoutlen=50

let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

" hi LineNr ctermfg=blue
" hi SignColumn ctermbg=NONE
" hi VertSplit ctermbg=NONE cterm=NONE

" set fillchars+=vert:\

set background=dark
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

set autowrite
set noshowmode

" let g:BASH_Ctrl_j = 'off'

" Custom mappings
map <C-t> :NERDTreeToggle<CR>
map <C-s> :w<CR>
" map <C-z> :undo<CR>
" map <C-y> :redo<CR>
map <F9> :call CompileIt()<CR>
nnoremap <C-j> 2j2<C-e>
nnoremap <C-k> 2k2<C-y>

:function! CompileIt()
:    execute "silent !clear && make"
:    execute "!./" . expand("%<")
:endfunction

" NERDCommenter
let mapleader=','
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

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'raimondi/delimitmate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'lervag/vimtex'
Plugin 'w0rp/ale'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'itchyny/lightline.vim'
" Plugin 'christoomey/vim-tmux-navigator'
Plugin 'morhetz/gruvbox'
colorscheme gruvbox
hi Normal ctermbg=NONE

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
