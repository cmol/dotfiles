" Note that the plugin file location might be different. You might want to recheck it manually.
call plug#begin("~/.config/nvim/plugged")
  " Plugin Section
  Plug 'lifepillar/vim-solarized8'
  Plug 'shaunsingh/solarized.nvim'
  Plug 'shaunsingh/nord.nvim'

  " File manager
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'

  " Fuzzy finding
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Statusline
  Plug 'itchyny/lightline.vim'

  " Git
  Plug 'tpope/vim-fugitive'

  " Go
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'buoto/gotests-vim'

  " Git gutter (inline diff)
  Plug 'airblade/vim-gitgutter'

  " Tabularize
  Plug 'godlygeek/tabular'

  " Ansible support
  Plug 'pearofducks/ansible-vim'

  " Ctags
  Plug 'ludovicchabant/vim-gutentags'

  " tmux
  "Plug 'edkolev/tmuxline.vim'

  " Smart indentation detection
  Plug 'tpope/vim-sleuth'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

call plug#end()" Everything after this line will be the config section

" Color options
if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
colorscheme solarized8

" NERDTree
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed
let g:NERDTreeStatusline = '' " set to empty to use lightline
" " Toggle
noremap <silent> <C-b> :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 30<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {}
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {}
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {}
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColo	 = s:blue

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Fuzzy finding
nnoremap <C-p> :GFiles<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Lightline
let g:lightline = {
  \     'colorscheme': 'powerlineish',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" Other configs
" Neovim config
syntax enable " enable syntax highglighting
syntax on " turn on syntax highlighting
set undodir=~/.config/nvim/undodir " set undotree file directory
set undofile " set undotree to save to file
set number " set line number
set nowrap " set no soft wrap
set tabstop=2 softtabstop=2 " set tab size
set shiftwidth=2 " affect amount of indentation
set expandtab " set that tab will insert softabstop amount of space characters
set nowritebackup " set to never save backup
set noswapfile " set no swap file
set nobackup " set no backup file
set breakindent " set every wrapped line will continue visually indented
set smartindent " set smart indentation
set smartcase " set to be cas sensitive when there is capital letter, this need set incsearch to work
set incsearch " set search to be case insensitive
set hidden
set updatetime=250
set shortmess+=c " for CoC plugin
set noshowmode " set that vim mode is hidden, to incorporate for lightline plugin
let mapleader=","
" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" " Golang debug statements
autocmd FileType go nmap <leader>db :GoDebugBreakpoint<CR>
autocmd FileType go nmap <leader>dt :GoDebugTest<CR>
autocmd FileType go nmap <leader>dr :GoDebugStart<CR>
autocmd FileType go nmap <leader>dc :GoDebugContinue<CR>
autocmd FileType go nmap <leader>ds :GoDebugStop<CR>
autocmd FileType go nmap <leader>t  :GoTest<CR>
autocmd FileType go nmap <leader>r  :GoRun<CR>
autocmd FileType go nmap <leader>ie :GoIfErr<CR>
autocmd FileType go nmap <leader>c  :GoCoverage<CR>
autocmd FileType go nmap <leader>ct :GoCoverageToggle<CR>
autocmd FileType go nmap <leader>p  :GoDeclsDir<CR>

" Remove scratch buffer from omnifunc
set completeopt-=preview

" Exit intert mode in terminal on <esc>
:tnoremap <Esc> <C-\><C-n>

" " Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
" " Map yanked to clipboard
vnoremap <C-c> "*y
" " Line moving
" " " Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" " Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" " Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Show trailing whitespaces
set list
set listchars=trail:·,tab:\ \ ,nbsp:␣

:highlight ExtraWhitespace guibg=#073642
:match ExtraWhitespace /\t/
":match ExtraWhitespace /\s\+$/

