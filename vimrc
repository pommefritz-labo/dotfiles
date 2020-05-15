"" basic setting
" disable unused features
set nobackup
set noswapfile
set autoread

" interface
syntax on
set number
set cursorline
set showmatch
set wildmenu
set backspace=indent,eol,start

" encoding
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp,
set fileformats=unix,dos,mac
scriptencoding utf-8

" tab
set expandtab
set tabstop=2
set shiftwidth=2

" search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

" Indent
if has("autocmd")
  filetype plugin on
  filetype indent on
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
endif

"" Advance setting
" key mapping
inoremap {{ {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [[ []<ESC>i
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap << <><LEFT>
inoremap `` ``<LEFT>
" inoremap || ||<LEFT>
noremap j gj
noremap k gk
noremap <S-h>   ^
noremap <S-l>   $
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-L>
nnoremap <C-]> g<C-]> 
inoremap <C-]> <ESC>g<C-]> 
inoremap jk <ESC>
inoremap kj <ESC>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" leader
let mapleader = "\<Space>"

" Tag jump
set tags=./tags;$HOME

"" Plugin
call plug#begin('~/.vim/plugged')

" Ruby
Plug 'tpope/vim-endwise'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" let g:UltiSnipsExpandTrigger="<tab>" 
" let g:UltiSnipsJumpForwardTrigger="<tab>" 
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:go_fmt_command = "goimports"
let g:go_version_warning = 0
Plug 'SirVer/ultisnips'

" Python
Plug 'davidhalter/jedi-vim'
let g:jedi#completions_command = "<C-N>"

" Javascript
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }

" Vue
Plug 'posva/vim-vue'
autocmd FileType vue syntax sync fromstart

" Elixir
Plug 'elixir-editors/vim-elixir'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Complete
Plug 'ycm-core/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '${HOME}/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_insertion = 1
set splitbelow
let g:ycm_python_interpreter_path = '/usr/local/bin/python3'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" filer
Plug 'scrooloose/nerdtree'
nnoremap <silent> <space>u :NERDTreeToggle<CR>

" Brackets
Plug 'tpope/vim-surround'

" Comment
Plug 'scrooloose/nerdcommenter'

" Emmet
Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Lint
Plug 'w0rp/ale'
let g:ale_lint_on_text_changed = 0
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" fzf
set rtp+=~/.fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <silent> <space>fzf :GFiles<CR>
nnoremap <silent> <space>gfs :GFiles?<CR>
nnoremap <silent> <space>buf :Buffers<CR>
nnoremap <silent> <space>grep :BLines<CR>

" Color
Plug 'tomasr/molokai'
let g:molokai_original = 1
colorscheme darkblue

" Interface
Plug 'vim-airline/vim-airline'

" Indent
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']

" Unsorted
Plug 'vim-scripts/closetag.vim'
call plug#end()
