return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        local tsj = require('treesj')

        tsj.setup{}

        vim.keymap.set('n', 'gm', tsj.toggle)
        vim.keymap.set('n', 'gM', function ()
            tsj.toggle({ split = { recursive = true } })
        end)
        vim.keymap.set('n', 'gs', tsj.split)
        vim.keymap.set('n', 'gj', tsj.join)
    end,
}
