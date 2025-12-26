return {
    "lewis6991/gitsigns.nvim",
    opts = {
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol',
            delay = 200,
        },
    },
    config = function (_, opts)
        local gs = require("gitsigns")

        gs.setup(opts)

        vim.keymap.set("n", "<leader>gs", gs.preview_hunk_inline, { desc = "Preview hunk inline" })
        vim.keymap.set("n", "<leader>gd", gs.diffthis, { desc = "Show diffs" })
        vim.keymap.set("n", "<leader>gb", gs.blame_line, { desc = "Show diffs" })
    end
}
