return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  config = function()

    local tt = require("typescript-tools")

    tt.setup {
        on_attach = function (client, bufnum)
            local opts = { buffer = bufnum, noremap = true, silent = true }

            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "gR", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "gf", function() vim.lsp.buf.format({ async = true }) end, opts)
        end,
        settings = {
            separate_diagnostic_server = true,
            publish_diagnostic_on = "insert_leave",
            expose_as_code_action = { "fix_all", "remove_unused_imports", "organize_imports" },
        }
    }
  end,
}
