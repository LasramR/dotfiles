return   {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
        if vim.fn.has("win32") == 1 then
            vim.opt.shell = "powershell"
            vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
            vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
            vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
            vim.opt.shellquote = ""
            vim.opt.shellxquote = ""
        end

        local tt = require("toggleterm")


        tt.setup{
            open_mapping = nil,
            direction =  "float",
        }

        vim.keymap.set("n", "<leader>t", tt.toggle, { desc = "Toggle terminal" })
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { desc = "Switch to normal mode from terminal mode" })
        vim.keymap.set('t', '<C-b>d', tt.toggle, { desc = "Hide opened terminal window"})
    end

}
