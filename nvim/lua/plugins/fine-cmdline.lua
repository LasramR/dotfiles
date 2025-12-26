return {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("fine-cmdline").setup({
            cmdline = {
                enable_keymap = true,
                smart_history = true,
                prompt = ":",
            },
            popup = {
                position = {
                    row = '95%',
                    col = '50%',
                },
                size = {
                    width = '60%',
                },
                border = {
                    style = 'rounded',
                },
                win_options = {
                    winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
                },
            },
        })

        vim.o.cmdheight = 0
        vim.keymap.set("n", ":", function()
            require("fine-cmdline").open()
        end)
    end,
}
