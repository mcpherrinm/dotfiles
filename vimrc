syntax on
set background=dark

" Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal g'\"" | endif
endif

set autoindent

set splitright		" Set how :vsplit windows are positioned.
set splitbelow		" Set how :split windows are positioned.
set showcmd			" Show (partial) command in status line.
set showmatch		" Show matching brackets.

set ignorecase		" do case insensitive searching 
set smartcase		" if any capitals, do case sensitive search

set incsearch		" Incremental search
set hidden			" Hide buffers when they are abandoned

set number			" Numbers
set nowrap			" No Wrap
set showmode		" show the mode thingy always (insert, replace, visual)
set ruler			" Shows a ruler lile 32,41-54

set scrolloff=10	" This tries to give you four lines of context

set backspace=indent,start,eol "Make backspace work where I expect it to.

"Show tabs and trailing spaces as magic characters 
set list listchars=tab:»·,trail:·,precedes:«,extends:»

set tabstop=2		" This is how wide the tab char is
set shiftwidth=2	" This is how deep indents are.
set expandtab

:command Q q
:command W w
:command Wq wq
:command WQ wq
:command WQa wqa
:command Wqa wqa
:command WQA wqa

au FileType make setl noexpandtab tabstop=4
