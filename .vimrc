set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'raichoo/purescript-vim'

Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'

Plugin 'justinmk/vim-syntax-extra'

Plugin 'tpope/vim-fugitive'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'jelera/vim-javascript-syntax'

Plugin 'othree/javascript-libraries-syntax.vim'

Plugin 'othree/html5.vim'

Plugin 'mattn/emmet-vim'

Plugin 'hail2u/vim-css3-syntax'

Plugin 'ap/vim-css-color'

Plugin 'fatih/vim-go'

Plugin 'nikvdp/ejs-syntax'

Plugin 'vim-python/python-syntax'

Plugin 'rust-lang/rust.vim'

Plugin 'c.vim'

Plugin 'majutsushi/tagbar'

Plugin 'vim-ruby/vim-ruby'

Plugin 'tpope/vim-rails'

Plugin 'julialang/julia-vim'

Plugin 'othree/xml.vim'

Plugin 'leafgarland/typescript-vim'

Plugin 'kchmck/vim-coffee-script'

Plugin 'scrooloose/nerdtree'

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plugin 'isruslan/vim-es6'

Plugin 'ArthurPV/vim-color-moon'

call vundle#end()
" call coc#util#install()
syntax on
set termguicolors
set relativenumber
set nu
set encoding=UTF-8
set modifiable 
set nocompatible
filetype on
set tabstop=4
set laststatus=2
set shiftwidth=4
filetype plugin on
filetype indent on
colorscheme mooncolor
set background=dark

" Commands for normal mode
nmap <F8> :TagbarToggle<CR>
nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :PluginInstall<CR>
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>
nmap <C-c> :bd<CR>

" --------------------------------------------
" Setting plugin syntax c++
" Highlighting of class scope is disabled by default
let g:cpp_class_scope_highlight = 1
" Highlighting of member variables is disabled by default
let g:cpp_member_variable_highlight = 1
" Highlighting of class names in declarations is disabled by default
let g:cpp_class_decl_highlight = 1
" Highlighting of POSIX functions is disabled by default
let g:cpp_posix_standard = 1
" There are two ways to highlight template functions
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_expirimental_template_highlight = 1
" Highlighting of library concepts 
let g:cpp_concepts_highlight = 1

" -------------------------------------------
" Setting plugin syntax css
" Some properties do not highlight correctly by default.
augroup VimCSS3Syntax
	autocmd!

	autocmd FileType css setlocal iskeyword+=-
augroup END

" -------------------------------------------
" Setting plugin syntax python
" Enable all syntax highlighting
let g:python_highlight_all = 1

" -------------------------------------------
" Setting plugin syntax rust
let g:rust_clip_command = 'xclip -selection clipboard'

" -------------------------------------------
" Setting plugin syntax c
" Enable the tools for cmake or doxygen
let g:C_UseTool_cmake = 'yes'
let g:C_UesTool_doxygen = 'yes'

" -------------------------------------------
" Setting plugin syntax js libraries
" For jquery
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
" For underscore
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
" For backbone
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
" For prelude 
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 1
" For angularjs
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
" For react
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.jsx let b:javascript_lib_use_react = 1
" requirejs
autocmd BufReadPre *.js let b:javascript_lib_use_requirejs = 1
" vue
autocmd BufReadPre *.vue let b:javascript_lib_use_vue = 1

" ------------------------------------------
" Setting plugin syntax ruby
autocmd FileType ruby compiler ruby

" ------------------------------------------
" Setting plugin syntax julia
inoremap <C-Tab> <C-x><C-O>
let g:latex_to_unicode_auto = 1

" ------------------------------------------
" Setting plugin syntax typescript
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:typescript_ignore_typescriptdoc = 1
let g:typescript_ignore_browserwords = 1

" ------------------------------------------
" Setting plugin airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

" ------------------------------------------
" Setting plugin syntax coffeescript
augroup CoffeeBufNew 
	autocmd User * set wrap
augroup END
let g:coffee_indent_keep_current = 1
hi link coffeeSpaceError NONE
hi link coffeeSemicolonError NONE
hi link coffeeReservedError NONE
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=4 expandtab

" ------------------------------------------
" Setting plugin syntqx purescript
let g:purescript_indent_if = 3
let g:purescript_indent_case = 5
let g:purescript_indent_let = 4
let g:purescript_indent_where = 6
let g:purescript_indent_do = 3
let g:purescript_indent_in = 1
let g:purescript_indent_dot = v:true

" ------------------------------------------
" Setting for bracket highlight
hi MatchParen ctermbg=blue guibg=orange term=none cterm=none gui=bold
" -----------------------------------------
" Setting for search word
set incsearch
" Setting for lex
augroup lexical
	autocmd!
	autocmd FileType markdown,mkd call lexical#init()
	autocmd FileType textile call lexical#init()
	autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spell = 1
" Settin for line number
set numberwidth=1
set cursorline

" ------------------------------------------
" condition nvim
if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
	set termguicolors
endif

" ------------------------------------------
" Coc nvim config

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" --------------------------
" Bakcground line number
highlight LineNr guibg=#353131

" --------------------------
" Configurate lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" --------------------------
" Tagbar
" For Linux that requires ctags package
let g:tagbar_ctags_bin = '/bin/ctags'
