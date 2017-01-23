if ! has('nvim')
    " Defaults only applicable to vim (neovim has these set already)
    set autoindent

    " Don't need vi compatibility.
    set nocompatible

    " Fix backspace on some platforms
    set bs=2

    " show bar by default (Used for airline)
    set laststatus=2

else
    " Neovim specific stuff goes here
    " Disable search highlighting
    set nohlsearch

    let g:neomake_javascript_jshint_maker = {
        \ 'args': ['--verbose'],
        \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
        \ }
    let g:neomake_javascript_enabled_makers = ['jshint']

    let g:neomake_perl_perlcritic_maker = {
        \ 'exe': 'perlcritic',
        \ 'args' : ['--quiet', '--nocolor', '--verbose', '\\%f:\\%l:\\%c:(\\%s) \\%m (\\%e)\\n'],
        \ 'errorformat': '%f:%l:%c:%m,'
        \ }
    let g:neomake_perl_enabled_makers = ['perlcritic']
endif

" Load plugin manager
call plug#begin('~/.vim/plugged')

" Only load YouCompleteMe if this version supports it
if v:version > 703 || (v:version == 703 && has("patch584"))
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
endif

" Vim and Neovim differences
if ! has('nvim')
    Plug 'scrooloose/syntastic'
else
    Plug 'neomake/neomake'
    Plug 'jalvesaq/Nvim-R'
endif

" General plugins
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'vim-scripts/Wombat'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'

" Language specific plugins
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'zah/nim.vim', { 'for': 'nim' }
Plug 'tpope/vim-rails', { 'for': [ 'rb', 'erb', 'haml' ] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': [ 'md', 'markdown' ] }

call plug#end()

" Eclim needs this for autocomplete
filetype plugin indent on

" Make Eclim and YouCompleteMe play nice
let g:EclimCompletionMethod = 'omnifunc'

" Colors!
if !has('nvim') || $NVIM_TUI_ENABLE_TRUE_COLOR!='1'
    let base16colorspace=256  " Use pallete definition mode (base16-shell)
endif

syntax enable
set background=dark
colorscheme base16-tomorrow
hi Normal ctermbg=none
hi Normal guibg=none

" Show line numbers
set nu

" General Indentation Settings
set shiftwidth=4
set expandtab
set softtabstop=4

" Sometimes we only want 2 spaces for tabs
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType haml setlocal shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType sass setlocal shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2

" Make vim highlight *.md files as markdown instead of modula
au BufRead,BufNewFile *.md set filetype=markdown

" Higlight pandoc markdown specially
au BufRead,BufNewFile *.pandoc set filetype=pandoc
let g:pandoc#syntax#conceal#blacklist = [ "subscript", "superscript" ]

" Line wrapping in code is bad
set nowrap

" Tab key bindings
map <F5> :tabp<enter>
map <F6> :tabn<enter>

" Command to insert date
:command Date :r !date +\%Y-\%m-\%d

" Lets OpenURL stuff happen in the Rails plugin
:command -bar -nargs=1 OpenURL :!rifle <args>

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

" In case we forgot to open vim with sudo, we can still save it as root
cmap w!! w !sudo tee > /dev/null %

" Show where we are in the file at the bottom right
set ruler

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" Vim Airline things
let g:airline_powerline_fonts = 1 " Fancy arrows

command FileHeading :exec FileHeading()

" LaTeX make
autocmd FileType tex setlocal makeprg=latexmk\ -xelatex\ -shell-escape\ '%'
autocmd FileType tex setlocal spell
autocmd FileType tex setlocal tw=80
autocmd FileType tex setlocal softtabstop=2
autocmd FileType tex setlocal shiftwidth=2

" Turn on spelling and word wrapping for markdown
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal tw=80

" When reading from stdin, show ansi escape colors
autocmd StdinReadPost * AnsiEsc

" Don't prompt for save when switching buffers
set hidden

" Scenario Learning Perl stuff
autocmd FileType perl setlocal textwidth=78 tabstop=8 shiftwidth=2 matchpairs+=<:> expandtab shiftround
iab phbp #! /usr/bin/perl -w
iab pdbg use Data::Dumper 'Dumper';warn Dumper [];hi
iab pbmk use Benchmark qw( cmpthese );cmpthese -10, {};0
iab pusc use Smart::Comments;###
iab putm use Test::More qw( no_plan );
command Tidy %! perltidy

iab jclj (function() {"use strict";})();

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

" Let YouCompleteMe use tag files automatically
let g:ycm_collect_identifiers_from_tags_files = 0

" Let YouCompleteMe autcomplete plaintext too
let g:ycm_filetype_blacklist = {}

" pandoc -> LaTeX aligned math environment
iab panmath $$\begin{aligned}\end{aligned}$$<Up><Up>

" R stuff
let maplocalleader = ","
let mapleader = ";"
