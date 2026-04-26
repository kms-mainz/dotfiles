"===============================
"WARNING": run this command before start command:
"
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
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
" ==========================================
" --- PLUGINS ---
" ==========================================

" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" Syntax checker
Plug 'dense-analysis/ale'

" A file explorer (NERDTree)
Plug 'preservim/nerdtree'

" A status bar at the bottom
Plug 'vim-airline/vim-airline'

" Theme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Plugin for commenting (allows us to use Ctrl+/)
Plug 'tpope/vim-commentary'

" Snippet Engine (UltiSnips is the best for C++, Py, Bash, Qt)
Plug 'SirVer/ultisnips'

" The actual snippets library (supports basically every language)
Plug 'honza/vim-snippets'

" --> THE NEW ONES <--
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'

" Formatter
Plug 'sbdchd/neoformat'

" Visual Debugger (VSCode clone)
Plug 'puremourning/vimspector'

call plug#end()

" ==========================================
" --- PLUGIN SETTINGS ---
" ==========================================

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
nnoremap <C-_> gc
vnoremap <C-_> gc
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

" --- Ctrl + T/W : open / close a tab ---
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>


" ==========================================
" --- FORMATTER KEYBIND ---
" ==========================================

" Press F3 to auto-format the current file
nnoremap <F3> :Neoformat<CR>

" ==========================================
" --- SNIPPET SETTINGS ---
" ==========================================

" Use Tab to expand a snippet (like VSCode)
let g:UltiSnipsExpandTrigger = "<tab>"
" Use Ctrl+j and Ctrl+k to jump between variables inside the snippet
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" ==========================================
" --- DEBUGGER SETTINGS ---
" ==========================================
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" ==========================================
" Exit Vim if NERDTree is the only window left open and setup NERDTree
" ==========================================
let NERDTreeShowHidden=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

