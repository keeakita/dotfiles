if ! has('nvim')
    " Force vim to use same paths as nvim
    " Requires VIMINIT="source ~/.config/nvim/init.vim" set in env
    set nocompatible
    " set default 'runtimepath' (without ~/.vim folders)
    let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)
    " what is the name of the directory containing this file?
    let s:portable = expand('<sfile>:p:h')
    " add the directory to 'runtimepath'
    let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

    " Defaults only applicable to vim (neovim has these set already)
    set autoindent

    " Fix backspace on some platforms
    set bs=2

    " show bar by default (Used for airline)
    set laststatus=2
else
    " Neovim specific stuff goes here
    " Disable search highlighting
    set nohlsearch

    let g:neoformat_ruby_rubocop = {
        \ 'exe': 'rubocop',
        \ 'args': ['--auto-correct', '--safe-auto-correct', '--stdin', '"%:p"', '2>/dev/null', '|', 'sed "1,/^====================$/d"'],
        \ 'stdin': 1,
        \ 'stderr': 1
        \ }
    let g:neoformat_chef_rubocop = {
        \ 'exe': 'rubocop',
        \ 'args': ['--auto-correct', '--safe-auto-correct', '--stdin', '"%:p"', '2>/dev/null', '|', 'sed "1,/^====================$/d"'],
        \ 'stdin': 1,
        \ 'stderr': 1
        \ }

    let g:neoformat_enabled_python = ['black', 'isort']
    let g:neoformat_run_all_formatters = 1

    augroup fmt
      autocmd!
      au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
    augroup END
endif

" Line wrapping in code is bad
set nowrap

" Load plugin manager
call plug#begin('~/.config/nvim/plugged')

" Nvim only
if has('nvim')
    Plug 'neomake/neomake'
    Plug 'sbdchd/neoformat'
endif

" General plugins
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'

" Language specific plugins
Plug 'oslerw/vim-chef', { 'for': 'rb' }
Plug 'rust-lang/rls', { 'for': 'rs' }
Plug 'LnL7/vim-nix'

call plug#end()

if has('nvim')
    call neomake#configure#automake('w')
endif

" Use per-filetype indent
filetype plugin indent on

syntax enable
set background=dark
colorscheme dim
" Override backgrounds for transparent term
if has('nvim')
    hi Normal ctermbg=none
    hi Normal guibg=none
endif

" Show line numbers
set nu

" General Indentation Settings
set shiftwidth=4
set expandtab
set softtabstop=4

" 2 space tabs for some languages
" TODO: Move these to ftplugin?
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType chef.ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType chef.eruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2

" Make vim highlight *.md files as markdown instead of modula
au BufRead,BufNewFile *.md set filetype=markdown

" Command to insert date
:command Date :r !date +\%Y-\%m-\%d

" Toggle between absolute and relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Make tab completion work more like zsh
set wildmode=longest,list

" Save file as root
cmap w!! w !sudo tee > /dev/null %

" Show file location at the bottom right
set ruler

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" Vim Airline things
let g:airline#extensions#tabline#enabled = 1 " Show open buffers
let g:airline#extensions#tabline#buffer_nr_show = 1 " Show buffer numbers
let g:airline#extensions#tabline#fnamemod = ':t' " Show only filename for buffers

command FileHeading :exec FileHeading()

" LaTeX make
autocmd FileType tex setlocal makeprg=latexmk\ -xelatex\ -shell-escape\ '%'
autocmd FileType tex setlocal spell
autocmd FileType tex setlocal tw=80
autocmd FileType tex setlocal softtabstop=2
autocmd FileType tex setlocal shiftwidth=2

" Turn on spelling and word wrapping for markdown
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal wrap
autocmd FileType markdown setlocal linebreak
autocmd FileType markdown setlocal nolist
autocmd FileType markdown setlocal formatoptions-=t

" When reading from stdin, show ansi escape colors
autocmd StdinReadPost * AnsiEsc

" Don't prompt for save when switching buffers
set hidden

" Spelling on by default in git commit messages
autocmd FileType gitcommit setlocal spell

" Mouse for scrolling only in normal mode
set mouse=n
nmap <LeftMouse> <nop>
nmap <2-LeftMouse> <nop>
nmap <RightMouse> <nop>

" Colors in html
let html_use_css=1
let html_no_pre=1

" Exclude quickfix buffers from :bnext and :bprev
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END
