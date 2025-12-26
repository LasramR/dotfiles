local function setup_lsp(server_name, config)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if ok_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    local on_attach = function(_, bufnr)
        local buf_map = function(mode, lhs, rhs, desc)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap=true, silent=true, desc=desc })
        end

        buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition")
        buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "References")
        buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
        buf_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol")
        buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action")

    end

    config = config or {}
    config.on_attach = config.on_attach or on_attach
    config.capabilities = config.capabilities or capabilities
    vim.lsp.config(server_name, config)
    vim.lsp.enable(server_name)
end

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "marksman",
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "lua",
                callback = function()
                    setup_lsp("lua_ls", {
                        settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                diagnostics = { globals = { "vim" } },
                                workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
                                telemetry = { enable = false },
                            }
                        }
                    })
                end
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function()
                    setup_lsp("marksman")
                end
            })
        end
    },
}
