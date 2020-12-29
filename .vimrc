" File: .vimrc
" Author: ArthurPV
" Year: 2020

" All plugins I am using

call plug#begin("~/.vim/plugged")

" Git wrapper
Plug 'tpope/vim-fugitive'

" Emmet for vim
Plug 'mattn/emmet-vim'

" A command-line fuzzy finder
Plug 'junegunn/fzf'

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

" A solid language pack for vim (syntax)
Plug 'sheerun/vim-polyglot'

" Add file type icons to Vim plugins such as: NERDTree...
Plug 'ryanoasis/vim-devicons'

" Enhanced multi-line search for Vim
Plug 'wincent/ferret'

" Run your tests at the speed thought
Plug 'janko-m/vim-test'

" Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Multiple cursor
Plug 'terryma/vim-multiple-cursors'

" My colorscheme
Plug 'ArthurPV/vim-moon-color'

" Preview colours in source code while editing
Plug 'ap/vim-css-color'

" :cactus: Viewver & finder for LSP symbols and tags
Plug 'liuchengxu/vista.vim'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" Syntax highlighting for nerdtree + vim-devicons
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" General settings

syntax on 
set termguicolors
set relativenumber
set nu
set encoding=UTF-8
set modifiable
filetype on
set tabstop=2
set laststatus=2
set shiftwidth=2
filetype plugin on
set mouse=a
colorscheme mooncolor
set background=dark

" Command

nmap <C-v> :Vista<CR>
nmap <C-b> :NERDTreeToggle<CR>
nmap <C-i> :PlugInstall<CR>
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>
nmap <C-c> :bd<CR>
nmap <C-f> :FZF<CR>

" Command (run or build)

" c++
nnoremap <C-q>+ :!g++ -o  %:r % -std=c++17<Enter>
nnoremap <C-q>+r :!./%:r

" rust
nnoremap <C-q>r :!rustc -o %:r %<Enter>
nnoremap <C-q>rr :!./%:r

" python
nnoremap <C-q>p :!python %:r.py %<Enter>

" js (node)
nnoremap <C-q>j :!node %:r.js %<Enter>

" elixir
nnoremap <C-q>e :!elixir %:r.ex %<Enter>

" Syntax highlighting for vim-devicons

let s:colors = {
  \ 'brown'       : "905532",
  \ 'aqua'        : "63c7dd",
  \ 'blue'        : "527a9a",
  \ 'darkBlue'    : "0a0672",
  \ 'purple'      : "887893",
  \ 'lightPurple' : "d3badd",
  \ 'red'         : "d15151",
  \ 'beige'       : "efe3ce",
  \ 'yellow'      : "b39f11",
  \ 'orange'      : "eab654",
  \ 'darkOrange'  : "ae6b3e",
  \ 'pink'        : "dc9be8",
  \ 'salmon'      : "ffc796",
  \ 'green'       : "8fac74",
  \ 'lightGreen'  : "9fbf97",
  \ 'white'       : "d8d8d8"
  \ }

" Status Line

let g:currentmode={
      \ 'n'  : 'Normal ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'Visual ',
      \ 'V'  : 'V·Line ',
      \ '' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ '' : 'S·Block ',
      \ 'i'  : 'Insert ',
      \ 'R'  : 'REPLACE ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}


highlight User1 cterm=None gui=None ctermfg=007 guifg=fgcolor
highlight User2 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User3 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User4 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User5 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User7 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User8 cterm=None gui=None ctermfg=008 guifg=bgcolor
highlight User9 cterm=None gui=None ctermfg=007 guifg=fgcolor

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008 guifg=#d5ddd8 guibg=#4d596d gui=None cterm=None'
 " elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
  "  exe 'hi! StatusLine ctermfg=005 guifg=#d5ddd8 guibg=#4d596d gui=None cterm=None'
  elseif (mode() ==# 'v' || '' || 'V')
	  exe 'hi! StatusLine ctermfg=008 guifg=#d5ddd8 guibg=#4d596d gui=None cterm=None'
  elseif (mode() ==# 'n') 
	  exe 'hi! StatusLine ctermbg=005 guifg=#d5ddd8 guibg=#4d596d gui=None cterm=None'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004 guifg=#d5ddd8 gui=None guibg=#4d596d cterm=None'
  elseif (mode() ==# 'R') 
	  exe 'hi! StatusLine ctermfg=004 guifg=#d5ddd8 gui=None guibg=#4d596d cterm=None'
  else
    exe 'hi! StatusLine ctermfg=006 guifg=#d5ddd8 gui=None cterm=None'
  endif

  return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endif
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endif
endfunction

set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\  " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
