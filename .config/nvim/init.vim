"Plugins will be downloaded under the specified directory.
call plug#begin()

"Declare the list of plugins.
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'

"List ends here. Plugins become visible to Vim after this call.
call plug#end()

"Show filename in title bar
set title

"Show line numbers
set number

"Set relative line numbers
set relativenumber

"Hide mode
set noshowmode

"Set split screen position
set splitbelow
set splitright

"Split navigation keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Switch buffer keys
nnoremap <Leader>b :ls<CR>:b

"Enable and configure onedark color
syntax on
let g:onedark_hide_endofbuffer=1
colorscheme onedark

"Set lightline status bar color and display git branch using vim-fugitive
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ }

"Enable 24-bit color terminal support
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

