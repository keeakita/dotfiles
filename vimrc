" Defaults only applicable to vim (neovim has these set already)
if ! has('nvim')
    set autoindent

    " Don't need vi compatibility.
    set nocompatible

    " Fix backspace on some platforms
    set bs=2

    " show bar by default (Used for airline)
    set laststatus=2

    " Load syntastic instead of neomake
    let g:pathogen_disabled = [ "neomake" ]
else
    " Neovim specific stuff goes here

    " Load neomake instead of syntastic
    let g:pathogen_disabled = [ "syntastic" ]

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

" Disable YouCompleteMe if this version doesn't support it
if v:version < 703 || (v:version == 703 && ! has("patch584"))
  let g:pathogen_disabled = [ "YouCompleteMe" ]
endif

" R stuff?
let maplocalleader = ","
let mapleader = ";"

" Load plugin manager
call pathogen#infect()
call pathogen#helptags()

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

" Stuff from that rails vim site
" http://biodegradablegeek.com/2007/12/using-vim-as-a-complete-ruby-on-rails-ide/
" -------------------------------------------------------------------------------
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

set cf  " Enable error files & error jumping.
" -------------------------------------------------------------------------------

" Lets OpenURL stuff happen in the Rails plugin
:command -bar -nargs=1 OpenURL :!firefox <args>

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

" CSE 2421 heading for files
function FileHeading()
  let s:line=line(".")
  call setline(s:line, '/*')
  call append(s:line,  ' * '.expand('%:t'))
  call append(s:line+1,' *')
  call append(s:line+2,' * Created by William Osler on '.strftime("%Y-%m-%d"))
  call append(s:line+3,' * CSE 2421 TuTh 8am')
  call append(s:line+4,' * 0x05194C41')
  call append(s:line+5,' */')
  unlet s:line
endfunction

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
