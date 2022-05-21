" Normally this if-block is not needed, because `:set nocp` is done
" automatically when .vimrc is found. However, this might be useful
" when you execute `vim -u .vimrc` from the command line.
if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

packadd minpac

if exists('g:loaded_minpac')
  call minpac#init()

  " minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
  " I set this to frozen because minpac is managed by dotfiles
  "call minpac#add('k-takata/minpac', {'type': 'opt', 'frozen': 'TRUE'})

  " plugins!
  call minpac#add('jacoborus/tender.vim')
  call minpac#add('joshdick/onedark.vim')
  call minpac#add('junegunn/seoul256.vim')
  call minpac#add('itchyny/lightline.vim')

  call minpac#add('dense-analysis/ale')

  call minpac#add('elixir-editors/vim-elixir')

  " Uncomment to load all plugins right now
  "packloadall
endif

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  colorscheme tender
else
  colorscheme onedark
endif

set autoindent

" sane backspace behavior
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal

" incremental search...
set incsearch

" ...default to case-insensitive search...
set ignorecase

" ...but also allow patterns with uppercase to trigger case-sensitive
set smartcase

" Give me wildcard-ed command search
set wildmenu

" always show status bar
set laststatus=2

" disable showmode because of lightline
set noshowmode
set ruler

if !&scrolloff
  set scrolloff=10
endif

" try to show as many chars from super long-lines as possible before
" subbing them with @s
set display+=lastline

" encodings for files, but these are just defaults
"set encoding=utf-8
"set fileencoding=utf-8

" auto-reload open files that changed outside of vim
set autoread

if &history < 1000
  set history=1000
endif

" disable options that could override vimrc from mksession
set sessionoptions-=options
set viewoptions-=options

" file type defaults...
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" custom chars for 'set list'
set listchars=eol:$,tab:│·,space:.,trail:·
