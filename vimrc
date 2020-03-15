set nocompatible
filetype off
set clipboard=unnamedplus
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

set number relativenumber
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

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd VimEnter * RainbowParentheses

let g:ale_fix_on_save = 1
let g:ale_c_parse_makefile = 1
let g:ale_linters_explicit = 1

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ycm-core/YouCompleteMe'

Plugin 'dense-analysis/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'Chiel92/vim-autoformat'

Plugin 'chrisbra/csv.vim'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}

call vundle#end()
filetype plugin indent on
syntax on


nnoremap h :wincmd h<CR>
nnoremap j :wincmd j<CR>
nnoremap k :wincmd k<CR>
nnoremap l :wincmd l<CR>

nnoremap 1 1gt
nnoremap 2 2gt
nnoremap 3 3gt
nnoremap 4 4gt
nnoremap 5 5gt
nnoremap 6 6gt
nnoremap 7 7gt
nnoremap 8 8gt
nnoremap 9 9gt
nnoremap 0 0gt

nnoremap g :silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))<CR>

""0	Black   1	Maroon   2	Green
""3	Olive   4	Navy     5	Purple 
""6	Teal    7	Silver   8	Grey 
""9	Red    10	Lime    11	Yellow
""12	Blue   13	Fuchsia 14	Aqua 
""15	White
"hi statusline ctermfg=235 ctermbg=15
"au InsertEnter * hi statusline ctermfg=6 ctermbg=0
"au InsertLeave * hi statusline ctermfg=235 ctermbg=15
"
"" Formats the statusline
"set statusline=%f                           " file name
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%y      "filetype
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=\ %=                        " align left
"set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
"set statusline+=\ Col:%c                    " current column
"set statusline+=\ Buf:%n                    " Buffer number
"set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor
