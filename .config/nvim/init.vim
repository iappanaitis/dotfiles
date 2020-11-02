"Plugins will be downloaded under the specified directory.
call plug#begin()

"Declare the list of plugins.
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'jpalardy/vim-slime'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'

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

"Split navigation hotkeys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Map leader to space
let mapleader = "\<Space>"

"Close current buffer hotkey
nnoremap <Leader>d :bd<CR>

"Switch buffer hotkey
nnoremap <Leader>b :ls<CR>:b

"Open vertical netrw directory browser
nnoremap <Leader>v :Vex<CR>

"Enable and configure color scheme 
set termguicolors
let g:onedark_hide_endofbuffer=1
set background=dark
syntax on
colorscheme onedark

"Use terminal transparency
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

"Set lightline color scheme and display git branch using fugitive
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

"Formatting for html, css, and js
au BufNewFile,BufRead *.js,*.html,*.css
    \ setlocal tabstop=2 shiftwidth=2 softtabstop=2

"Fugitive keybindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>

"Configure slime
if exists('$TMUX')
  let g:slime_target = "tmux"
  let g:slime_paste_file = "~/.slime_paste"
  let g:slime_default_config = {"socket_name": "default", "target_pane": ":.1"}
  let g:slime_dont_ask_default = 1
  let g:slime_python_ipython = 1
endif

"Copy whole buffer to REPL
nmap <C-C><C-X> :%SlimeSend<CR>

