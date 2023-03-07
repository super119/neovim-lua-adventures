" Disable mouse
" The neovim 0.8 enables mouse by default, this makes the right clicking of
" mouse creates a popup menu while not pasting contents
set mouse=

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
