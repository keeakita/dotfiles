" Disable YouCompleteMe if our version doesn't support it
if v:version < 703 || (v:version == 703 && ! has("patch584"))
  let g:pathogen_disabled = [ "YouCompleteMe" ]
endif

" Load plugin manager
call pathogen#infect()
call pathogen#helptags()


" Eclim needs this for autocomplete
filetype plugin indent on

" Colors!
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
syntax enable
colo wombat256mod

" Show line numbers
set nu

" General Indentation Settings
set autoindent
set shiftwidth=4
set expandtab
set softtabstop=4
" Sometimes we only want 2 spaces for tabs
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType sass setlocal shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 softtabstop=2

" Line wrapping in code is bad, mkay?
set nowrap

" Tab key bindings
map <F5> :tabp<enter>
map <F6> :tabn<enter>

" Command to insert date
:command Date :r !date +\%Y-\%m-\%d

" Stuff from that rails vim site
" http://biodegradablegeek.com/2007/12/using-vim-as-a-complete-ruby-on-rails-ide/
" -------------------------------------------------------------------------------
filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.

" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

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

" Fix backspace on some platforms
set bs=2

" Make tab completion work more like zsh
set wildmode=longest,list

