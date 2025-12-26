return {
    "tiagovla/tokyodark.nvim",
    config = function()
        require("tokyodark").setup({
            transparent_background = true,
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
                identifiers = { italic = false },
                functions = {},
                variables = {},
            },
        })
        vim.cmd [[colorscheme tokyodark]]
    end,
}
