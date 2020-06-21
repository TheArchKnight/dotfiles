set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'stevearc/vim-arduino'
Plugin 'scrooloose/nerdtree'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'Yggdroot/indentLine'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'sheerun/vim-polyglot'
Plugin 'joshdick/onedark.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'rakr/vim-one'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'bling/vim-bufferline'
Plugin 'mboughaba/i3config.vim'
Plugin 'cpiger/NeoDebug'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'moll/vim-bbye'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()            " required
filetype plugin indent on    " required


"++++++++VARIABLES++++++++++++++"

"Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe. Used for YCM to properly autocomplete
let g:OmniSharp_server_use_mono = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:UltiSnipsEditSplit="vertical"
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_compiler_options = ' -ansi -pedantic'
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -pedantic '
let g:ycm_semantic_triggers = {
  \   'cpp': [ 're!\w{1}' ],
  \   'c' :  [ 're!\w{1}' ],
  \ }
let g:OmniSharp_server_stdio = 1

let g:arduino_dir = '/home/anorak/Arduino'
let mapleader = ","
let g:onedark_termcolors = 256
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
let g:onedark_terminal_italics=1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"++++++++++++++++SETS++++++++++++"
syntax on
colorscheme onedark
set background=dark
set t_Co=256
set encoding=utf-8
set number
set t_Co=256	
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

"Set for colorscheme to work properly
if (has("termguicolors"))
    set termguicolors
endif

"++++++++++++++KEYBINDS+++++++++++"
nmap <Leader>+ :res +1  <CR>
nmap <Leader>- :res -1 <CR>
nmap <Leader>g :TagbarToggle <CR>
nmap <Leader>t :below vert term <CR>
nmap <Leader>v :below vert new <CR>
nmap <Leader>c :source ~/.vimrc <CR>
nmap <Leader>n :bn <CR>
nmap <Leader>p :bp <CR>
nmap <Leader>d :Bdelete <CR>
nmap <Leader>b :CMake <CR>
nmap <Leader>c :CMakeClean <CR>
nmap <Leader>e :NERDTree <CR>
nmap <Leader>so :set spell! <CR>
nmap <Leader>ss :set spelllang=es <CR>
nmap <Leader>se :set spelllang=en <CR>
nmap <Leader>yd :YcmCompleter GoToDefinition <CR>
nmap <Leader>yc :YcmCompleter GoToDeclaration <CR>
nmap <Leader>f :%!astyle <CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"+++++++++++++++FILETYPES+++++++++++"
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

