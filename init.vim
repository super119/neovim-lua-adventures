lua require("basic")
lua require("keybindings")
lua require("plugins")
lua require("colorscheme")
lua require("plugin-config.nvim-tree")
lua require("plugin-config.bufferline")
lua require("plugin-config.lualine")
lua require("plugin-config.dashboard")
lua require("plugin-config.nvim-treesitter")
lua require("lsp.setup")
lua require("lsp.cmp")
lua require("lsp.ui")
lua require("lsp.null-ls")

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'Yggdroot/LeaderF', { 'tag': 'v1.25', 'do': ':LeaderfInstallCExtension' }

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShowDevIcons = 0
let g:Lf_WindowPosition = 'popup'
" Press ctrl-d to open the symbol list of current buffer
" This means we don't need vim-taglist anymore
noremap <c-d> :Leaderf bufTag<cr>
let g:Lf_WildIgnore = {
	\ 'dir': ['out', '.svn','.git','.hg', '.mypy_cache'],
	\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
	\}

set tabstop=8
set shiftwidth=8
set noexpandtab
set number

" Search will not go back to the beginning
set nowrapscan

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
