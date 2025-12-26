return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup{
            options = { 
                theme = "nightfly",
                component_separators = "",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff" },
                lualine_c = { "diagnostics" },
                lualine_x = { "searchcount" },
                lualine_y = { "location", "encoding", "filetype", "lsp_status" },
                lualine_z = {}
            },
        }
    end,
}
