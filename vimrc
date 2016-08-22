set nocompatible "required
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'MarcWeber/vim-addon-mw-utils'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'

Plugin 'christoomey/vim-tmux-navigator'

" Navigation between files
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'

" Dev. environment
" Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'avakhov/vim-yaml'
Plugin 'briancollins/vim-jst'
Plugin 'othree/html5.vim'
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'tomtom/tcomment_vim'
Plugin 'stefanoverna/vim-i18n'
Plugin 'kchmck/vim-coffee-script'
Plugin 'AndrewRadev/vim-eco'
Plugin 'thoughtbot/vim-rspec'

" Colorscheme, syntax highlighting
Plugin 'altercation/vim-colors-solarized'
Plugin 'Yggdroot/indentLine'

Plugin 'lukaszb/vim-web-indent'

Plugin 'ekalinin/Dockerfile.vim'

" LaTeX
Plugin 'lervag/vimtex'

" Русская раскладка
Plugin 'powerman/vim-plugin-ruscmd'

call vundle#end()

" set re=1

" Auto reload changed files
set autoread

" Set character encoding to use in vim
set encoding=utf-8

" Mute error bell
set novisualbell

" Hide showmode
" Showmode is useless with airline
set noshowmode

" Numbers of rows to keep to the left and to the right off the screen
set scrolloff=3

" vim-i18n
vmap <Leader>z :call I18nTranslateString()<CR>
vmap <Leader>dt :call I18nDisplayTranslation()<CR>

" Airline
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1


let g:airline_enable_bufferline=1
let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=1

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇ '

" map leader to ,
let mapleader = ","

" map F3 to BufExplorer
imap <F3> <ESC>:BufExplorer<CR>
map <F3> :BufExplorer<CR>

" map F4 to NERDTree
imap <F4> <ESC>:NERDTreeToggle<CR>
map <F4> :NERDTreeToggle<CR>

" indent highlight
let g:indentLine_char = '│'

" Switch wrap off for everything
set nowrap
set colorcolumn=80

syntax on

"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

filetype plugin indent on

set nu

" Disable GUI scrollbars
set guioptions-=L
set guioptions-=r

" NERDTree --------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <C-n> :NERDTreeToggle<CR>
"------------------------

" VIM-SYNTASTIC
" let g:syntastic_enable_signs=1
" let g:syntastic_ruby_checkers=['mri', 'rubocop']
"------------

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.css.scss set filetype=scss

nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> ˚ <C-w><
map <silent> ∆ <C-W>-
map <silent> ˙ <C-W>+
map <silent> ¬ <C-w>>

nnoremap <C-Q> <C-W><C-Q>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
 
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

autocmd Filetype javascript setlocal ts=4 sw=4 expandtab
autocmd Filetype jst setlocal ts=4 sw=4 sts=4 expandtab

set foldenable
set foldlevel=99
map <Space> za
autocmd Filetype ruby setlocal foldmethod=syntax

" nnoremap <Leader>d :TernDef<CR>

autocmd Filetype tex setlocal textwidth=79

" .vimrc auto reload
augroup myvimrc
    au!
    au BufWritePost .vimrc so $MYVIMRC 
augroup END

set backupdir=$TMPDIR//
set directory=$TMPDIR//
