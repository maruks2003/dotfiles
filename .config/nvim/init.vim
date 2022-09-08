luafile ~/.config/nvim/lua/init.lua

let g:tagbar_left = 1

set number
set splitbelow
colorscheme cosmic_latte
set noswapfile

" A reasonable default statusline
set statusline= "clear statusline
set statusline=%#Normal#
set statusline+=%f
set statusline+=\ %y
set statusline+=%=
set statusline+=%c:
set statusline+=%l\ \|\ %L

set textwidth=0
set shiftwidth=4
set tabstop=4
set autoindent
set formatoptions-=co
set expandtab
set lcs+=space:·
set colorcolumn=81
    
nnoremap <F3> :TagbarToggle<CR>
