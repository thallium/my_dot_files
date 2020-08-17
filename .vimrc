if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tibabit/vim-templates'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
syntax on
set nocompatible
set cindent
set smartindent
set mouse=a
set tabstop=4
set expandtab
set shiftwidth=4
set nu
set showmode
set showcmd
set ignorecase smartcase
set hlsearch
set autoindent
set smarttab
set noundofile
set nobackup
set noswapfile
set relativenumber
set cursorline
set gfn=firacode\ 12
let g:airline_theme='gruvbox'
let g:tmpl_search_paths = ['~/ACM/templates']
colorscheme gruvbox
set background=light
set termguicolors
set guioptions-=T
set guioptions-=m
set autochdir
let g:go_template_autocreate=0

map <F5> :call Run()<CR>
map <C-F5> :call FastRun()<CR>
func! Run()
    exec "w"
	if &filetype is 'cpp'|| &filetype is 'c' || &filetype is 'cc'
        if has("gui_running")
            exec "!gnome-terminal -- /bin/sh -c 'g++ -std=c++1z -Wall -Wextra -Wconversion -Wshift-overflow=2 -fsanitize=address -O2 %<.cpp -o %< && ./%< ; read -s -n1 -p 'press' '"
        else 
            exec '!g++ -std=c++1z -Wall -Wextra -Wconversion -Wshift-overflow=2 -fsanitize=address -O2 %<.cpp -o %< && ./%<' 
        endif
	elseif &filetype is 'java'
		exec "!javac\ -d\ .\ %"
		exec "!java\ %<"
	elseif &filetype is 'go'
        if has("gui_running")
            exec "!gnome-terminal -- /bin/sh -c 'go run  %<.go ; read -s -n1 -p 'press' '"
        else 
            exec '!go run %<.go' 
        endif
	endif	
endfunc
func! FastRun()
    exec "w"
	if &filetype is 'cpp'|| &filetype is 'c' || &filetype is 'cc'
	exec '!g++ -Wall -Wextra -O2 -std=c++1z -static  %<.cpp -o %< && ./%<' 
	"exec '!gnome-terminal -e ./%< -- read -s -n1'
	elseif &filetype is 'java'
		exec "!javac\ -d\ .\ %"
		exec "!java\ %<"
	endif	
endfunc
map <F4> :call Cftest()<CR>
map <F3> :call CFsubmit()<CR>
func! Cftest()
	exec "w"
    if has("gui_running")
        exec "!gnome-terminal -- /bin/sh -c 'cf test && read -s -n1'"
    else
        exec '!cf test'
    endif
endfunc
func! CFsubmit()
	exec "w"
    if has("gui_running")
        exec "!gnome-terminal -- /bin/sh -c 'cf submit && read -s -n1'"
    else
        exec '!cf submit'
    endif
endfunc
map <C-A> ggVG"+y
"for the sake of the convinience of using nerd comment
let mapleader = ","

" SNIPPET PART
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
"------------------ golang---------
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
