set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'stevearc/vim-arduino'
Plugin 'scrooloose/nerdtree'
Plugin 'benmills/vimux'
"Plugin 'sigidagi/vim-cmake-project'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

"Plugin 'stevearc/vim-arduino'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'Yggdroot/indentLine'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-latex/vim-latex'
Plugin 'sheerun/vim-polyglot'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'majutsushi/tagbar'
" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'rakr/vim-one'
" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'
Plugin 'https://github.com/xuhdev/vim-latex-live-preview'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'bling/vim-bufferline'
 " Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
set number
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif	
syntax on
set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

let g:airline_theme='onedark'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:OmniSharp_server_use_mono = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ycm_collect_identifiers_from_tags_files = 1
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
:let g:vimfiler_as_default_explorer = 1
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_compiler_options = ' -ansi -pedantic'
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -pedantic '
let g:ycm_semantic_triggers = { 
  \   'cpp': [ 're!\w{1}' ], 
  \   'c' :  [ 're!\w{1}' ],
  \ }
"let g:ycm_semantic_triggers = { 'c' : [ 're!\w{1}' ] }
let g:OmniSharp_server_stdio = 1
let g:livepreview_previewer = 'zathura'
let ayucolor="mirage"
let g:arduino_dir = '/home/anorak/Arduino'
let mapleader = ","
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

colorscheme onehalfdark
"colorscheme ayu

set background=dark " for the dark version
set encoding=utf-8

"nmap <F7> :res +1  <CR>
"nmap <F6> :res -1 <CR>
nmap <Leader>+ :res +1  <CR>
nmap <Leader>- :res -1 <CR>
"nmap <F8> :TagbarToggle <CR>
"nmap <F3> :bn <CR>
"nmap <F2> :bp <CR>
"nmap <F4> :bdelete <CR>
nmap <Leader>t :TagbarToggle <CR>
nmap <Leader>n :bn <CR>
nmap <Leader>p :bp <CR>
nmap <Leader>d :bd <CR>
nmap <Leader>e :NERDTree <CR>
nmap <Leader>so :set spell! <CR>
nmap <Leader>ss :set spelllang=es <CR>
nmap <Leader>se :set spelllang=en <CR>
"nmap <F9> :%!astyle <CR>
nmap <Leader>f :%!astyle <CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>


au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

function CompileXeTex()
    let oldCompileRule=g:Tex_CompileRule_pdf
    let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
    call Tex_RunLaTeX()
    let g:Tex_CompileRule_pdf=oldCompileRule
endfunction
map <Leader>lx :<C-U>call CompileXeTex()<CR>

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
