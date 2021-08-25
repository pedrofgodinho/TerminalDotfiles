" ----- Plugins -----

call plug#begin('~/.tdot-vim')

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" ----- CoC Extensions -----
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ----- CoC Setup -----
set hidden
set cmdheight=2
command! -nargs=0 Format :call CocAction('format')

" Some servers have issues with backup files. Uncomment this if you face such
" issues
"set nobackup
"set nowritebackup

set updatetime=300

set shortmess+=c

autocmd BufRead,BufNewFile * set signcolumn=yes
autocmd FileType tagbar,nerdtree set signcolumn=no

" Tab to cycle options
inoremap <silent><expr> <TAB> 
    \ pumvisible() ? "\<C-n>" : 
    \ <SID>check_back_space() ? "\<TAB>" : 
    \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

" ----- NERDTree Config -----
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=0
let NERDTreeWinPos="left"
let NERDTreeWinSize=31
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTre is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

nmap <F2> :NERDTreeToggle<CR>

" ----- indentLine Config -----
let g:indentLine_faster = 1
let g:indentLine_setConceal = 0

" ----- Tagbar Config -----
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_position = 'botright vertical'
nmap <F8> :TagbarToggle<CR>

" ----- Airline Config -----
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" ----- Using buffers as tabs -----
nmap <c-t> :enew<CR>
nmap <c-w> :bp<BAR> bd #<CR>
nmap <c-c> :bnext<CR>
nmap <c-z> :bprevious<CR>

" ----- CtrlP Config -----
let g:ctrlp_map = '<c-p>'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']

" ----- General Vim Config -----

" Spaces and tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set autoindent
set smartindent

set backspace=indent,eol,start

" UI
syntax on
set diffopt+=vertical
set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
:augroup END
set wildmenu
set mouse=a
set scrolloff=10
let g:material_theme_style = 'darker'
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
set cursorline

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

" Search
set showmatch
set incsearch
set hlsearch
set ic

" Movement
nnoremap j gj
nnoremap k gk

" Clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
