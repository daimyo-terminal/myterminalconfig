set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
filetype plugin indent on
set autoindent

"set case insensitive
set ignorecase

"set higlight search
set hlsearch
"
set directory=$HOME/.vim/swap//
set omnifunc=syntaxcomplete#Complete
"set relativenumber!
set number

"Python Files
autocmd filetype python set expandtab
autocmd filetype python set tabstop=4
autocmd filetype python set shiftwidth=4

"Undo Dir
set undofile
let my_undo_dir = expand('$HOME/.vim/undodir')
if (!isdirectory(my_undo_dir))
	call mkdir(my_undo_dir, "p")
endif
set undodir=my_undo_dir

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_language_server = [{'name':'lua', 'filetypes':'lua','cmdline':['/home/rootuser/lua-language-server/bin/lua-language-server'],
			\ 'capabilities': { 'textDocument': { 'completion': { 'completionItem': { 'snippetSupport': v:true } } } },
			\ 'triggerCharacters': [],
			\ 'project_root_files': []}]

let g:ycm_semantic_triggers = {
			\ 'python': [ 're!\w{1}' ]
			\}

syntax enable
colorscheme badwolf

set completeopt-=preview

set previewpopup=height:10,width:60,highlight:PMenuSbar
set completeopt+=popup
set completepopup=height:15,width:60,border:off,highlight:PMenuSbar

function ScrollPopup(up=0)
  if (len(popup_list()) >= 1)
    let popid = popup_list()[0]
    let firstline = popup_getoptions(popid)['firstline']
    if (a:up)
      call popup_setoptions(popid, {'firstline': max([1, firstline-1])})
    else
      call popup_setoptions(popid, {'firstline': firstline+1})
    endif
  endif
endfunc

nnoremap <leader>j :call ScrollPopup()<CR>
nnoremap <leader>k :call ScrollPopup(1)<CR>

" call plug#begin()

" List your plugins here
" Plug 'tpope/vim-sensible'


"call plug#end()
