local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.setup({
  theme = "doom",
  config = {
    header = {
      [[]],
      [[]],
      [[        ▄▄▄▄▄███████████████████▄▄▄▄▄     ]],
      [[      ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄   ]],
      [[     █▀████████▄             ▀▀████ ▀██▄  ]],
      [[    █▄▄██████████████████▄▄▄         ▄██▀ ]],
      [[     ▀█████████████████████████▄    ▄██▀  ]],
      [[       ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀    ]],
      [[         ▀███▄              ▀██████▀      ]],
      [[           ▀██████▄        ▄████▀         ]],
      [[              ▀█████▄▄▄▄▄▄▄███▀           ]],
      [[                ▀████▀▀▀████▀             ]],
      [[                  ▀███▄███▀               ]],
      [[]],
      [[]],
    },
    center = {
      {
        icon = "  ",
        desc = "Edit init.vim                       ",
        action = "edit ~/.config/nvim/init.vim",
      },
      {
        icon = "  ",
        desc = "Edit keybindings                    ",
        action = "edit ~/.config/nvim/lua/keybindings.lua",
      },
      {
        icon = "  ",
        desc = "Edit .bashrc                        ",
        action = "edit ~/.bashrc",
      },
      {
        icon = "  ",
        desc = "Edit Dashboard                      ",
        action = "edit ~/.config/nvim/lua/plugin-config/dashboard.lua",
      },
      -- {
      --   icon = "  ",
      --   desc = "Change colorscheme                  ",
      --   action = "colorscheme",
      -- },
      -- {
      --   icon = "  ",
      --   desc = "Edit init.lua                       ",
      --   action = "edit ~/.config/nvim/init.lua",
      -- },
    },
    footer = {
      "",
      "",
      "https://github.com/super119/neovim-lua-adventures",
    },
  },
})
