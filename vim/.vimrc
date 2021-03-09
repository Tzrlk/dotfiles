
set nocompatible | filetype indent plugin on | syntax on
colorscheme torte

if has("win32")
	let s:vimdir = expand($HOME . '/vimfiles')
else
	let s:vimdir = expand($HOME . "/.vim")
endif

set runtimepath=s:vimdir,$VIMRUNTIME

"==============================================================================

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

"==============================================================================

fun! SetupVAM()

	let c = get(g:, 'vim_addon_manager', {})
	let g:vim_addon_manager = c
	let c.plugin_root_dir = expand(s:vimdir . '/vim-addons')
	let s:vamdir = expand(c.plugin_root_dir . '/vim-addon-manager')
	let &rtp.=(empty(&rtp)?'':',') . s:vamdir
	let vam_autoload_dir = expand(s:vamdir . '/autoload')

	if !isdirectory(vam_autoload_dir)
		silent execute '!git clone --depth=1 https://github.com/MarcWeber/vim-addon-manager.git '
				\       shellescape(s:vamdir, 1)
	endif

	call vam#ActivateAddons([])

endfun

call SetupVAM()

"==============================================================================

VAMActivate git:https://github.com/godlygeek/tabular.git
" VAMActivate git:https://github.com/editorconfig/editorconfig-vim.git
" VAMActivate git:git@github.com:valloric/youcompleteme.git
VAMActivate git:https://github.com/powerman/vim-plugin-AnsiEsc.git

fun! TypePlugin(type, repo)
	au FileType ${type} VAMActivate git:https://github.com/${repo}.git
endfun

" Syntax extension mappings
au BufNewFile,BufRead *.adoc  set filetype=asciidoc
au BufNewFile,BufRead *.df    set filetype=dockerfile
au BufNewFile,BufRead *.rs    set filetype=rust
au BufNewFile,BufRead *.nix   set filetype=nixos
au BufNewFile,BufRead *.pcgen set filetype=pcgen
au BufNewFile,BufRead *.ps1   set filetype=ps1

autocmd BufNewFile,BufReadPost *.ps1 set filetype=ps1

au FileType yaml setl sw=2 sts=2 et

" Filetype specific plugins
au FileType lojban   VAMActivate git:https://github.com/devyn/lojban.vim.git
au FileType json     VAMActivate git:https://github.com/elzr/vim-json.git
au FileType puppet   VAMActivate git:https://github.com/rodjek/vim-puppet.git
au FileType rust     VAMActivate git:https://github.com/rust-lang/rust.vim.git
au FileType nixos    VAMActivate git:https://github.com/marcweber/vim-addon-nix.git
au FileType asciidoc VAMActivate git:https://github.com/asciidoc/vim-asciidoc.git
au FileType ps1      VAMActivate git:https://github.com/PProvost/vim-ps1.git
au FileType xml      VAMActivate git:https://github.com/othree/xml.vim.git
au FileType pcgen    VAMActivate git:https://github.com/PCGen/vim-pcgen.git

"==============================================================================

" Set line endings
set fileformat=unix

" Set character encoding
set encoding=utf-8
set fileencoding=utf-8

" Setting the font.
set guifont=Lucida_Console:h10

" Adding a column size
set colorcolumn=80
"set textwidth=78
"set formatoptions+=t

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

