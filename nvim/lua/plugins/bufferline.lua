return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons';
    config = function()
        vim.opt.termguicolors = true
        
        local bl = require("bufferline")
        
        bl.setup{
            options = {
                always_show_bufferline = true,
                diagnostics = "nvim_lsp",
                modified_icon = "~"
            },

            highlights = {
                buffer_selected = { bold = true, italic = false },

                modified = { fg = { attribute = "fg", highlight = "buffer_visible" }, italic = true },
                modified_visible = { fg = { attribute = "fg", highlight = "buffer_visible" }, italic = true },
                modified_selected = { fg = "#c0caf5", italic = true },
            
                error = { fg = "#FF5555" },
                error_selected = { fg = "#FF5555", italic = false },
                error_diagnostic_selected = { fg = "#FF5555", italic = false },

                hint = { fg = "#FFFF00", italic = false },
                hint_selected = { fg = "#FFFF00", italic = false },
                hint_diagnostic = { fg = "#FFFF00", italic = false },
                hint_diagnostic_selected = { fg = "#FFFF00", italic = false },

                info = { fg = "#1E90FF", italic = false },
                info_selected = { fg = "#1E90FF", italic = false },
                info_diagnostic = { fg = "#1E90FF", italic = false },
                info_diagnostic_selected = { fg = "#1E90FF", italic = false },

                warning = { fg = "#FFA500" },
                warning_selected = { fg = "#FFA500", italic = false },
                warning_diagnostic_selected = { fg = "#FFA500", italic = false },
            }
        }

        vim.keymap.set("n", "<C-b>l", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
        vim.keymap.set("n", "<C-b>h", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
        vim.keymap.set("n", "<C-b><Right>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
        vim.keymap.set("n", "<C-b><Left>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

        vim.keymap.set("n", "<C-b>d", function () 
            local bufnum = vim.api.nvim_get_current_buf()

            local ok, err = pcall(vim.api.nvim_buf_delete, bufnum, { force = false })
            if not ok then
                vim.notify("Use <C-b>D to force close.", vim.log.levels.WARN)
            end
        end, { desc = "Close current buffer" })
        vim.keymap.set("n", "<C-b>D", function () 
            local bufnum = vim.api.nvim_get_current_buf()
            vim.api.nvim_buf_delete(bufnum, { force = true })
        end, { desc = "Force close current buffer" })
        vim.keymap.set("n", "<C-b>n", function () 
            vim.cmd("enew")
        end, { desc = "Open a new empty buffer" })
    end,
}
