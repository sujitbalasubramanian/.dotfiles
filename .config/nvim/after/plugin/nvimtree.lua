-- empty setup using defaults
require("nvim-tree").setup()

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
    vim.keymap.set('n', 'sh', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', 'sv', api.node.open.vertical, opts('Open: Vertical Split'))
end

-- OR setup with some options
require("nvim-tree").setup({
    on_attach = my_on_attach,
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

vim.keymap.set("n", '<leader>e', ":NvimTreeToggle<CR>")
