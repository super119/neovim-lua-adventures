local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
    return
end

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    -- Refer to: https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L2082
    -- 分屏打开文件
    vim.keymap.set('n', 'v',       api.node.open.vertical,              opts('Open: Vertical Split'))
    vim.keymap.set('n', 'h',       api.node.open.horizontal,            opts('Open: Horizontal Split'))
    -- 文件操作
    vim.keymap.set('n', '<F5>',    api.tree.reload,                     opts('Refresh'))
    vim.keymap.set('n', 'n',       api.fs.create,                       opts('Create'))
    vim.keymap.set('n', 'd',       api.fs.remove,                       opts('Delete'))
    vim.keymap.set('n', 'r',       api.fs.rename_basename,              opts('Rename: Basename'))
end

nvim_tree.setup({
    -- 不显示 git 状态图标
    git = {
        enable = false,
    },
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 40,
        -- 也可以 'right'
        side = 'left',
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件后不关闭
            quit_on_open = false,
        },
    },
    renderer = {
        -- 不显示root folder
        root_folder_label = '',
    },
    on_attach = my_on_attach,
})
-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
