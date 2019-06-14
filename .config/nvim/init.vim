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
Plug 'liuchengxu/space-vim-dark'

Plug 'itchyny/lightline.vim'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdcommenter'
Plug 'tmhedberg/SimpylFold'
Plug 'w0rp/ale'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'metakirby5/codi.vim'

Plug 'cormacrelf/vim-colors-github'



call plug#end()

colorscheme github
let g:github_colors_soft = 1

" hi Comment guifg=#5C6370 ctermfg=59
" hi Normal     ctermbg=NONE guibg=NONE
" hi LineNr     ctermbg=NONE guibg=NONE
" hi SignColumn ctermbg=NONE guibg=NONE
" hi Comment cterm=italic


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
call deoplete#custom#option('max_list', 15)

" jedi
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 1
let g:jedi#use_splits_not_buffers = 'bottom'

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


" nerdtree
nmap <F3> :NERDTreeToggle<cr>
nmap <F2> :NERDTreeFind<cr>

" gina
nnoremap <leader>gs :Gina status<cr>
nnoremap <leader>gsh :call GinaHelperPush()<cr>
nnoremap <leader>gsha :Gina push --all<cr>
nnoremap <leader>gc :Gina commit<cr>
call gina#custom#mapping#nmap(
            \ 'status', '<c-^>',
            \ ':<C-u>q<cr>:Gina commit<cr>',
            \ {'noremap': 1, 'silent': 1}
            \ )
" Execute :Gina status with <C-^> on "gina-commit" buffer
call gina#custom#mapping#nmap(
      \ 'commit', '<C-^>',
      \ ':<C-u>q<cr>:Gina status<CR>',
      \ {'noremap': 1, 'silent': 1},
      \)
" Execute :ThisBranch with <leader>tb in the commit buffer
call gina#custom#mapping#nmap(
            \ 'commit', '<leader>b',
            \ ':<C-u>ThisBranch<cr>i',
            \ {'noremap': 1, 'silent': 1},
            \ )
" Gina opener, with vsplit
call gina#custom#command#option(
            \ '/\%(status\|commit\|branch\|changes\|grep\|log\)',
            \ '--opener', 'vsplit'
            \ )

" ale
let g:ale_lint_on_text_changed = 1
nmap <F8> <Plug>(ale_fix)
let g:ale_linters = {'python': ['pylint']}
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {'javascript': ['prettier'], 'scss': ['stylelint'], 'python': ['yapf', 'isort']}
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

" ultisnips
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"
