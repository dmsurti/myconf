" plug
call plug#begin(stdpath('data').'/plugged')
set nocompatible
Plug 'airblade/vim-gitgutter'
" See: https://zerokspot.com/weblog/2016/07/10/editorconfig-in-neovim/
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mzlogin/vim-markdown-toc'
Plug 'vimwiki/vimwiki'
Plug 'rhysd/vim-clang-format'
Plug 'dense-analysis/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'phanviet/vim-monokai-pro'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" dont write in more than 119 cols and show a vertical line indicator
set textwidth=99
set cc=+1


let mapleader=","

set termguicolors

" esc 
inoremap jj <Esc>`^

" save
noremap <Leader>w :update<CR>

" i hate those tildes
set nobackup

" editorconfig
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
let g:EditorConfig_core_mode = 'external_command'

" set autocompletion similar to zsh
set wildmenu
set wildmode=full

" store more ex commands in history
set history=2000

" set mouse option to rearrange split windows with mouse
set mouse=a

" remeber last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal g'\"" | endif
endif

" always convert tabs into spaces
set expandtab
set shiftwidth=4
set softtabstop=4

" nerd tree
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.xfasl$']

set laststatus=2
set nonu

" fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>s :Ag<CR>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

"markdown preview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'safari'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" clang format
nnoremap <Leader>cf :<C-u>ClangFormat<CR>

" ALE Linters
let g:ale_linters = {'cpp': ['clangtidy']}

" Table Mode
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
