return {
    'akinsho/flutter-tools.nvim',
    dependecies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
        require("flutter-tools").setup {
            decorations = {
                statusline = {
                    device = true,
                }
            },
            widget_guides = {
                enabled = true,
            },
            lsp = {
                color = { -- show the derived colours for dart variables
                    enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
                    background = true, -- highlight the background
                    background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
                    foreground = false, -- highlight the foreground
                    virtual_text = true, -- show the highlight using virtual text
                    virtual_text_str = "■", -- the virtual text character to highlight
                },
                settings = {
                    updateImportsOnRename = true,
                }
            }
        }

        require("telescope").load_extension("flutter")
        vim.keymap.set("n", "<leader>ot", ":FlutterOutlineToggle<Cr>")
    end
}
