call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/gina.vim'
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'itchyny/lightline.vim'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdcommenter'
Plug 'tmhedberg/SimpylFold'
Plug 'w0rp/ale'




call plug#end()

colorscheme moonfly

let mapleader = ','
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>so :so %<cr>
nnoremap <silent> <leader><space> :noh<cr>


inoremap jk <esc>

set nu
set relativenumber

" terminal mapping
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>

" turnoff backup
set nobackup
set noswapfile
set nowritebackup

" search config
set ignorecase
set smartcase

" tab and indent
set expandtab
set tabstop=4
set shiftwidth=4

set shell=/bin/bash 


" breakpoint for debugging
au FileType python map <silent> <leader>b Oimport pdb; pdb.set_trace()<esc>

" deoplete
let g:deoplete#enable_at_startup = 1

" jedi
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


" nerdtree
nmap <F3> :NERDTreeToggle<cr>
nmap <F2> :NERDTreeFind<cr>

" gina
nnoremap <leader>gs :Gina status<cr>
nnoremap <leader>gsh :Gina push<cr>
nnoremap <leader>gsha :Gina push --all<cr>
nnoremap <leader>gc :Gina commit<cr>
call gina#custom#mapping#nmap(
            \ 'status', '<c-^>',
            \ ':<C-u>Gina commit<cr>',
            \ {'noremap': 1, 'silent': 1}
            \ )
" Execute :Gina status with <C-^> on "gina-commit" buffer
call gina#custom#mapping#nmap(
      \ 'commit', '<C-^>',
      \ ':<C-u>Gina status<CR>',
      \ {'noremap': 1, 'silent': 1},
      \)
