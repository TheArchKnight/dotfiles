set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'stevearc/vim-arduino'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'Yggdroot/indentLine'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'arcticicestudio/nord-vim'
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
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'jackguo380/vim-lsp-cxx-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sainnhe/edge'

call vundle#end()            " required
filetype plugin indent on    " required

"++++++++VARIABLES++++++++++++++"

let mapleader = ","
let g:arduino_dir = '/home/anorak/Arduino'
"let g:onedark_termcolors = 256
let g:onedark_terminal_italics=1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:termdebug_wide=1
let g:termdebugger='gdb-multiarch'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'edge'
let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1

"++++++++++++++++SETS++++++++++++"
syntax on
colorscheme edge
set background=dark
set completeopt=noinsert,menuone,noselect
set t_Co=256
set encoding=utf-8
set number
set t_Co=256	
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
set showtabline=2
set tabstop=3
set shiftwidth=3
set expandtab
set laststatus=2
set noshowmode
if !has('gui_running')
  set t_Co=256
endif
"Set for colorscheme to work properly
if (has("termguicolors"))
 set termguicolors
endif
"++++++++++++++STARTUP++++++++++++"

autocmd VimEnter * packadd termdebug
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
packadd termdebug
"++++++++++++++KEYBINDS+++++++++++"
nmap <Leader>+ :res +1  <CR>
nmap <Leader>- :res -1 <CR>
nmap <Leader>g :TagbarToggle <CR>
nmap <Leader>td :Termdebug <CR>
nmap <Leader>ttv :below vsplit term://bash <CR>
nmap <leader>tth :below term://bash <CR>
nmap <Leader>v :below vert new <CR>
nmap <Leader>c :source ~/.config/nvim/init.vim <CR>
nmap <Leader>n :bn <CR>
nmap <Leader>p :bp <CR>
nmap <Leader>d :Bdelete <CR>
nmap <Leader>e :CocCommand explorer<CR>
nmap <Leader>f :CocCommand explorer --preset floating<CR>
nmap <silent>a :call CocAction('jumpDefinition', 'drop')<CR> 
nmap <Leader>so :set spell! <CR>
nmap <Leader>ss :set spelllang=es <CR>
nmap <Leader>se :set spelllang=en <CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"+++++++++++++++FILETYPES+++++++++++"
au BufRead,BufNewFile *.pde set filetype       =arduino
au BufRead,BufNewFile *.ino set filetype       =arduino
au BufRead,BufNewFile *.c   set shiftwidth =4 | set autoindent | set cindent
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
