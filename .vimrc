" ~/.vimrc (schlank: Node.js/JS/TS mit coc.nvim)
" ------------------------------------------------

" Basics
set nocompatible
set number
set ruler
set laststatus=2
set cursorline
set noswapfile
syntax on

" Case-insensitive search (optional, wie vorher)
set ignorecase

" Einrückung: 2 Spaces, keine Tabs
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set autoindent
set smartindent

" ------------------------------------------------
" vim-plug + Plugins (nur das Nötigste)
" ------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
call plug#end()

" ------------------------------------------------
" coc.nvim (minimal + konfliktfrei)
" ------------------------------------------------
" CursorHold braucht für Highlights eine kurze Updatetime
set updatetime=300

" Highlight Symbol unter Cursor (optional)
autocmd CursorHold * silent call CocActionAsync('highlight')

" Go to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K  :call CocActionAsync('doHover')<CR>

" Completion: Tab navigiert im Popup, sonst normaler Tab
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Enter bestätigt Auswahl, sonst neue Zeile
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

