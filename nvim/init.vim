set nocompatible
filetype off
set clipboard=unnamedplus
set mouse=a
set number relativenumber
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set laststatus=2
set showcmd
set updatetime=100
set splitbelow
set t_Co=256
set completeopt-=preview
set shortmess+=c
set signcolumn=yes
color molokai 

command W w

imap jk <Esc>
imap kj <Esc>

nnoremap <S-j> j<C-E>
nnoremap <S-k> k<C-Y>

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

set pastetoggle=<F3>



call plug#begin('~/.config/nvim/plugins')

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
command Split :call fzf#run({
\   'down': '30%',
\   'sink': 'botright split' })

command Vsplit :call fzf#run({
\   'down': '30%',
\   'sink': 'vertical split' })

Plug 'junegunn/rainbow_parentheses.vim'
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd VimEnter * RainbowParentheses

Plug 'jiangmiao/auto-pairs'
let g:AutoPairs={'(':')', '[':']', '{':'}', "'''":"'''"}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


Plug 'psliwka/vim-smoothie'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-unimpaired'

call plug#end()
filetype plugin indent on
syntax on
