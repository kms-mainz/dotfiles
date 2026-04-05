"===============================
"WARNING: run this command: 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"===============================
"setup for vim fr fr
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set mouse=a                 " enable mouse click
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set clipboard=unnamedplus   " Use the system clipboard for all operations
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim

" --- PLUGINS ---
" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" A file explorer (NERDTree)
Plug 'preservim/nerdtree'

" A status bar at the bottom
Plug 'vim-airline/vim-airline'

" Theme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" 1. Plugin for commenting (allows us to use Ctrl+/)
Plug 'tpope/vim-commentary'

" 2. Snippet Engine (UltiSnips is the best for C++, Py, Bash, Qt)
Plug 'SirVer/ultisnips'

" 3. The actual snippets library (supports basically every language)
Plug 'honza/vim-snippets'

" --> THE NEW ONES <--
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
" Quick file finder (Press Ctrl+P to use it)
Plug 'ctrlpvim/ctrlp.vim'

" Formatter
Plug 'sbdchd/neoformat'

" Visual Debugger (VSCode clone)
Plug 'puremourning/vimspector'

call plug#end()

" --- PLUGIN SETTINGS ---
" Apply the theme
" For Neovim > -1.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 6.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160510
if (has('termguicolors'))
    set termguicolors
endif

let g:material_theme_style = 'palenight'
let g:material_terminal_italics = 0

set background=dark
colorscheme material

" Press Ctrl+n to open the file explorer
map <C-n> :NERDTreeToggle<CR>
" --- Ctrl + ` : Open Terminal at the bottom ---
" (Note: some terminals don't read the backtick well. If it fails, map it to <F4>)
nnoremap <C-`> :bo term<CR>

" --- Ctrl + / : Comment / Uncomment ---
" Terminals read Ctrl+/ as Ctrl+_
nmap <C-_> gcc
vmap <C-_> gc

" --- Ctrl + A : Select All ---
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
vnoremap <C-a> <Esc>ggVG

" --- Ctrl + S : Save ---
" (Warning: run 'stty -ixon' in your ~/.bashrc or terminal will freeze!)
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc>:w<CR>gv

" --- Ctrl + Z : Undo ---
" (Overrides the default 'suspend' command)
nnoremap <C-z> u
inoremap <C-z> <C-o>u
vnoremap <C-z> <C-c>u

" --- Ctrl + Y : Redo ---
nnoremap <C-y> <C-r>
inoremap <C-y> <C-o><C-r>
vnoremap <C-y> <C-c><C-r>

" --- Alt + Up/Down : Move lines like VSCode ---
" Normal mode (moves current line)
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==
" Visual mode (moves highlighted block)
vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

" --- FORMATTER KEYBIND ---
" Press F3 to auto-format the current file
nnoremap <F3> :Neoformat<CR>

" ==========================================
" SNIPPET SETTINGS
" ==========================================
" Use Tab to expand a snippet (like VSCode)
let g:UltiSnipsExpandTrigger = "<tab>"
" Use Ctrl+j and Ctrl+k to jump between variables inside the snippet
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" --- DEBUGGER SETTINGS ---
" This single line gives you the exact same hotkeys as VSCode!
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" ==========================================
" Exit Vim if NERDTree is the only window left open
" ==========================================
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

