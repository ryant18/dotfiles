set nocompatible
filetype off
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

set number
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

set laststatus=2
set showcmd
set splitbelow

set t_Co=256
set completeopt-=preview
color molokai

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_key_list_stop_completion = ['<C-y>', '<UP>', '<DOWN>']

highlight Comment cterm=bold

let g:AutoPairs={'(':')', '[':']', '{':'}', "'''":"'''"}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['yapf', 'add_blank_lines_for_python_control_statements', 'isort'],
\   'c': ['clang-format'],
\}

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ycm-core/YouCompleteMe'

Plugin 'vim-syntastic/syntastic'
Plugin 'dense-analysis/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Chiel92/vim-autoformat'

Plugin 'chrisbra/csv.vim'

call vundle#end()
filetype plugin indent on
syntax on


nnoremap <s-h> :wincmd h<CR>
nnoremap <s-j> :wincmd j<CR>
nnoremap <s-k> :wincmd k<CR>
nnoremap <s-l> :wincmd l<CR>

nnoremap ! 1gt
nnoremap @ 2gt
nnoremap # 3gt
nnoremap $ 4gt
nnoremap % 5gt
nnoremap ^ 6gt
nnoremap & 7gt
nnoremap * 8gt
nnoremap ( 9gt
nnoremap ) 0gt

nnoremap <C-g> :silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))<CR>
