set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'majutsushi/tagbar'
Plugin 'arcticicestudio/nord-vim'
Plugin 'rakr/vim-one'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'mboughaba/i3config.vim'
Plugin 'cpiger/NeoDebug'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'moll/vim-bbye'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plugin 'derektata/lorem.nvim'
Plugin 'norcalli/nvim-colorizer.lua'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-dadbod'
Plugin 'kristijanhusak/vim-dadbod-ui'
Plugin 'folke/tokyonight.nvim', { 'branch': 'main' }
Plugin 'yaegassy/coc-htmldjango', {'do': 'yarn install --frozen-lockfile'}
Plugin 'tweekmonster/django-plus.vim'
Plugin 'NTBBloodbath/doom-one.nvim'
Plugin 'mattn/emmet-vim'
Plugin 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plugin 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }


Plugin 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these

call vundle#end()            " required
filetype plugin indent on    " required

"++++++++VARIABLES++++++++++++++"
"luafile ~/.vim/lua/tressiter.lua
"
set termguicolors
lua require'colorizer'.setup()
let g:user_emmet_install_global = 0

autocmd FileType html,htmldjango,css,scss EmmetInstall


let mapleader = ","
let g:arduino_dir = '/home/anorak/Arduino'
let g:nord_underline = 1
"let g:onedark_termcolors = 256
let g:onedark_terminal_italics=1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:termdebug_wide=1
let g:termdebugger='gdb-multiarch'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" enable tabline
let g:python_highlight_all = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let wiki = {}
let wiki.path = '~/my_wiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'scala': 'scala', 'sql': 'sql', 'sh': 'sh', 'js': 'javascript', 'html': 'html', 'vue':'vue'}
let g:vimwiki_list = [wiki]
let g:CommandTPreferredImplementation='lua'

let g:db_ui_use_nerd_fonts = 1
let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}
"++++++++++++++++SETS++++++++++++"
syntax on
colorscheme doom-one
"set background=dark
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
set clipboard+=unnamedplus
set completeopt=menu,menuone,noselect
"++++++++++++++STARTUP++++++++++++"

autocmd VimEnter * packadd termdebug
packadd termdebug
"++++++++++++++KEYBINDS+++++++++++"
nmap <Leader>+ :res +4 <CR>
nmap <Leader>- :res -4 <CR>
nmap <Leader>g :TagbarToggle <CR>
nmap <Leader>td :Termdebug <CR>
nmap <Leader>tv :below vsplit term://bash <CR>
nmap <leader>th :below term<CR>
nmap <Leader>v :below vert new <CR>
nmap <Leader>h :below new <CR>
nmap <Leader>c :source ~/.config/nvim/init.vim <CR>
nmap <Leader>n :bn <CR>
nmap <Leader>p :bp <CR>
nmap <Leader>d :Bdelete <CR>
nmap <Leader>e :CocCommand explorer<CR>
nmap <Leader>so :set spell! <CR>
nmap <Leader>ss :set spelllang=es <CR>
nmap <Leader>se :set spelllang=en <CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> gd <Plug>(coc-definition)
noremap <Leader>y "+y
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
tnoremap <Esc> <C-\><C-n>

"+++++++++++++++FILETYPES+++++++++++"
au BufRead,BufNewFile *.pde set filetype       =arduino
au BufRead,BufNewFile *.ino set filetype       =arduino
au BufRead,BufNewFile *.c   set shiftwidth =4 | set autoindent | set cindent
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

luafile ~/.vim/lua/tressiter.lua
luafile ~/.vim/lua/bufferline.lua
