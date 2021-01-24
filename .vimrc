" dont be compatible with vi
set nocompatible
filetype plugin on
syntax on

" Pathogen 
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on

" dont write in more than 80 cols and show a vertical line indicator 
set textwidth=79
set cc=80

" set autocompletion similar to zsh
set wildmenu
set wildmode=full

" store more ex commands in history
set history=2000

" set hidden setting working with argdo
set hidden

" set mouse option to rearrange split windows with mouse
set mouse=a

" make vim remeber last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal g'\"" | endif
endif


" show and highlight line numbers set nu

" solarzied
let g:solarized_termtrans=1
let g:solarized_termcolors=256
set background=light
colorscheme solarized

" Vim airline theme
let g:airline_theme='light'

set laststatus=2
set encoding=utf-8

" vim backup location
set backupdir=~/tmp/vim-backup

" always convert tabs into spaces
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

" nerd tree
nnoremap <F6> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.xfasl$']

" command t
let g:CommandTMaxHeight=10

" gundo
nnoremap <leader>u :GundoToggle<CR>
let g:gundo_width = 25
let g:gundo_preview_height = 30
let g:gundo_right = 1

" messages
set cmdheight=2

" auto refresh file from disk when changed, works only in GUI version
set autoread

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Let & trigger &&
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Exuberant CTags
set tags+=./tags

" Markdown preview
" let vim_markdown_preview_pandoc=1
" let vim_markdown_preview_github=1
" let vim_markdown_preview_temp_file=1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Vimwiki
let g:vimwiki_list = [{ 'path': '$HOME/IronMan/_vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'diary_header': '📖 📖 📖 ...',
                      \ 'auto_diary_index': 1,
                      \ 'diary_caption_level': -1}]

" Insert header preamble
function! VimwikiHeaderPreamble()
  let filename = expand('%:t:r')
  return printf("---\nlayout: vimwiki\ntitle: %s\npermalink: /%s\n---", filename, filename)
endfunction

nnoremap <leader>vh gg"=VimwikiHeaderPreamble()<CR>p

" Shortcuts for Bullet Journal symbols
" bt Task
inoremap <leader>bt <C-v>U25CF<Space>
nnoremap <leader>bt xi<C-v>U25CF<ESC>
" be Event
inoremap <leader>be <C-v>U25CB<ESC><Space>i
nnoremap <leader>be xi<C-v>U25CB<ESC>
" bn Note
inoremap <leader>bn <C-v>U2014<ESC><Space>i
nnoremap <leader>bn xi<C-v>U2014<ESC>
" bc completed
inoremap <leader>bc <C-v>U29F3<ESC><Space>i
nnoremap <leader>bc xi<C-v>U29F3<ESC>
" bd delegated
nnoremap <leader>bd xi<C-v>U29ED<ESC>
" bm migrated
nnoremap <leader>bm xi<C-v>U22D7<ESC>
" bs scheduled
nnoremap <leader>bs xi<C-v>U22D6<ESC>
" br irrelevant
inoremap <leader>br <C-v>U29BB<ESC><Space>i
nnoremap <leader>br xi<C-v>U29BB<ESC>
" bp priority
inoremap <leader>bp <C-v>UFF0A<ESC><Space>i
nnoremap <leader>bp xi<C-v>UFF0A<ESC>
" bi inspiration
inoremap <leader>bi <C-v>UFF01<ESC><Space>i
nnoremap <leader>bi xi<C-v>UFF01<ESC>
" bw stopwatch for scheduled meetings
inoremap <leader>bw <C-v>U23F1<ESC><Space>i
nnoremap <leader>bw xi<C-v>U23F1<ESC>
" bf fasting day
inoremap <leader>bf <C-v>U1F95C<ESC><Space>i
nnoremap <leader>bf xi<C-v>U1F95C<ESC>

" Vimwiki Diary shortcuts
" VimwikiDiaryNextDay
nnoremap <leader>vdn :VimwikiDiaryNextDay<CR>
" VimwikiDiaryPrevDay
nnoremap <leader>vdp :VimwikiDiaryPrevDay<CR>

" Unicode symbol shortcuts
" la right arrow
inoremap <leader>la <C-v>U2190<ESC><Space>i
nnoremap <leader>la xi<C-v>U2190<ESC>
" ra right arrow
inoremap <leader>ra <C-v>U2192<ESC><Space>i
nnoremap <leader>ra xi<C-v>U2192<ESC>
" y20
inoremap <leader>y20 <C-v>U2473<ESC><Space>i
nnoremap <leader>y20 xi<C-v>U2473<ESC>

" Markdown TOC
nnoremap <silent> <leader>toc :6<CR>:GenTocGFM<CR>o<ESC>
inoremap <silent> <leader>toc <ESC>:6<CR>:GenTocGFM<CR>o

" fzf plugin
" fzf installed using Homebrew
set rtp+=/usr/local/opt/fzf

fun! CompleteTopics(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '\a'
            let start -= 1
        endwhile
        return start
    else
        echomsg '**** completing' a:base
        " find topics fuzzy matching with "a:base"
        let res = []
        let topics = readfile($HOME . '/IronMan/assets/topics.txt')
        for topic in topics
            if stridx(tolower(topic), tolower(a:base)) !~ -1
            call add(res, topic)
            endif
        endfor
        return res
    endif
endfun

 inoremap <leader>lt <C-o>:set completefunc=CompleteTopics<CR><C-x><C-u>
