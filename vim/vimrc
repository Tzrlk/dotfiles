
set nocompatible | filetype indent plugin on | syntax on
colorscheme torte

if has("win32")
	let s:vimdir = expand($HOME . '/vimfiles')
else
	let s:vimdir = expand($HOME . "/.vim")
endif

set runtimepath=s:vimdir,$VIMRUNTIME

fun! SetupVAM()

	let c = get(g:, 'vim_addon_manager', {})
	let g:vim_addon_manager = c
	let c.plugin_root_dir = expand(s:vimdir . '/vim-addons')
	let s:vamdir = expand(c.plugin_root_dir . '/vim-addon-manager')
	let &rtp.=(empty(&rtp)?'':',') . s:vamdir
	let vam_autoload_dir = expand(s:vamdir . '/autoload')

	if !isdirectory(vam_autoload_dir)
		silent execute '!git clone --depth=1 git@github.com:MarcWeber/vim-addon-manager.git '
				\       shellescape(s:vamdir, 1)
	endif

	call vam#ActivateAddons([])

endfun

call SetupVAM()

VAMActivate git:git@github.com:devyn/lojban.vim.git
VAMActivate git:git@github.com:elzr/vim-json.git

fun! SetupBackups()

	if !isdirectory(s:vimdir)
		echo 'Creating ' . s:vimdir
		silent execute '!mkdir ' . s:vimdir
	endif

	" Save your backups to a less annoying place than the current directory.
	let s:backupdir = expand(s:vimdir . '/backup')
	if !isdirectory(s:backupdir)
		echo 'Creating ' . s:backupdir
		silent execute '!mkdir ' . s:backupdir
	endif

	let &backupdir = expand(s:backupdir . '//')
	set backup

	" Save your swp files to a less annoying place than the current directory.
	let s:swapdir = expand(s:vimdir . '/swap')
	if isdirectory(s:swapdir) == 0
		echo 'Creating ' . s:swapdir
		silent execute '!mkdir ' . s:swapdir
	endif

	let &directory = expand(s:swapdir . '//')

	" viminfo stores the the state of your previous editing session
	let &viminfo .= ',n' . expand(s:vimdir . '/viminfo')

	if exists("+undofile")

		" undofile - This allows you to use undos after exiting and restarting
		" :help undo-persistence
		" This is only present in 7.3+
		let s:undodir = expand(s:vimdir . '/undo')
		if isdirectory(s:undodir) == 0
			echo 'Creating ' . s:undodir
			silent execute '!mkdir ' . s:undodir
		endif

		let &undodir = expand(s:undodir . '//')
		set undofile

	endif

endfun

call SetupBackups()

" Set line endings
set fileformat=unix

" Set character encoding
set encoding=utf-8
set fileencoding=utf-8

" Setting the font.
set guifont=Lucida_Console:h10

" Adding a column size
set colorcolumn=80
set textwidth=78
set formatoptions+=t

" Managing tab size
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Backspace functionality
set backspace=indent,eol,start

" Showing whitespace
" set list
" set listchars=tab:│\ ,trail:¬

" Showing line numbers
set number

