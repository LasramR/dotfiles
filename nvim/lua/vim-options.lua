vim.o.number = true
vim.opt.relativenumber = true
vim.o.wrap = true

vim.opt.expandtab = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.hl = vim.highlight

vim.diagnostic.config({ 
    virtual_text = true,
})

vim.cmd [[
  hi DiagnosticError guifg=#FF5555 gui=bold    " red
  hi DiagnosticWarn  guifg=#FFA500 gui=bold    " orange
  hi DiagnosticHint  guifg=#FFFF00 gui=bold    " yellow
  hi DiagnosticInfo  guifg=#1E90FF gui=bold    " blue
]]

