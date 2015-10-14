" vim:fdm=marker

" Vundle setup {{{
  set nocompatible
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'

  " Plugins {{{
    Plugin 'tpope/vim-fugitive'
    Plugin 'kien/ctrlp.vim'
    Plugin 'bling/vim-airline'
    Plugin 'tpope/vim-surround'
    Plugin 'chriskempson/base16-vim'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'isRuslan/vim-es6'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'vim-scripts/DrawIt'
    Plugin 'scrooloose/syntastic'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'marijnh/tern_for_vim'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'Yggdroot/indentLine'
    Plugin 'ap/vim-css-color'
    Plugin 'fatih/vim-go'
    Plugin 'sophacles/vim-processing'
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'hkmix/vim-george'
  " }}}

  call vundle#end()
  filetype plugin indent on
" }}}

" Visuals {{{
  set number
  set background=dark
  colorscheme base16-eighties
  set guifont=Liberation\ Mono\ for\ Powerline:h12
  syntax on
  set incsearch
  set hlsearch

  highlight clear SignColumn
  set guioptions-=L
  set ttimeoutlen=25 " Get rid of lag leaving insert mode

  " Airline config {{{
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t' 
    set laststatus=2
  " }}}

  " Indent guides {{{
    let g:indent_guides_enable_on_vim_startup = 0
    let g:indentLine_char = '│'
    set list lcs=tab:\│\ 
  " }}} 
" }}}

" Language-specific settings {{{
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab

  autocmd FileType go set noexpandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set softtabstop=2
  autocmd FileType markdown set tabstop=2|set shiftwidth=2|set softtabstop=2
  autocmd FileType perl set tabstop=4|set shiftwidth=4|set softtabstop=4
  autocmd FileType perl6 set tabstop=2|set shiftwidth=2|set softtabstop=2
  autocmd FileType scss set tabstop=2|set shiftwidth=2|set softtabstop=2

  " Automatic autocompletion triggering for CSS
  let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+' ],
    \ }
" }}}

" Key mappings {{{
  if has("gui_macvim")
    " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
    " the right side. Ctrl-Shift-Tab goes the other way.
    noremap <C-Tab> :tabnext<CR>
    noremap <C-S-Tab> :tabprev<CR>
  endif
  noremap L :tabnext<CR>
  noremap H :tabprev<CR>
  set whichwrap+=>,l
  set whichwrap+=<,h

  " Navigation for soft wrapping
  map <silent> <Up> gk
  map <silent> k gk
  imap <silent> <Up> <C-o>gk
  map <silent> <Down> gj
  map <silent> j gj
  imap <silent> <Down> <C-o>gj
  map <silent> <home> g<home>
  imap <silent> <home> <C-o>g<home>
  map <silent> <End> g<End>
  imap <silent> <End> <C-o>g<End>

  " Change leader key to comma
  let mapleader=","
" }}}

" Environment setup {{{
  let g:AutoPairsMultilineClose=0

  set splitbelow
  set splitright

  " Send more characters for redraws
  set ttyfast

  " Enable mouse use in all modes
  set mouse=a

  " Set this to the name of your terminal that supports mouse codes.
  " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
  set ttymouse=xterm2

  " OS-level copy and paste
  set clipboard=unnamed

  " Change cursor shape between insert and normal mode in iTerm2.app
  if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  endif
" }
