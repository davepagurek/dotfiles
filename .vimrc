" vim:fdm=marker
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Vundle setup {{{
  set nocompatible
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'

  " Plugins {{{
    Plugin 'vim-ruby/vim-ruby'
    Plugin 'lervag/vimtex'
    Plugin 'tpope/vim-fugitive'
    Plugin 'kien/ctrlp.vim'
    Plugin 'bling/vim-airline'
    Plugin 'paranoida/vim-airlineish'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'tpope/vim-surround'
    Plugin 'chriskempson/base16-vim'
    Plugin 'aliou/moriarty.vim'
    Plugin 'vim-scripts/obsidian2.vim'
    Plugin 'joshdick/onedark.vim'
    Plugin 'rakr/vim-one'
    Plugin 'joshdick/airline-onedark.vim'
    Plugin 'gosukiwi/vim-atom-dark'
    Plugin 'toupeira/vim-desertink'
    Plugin 'mkarmona/colorsbox'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'zanglg/nova.vim'
    Plugin 'ayu-theme/ayu-vim'
    Plugin 'roosta/srcery'
    Plugin 'jiangmiao/auto-pairs'
    "Plugin 'Townk/vim-autoclose'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'isRuslan/vim-es6'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'vim-scripts/DrawIt'
    Plugin 'scrooloose/syntastic'
    Plugin 'marijnh/tern_for_vim'
    Plugin 'terryma/vim-multiple-cursors'
    if !has('g:loaded_indentLine')
      let g:loaded_indentLine = 1
      Plugin 'Yggdroot/indentLine'
    endif
    Plugin 'ap/vim-css-color'
    Plugin 'dart-lang/dart-vim-plugin'
    Plugin 'fatih/vim-go'
    Plugin 'sophacles/vim-processing'
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'jaxbot/syntastic-react'
    Plugin 'elzr/vim-json'
    Plugin 'derekwyatt/vim-scala'
    Plugin 'vim-perl/vim-perl'
    Plugin 'iamcco/mathjax-support-for-mkdp'
    Plugin 'iamcco/markdown-preview.vim'
    Plugin 'drmingdrmer/vim-syntax-markdown'
    if !has('nvim')
      Plugin 'Valloric/YouCompleteMe'
      Plugin 'benekastah/neomake'
      Plugin 'floobits/floobits-neovim'
    else
      Plugin 'Shougo/context_filetype.vim'
      Plugin 'Shougo/deoplete.nvim'
    endif
    "Plugin 'artur-shaik/vim-javacomplete2'
  " }}}

  call vundle#end()
  filetype plugin indent on
" }}}

" Visuals {{{
  set number
  set background=light
  set guifont=Liberation\ Mono\ for\ Powerline:h12
  "syntax on
  if !exists("g:syntax_on")
    syntax enable
    "let ayucolor="light"
    "colorscheme base16-unikitty-light
    set background=light
    colorscheme nova
  let g:onedark_terminal_italics=1
  endif
  set conceallevel=0
  set cole=0 
  au FileType * setl cole=0 
  let g:vim_json_syntax_conceal=0

  highlight clear SignColumn
  set guioptions-=L
  set ttimeoutlen=25 " Get rid of lag leaving insert mode
  set scrolloff=3

  set cursorline


  "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
  "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
  "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (empty($TMUX))
    if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    endif
  endif

  " Airline config {{{
    let g:airline_theme='base16_hopscotch'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#wordcount#enabled = 0
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline#extensions#branch#enabled = 0
    let g:airline#extensions#hunks#enabled = 0
    let g:airline_skip_empty_sections = 1
    let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
    set laststatus=2
  " }}}
  " Indent guides {{{
    let g:indent_guides_enable_on_vim_startup = 0
    if !exists('g:indentLine_enabled')
      let g:indentLine_enabled = 0
    endif
    let g:indentLine_showFirstIndentLevel = 1
    let g:indentLine_char = '│'
    let g:indentLine_first_char = '│'
    "let g:indentLine_concealcursor=0
    "let g:indentLine_noConcealCursor=1
    set list lcs=tab:\│\ 
    "autocmd BufRead * :IndentLinesEnable
    function! ShowLines()
      if has('nvim_dot_app')
        put ='called once'
      else
        :IndentLinesReset
      endif
    endfunction
    au FileType,BufRead,BufEnter,BufNewFile * call ShowLines()
  " }}}
" }}}

" Language-specific settings {{{
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
  let g:tex_conceal = ""

  set nofoldenable

  autocmd FileType go set noexpandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set softtabstop=2
  autocmd FileType markdown set tabstop=2|set shiftwidth=2|set softtabstop=2
  autocmd FileType cpp set tabstop=2|set shiftwidth=2|set softtabstop=2
  autocmd FileType c set tabstop=2|set shiftwidth=2|set softtabstop=2
  "autocmd FileType perl set tabstop=4|set shiftwidth=4|set softtabstop=4
  "autocmd FileType perl6 set tabstop=2|set shiftwidth=2|set softtabstop=2
  autocmd FileType scss set tabstop=2|set shiftwidth=2|set softtabstop=2

 let g:syntastic_javascript_checkers = ['eslint']
 let g:syntastic_cpp_compiler = 'clang++'
 let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

  " Automatic autocompletion triggering for CSS
  let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+' ],
    \ }
" }}}

" Key mappings {{{
  set smartindent
  set breakindent
  "let &showbreak = '↳ '
  "set cpo+=n
  if has("nvim")
    tnoremap <Esc> <C-\><C-n>

    " Enable deoplete
    let g:deoplete#enable_at_startup = 1

    "\ deoplete#mappings#manual_complete()
    " Select autocompletion with tab
    inoremap <silent><expr><Tab>
          \ pumvisible() ? "\<C-n>" :
          \ "\<Tab>"
    inoremap <silent><expr><S-Tab>
          \ pumvisible() ? "\<C-e>" :
          \ "\<S-tab>"
    inoremap <silent><expr><Esc>
          \ pumvisible() ? "\<C-y>\<Esc>" :
          \ "\<Esc>"
    inoremap <silent><expr><Up>
          \ pumvisible() ? "\<C-n>" :
          \ "\<Up>"
    inoremap <silent><expr><Down>
          \ pumvisible() ? "\<C-n>" :
          \ "\<Down>"
    inoremap <silent><expr><Enter>
          \ pumvisible() ? "\<C-y><Enter>" :
          \ "\<Enter>"
  endif

  "autocmd FileType java setlocal omnifunc=javacomplete#Complete

  noremap L :tabnext<CR>
  noremap H :tabprev<CR>
  set whichwrap+=>,l
  set whichwrap+=<,h

  noremap ,, "_cc

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

  " make < > shifts keep selection
  vnoremap < <gv
  vnoremap > >gv

  " for when I hold shift too long
  :command WQ wq
  :command Wq wq
  :command W w
  :command Q q
" }}}

  " Markdown {{{
    let g:mkdp_refresh_on_save = 1
    let g:mkdp_path_to_chrome = "open -a Safari"
    nmap <silent> <Leader>mm <Plug>MarkdownPreview
    nmap <silent> <Leader>mn <Plug>StopMarkdownPreview

    let g:vim_markdown_math = 1
  " }}}


" Environment setup {{{
  let g:AutoPairsMultilineClose=0
  "set runtimepath+=~/.vim/bundle/deoplete.nvim/
  "call remote#host#RegisterPlugin('python3', '~/.vim/bundle/deoplete.nvim/rplugin/python3/deoplete.py', [
      "\ {'sync': 1, 'name': 'DeopleteInitializePython', 'type': 'command', 'opts': {}},
     "\ ])

  set splitbelow
  set splitright

  " case-insensitive search until an uppercase letter used
  set ignorecase
  set smartcase
  set incsearch
  set hlsearch

  set nocompatible
  "set lazyredraw

  " The default for 'backspace' is very confusing to new users, so change it to a
  " more sensible value.  Add "set backspace&" to your ~/.vimrc to reset it.
  set backspace+=indent,eol,start

  " Disable localized menus for now since only some items are translated (e.g.
  " the entire MacVim menu is set up in a nib file which currently only is
  " translated to English).
  set langmenu=none

  " ignores for ctrl-p
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/*.o,*/*.d,*/*.class

  " Send more characters for redraws
  set ttyfast

  " Enable mouse use in all modes
  set mouse=a

  " Set this to the name of your terminal that supports mouse codes.
  " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
  if !has('nvim')
    set ttymouse=xterm2
  endif

  " OS-level copy and paste
  set clipboard=unnamed

  " Change cursor shape between insert and normal mode in iTerm2.app
  if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  endif
  if has("nvim")
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  endif
" }


function! RefreshUI()
  if exists(':AirlineRefresh')
    AirlineRefresh
  else
    " Clear & redraw the screen, then redraw all statuslines.
    redraw!
    redrawstatus!
  endif
  if exists(':IndentLinesEnable')
    IndentLinesEnable
  endif
endfunction
"call RefreshUI()
