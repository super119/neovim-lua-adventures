lua require("basic")
lua require("keybindings")
lua require("plugins")
lua require("colorscheme")
lua require("plugin-config.nvim-tree")
lua require("plugin-config.bufferline")
lua require("plugin-config.lualine")
lua require("plugin-config.telescope")
lua require("plugin-config.dashboard")
lua require("plugin-config.project")
lua require("plugin-config.nvim-treesitter")
lua require("lsp.setup")
lua require("lsp.cmp")
lua require("lsp.ui")
lua require("lsp.null-ls")

set tabstop=4
set shiftwidth=4
set noexpandtab

" Disable mouse
" The neovim 0.8 enables mouse by default, this makes the right clicking of
" mouse creates a popup menu while not pasting contents
set mouse=

" Remove trailing whitespaces when save
autocmd FileType c,cpp,rust autocmd BufWritePre <buffer> %s/\s\+$//e

" Gtags jumps to the first match automatically. This is not good when
" there are multiple matches for a symbol. This command disables the feature.
let Gtags_No_Auto_Jump = 1
" let Gtags_Close_When_Single = 1

let GtagsCscope_Ignore_Case = 1
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Quiet = 1

nmap <F4> :cclose<cr>
nmap <F5> :Gtags
nmap <F6> :cn<CR>
nmap <F7> :cp<CR>

" This means when entering ':tag' in vim, we use cscope while not ctags
set cscopetag
" This means we use 'gtags-cscope' as cscope program
" So both of these 2 commands use global to replace ctags+cscope
set cscopeprg='gtags-cscope'

" CScope commands manual
" 0 or s: Find this C symbol
" 1 or g: Find this definition
" 2 or d: Find functions called by this function
" 3 or c: Find functions calling this function
" 4 or t: Find this text string
" 6 or e: Find this egrep pattern
" 7 or f: Find this file
" 8 or i: Find files #including this file
" 9 or a: Find places where this symbol is assigned a value
" no 'g-" here since we don't want to add 'definition finding' to quickfix
set cscopequickfix=s-,c-,d-,i-,t-,e-

" Find references and back, add to quickfix so that we can preview easily
:nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>:cw 10<cr>
:nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>:cw 10<cr>
:nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>:cw 10<cr>
:nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>:cw 10<cr>
:nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>:cw 10<cr>
:nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>:cw 10<cr>
nmap <C-b> :colder<CR>:cc<CR>
