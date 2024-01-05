vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.updatetime = 300
vim.opt.mousemoveevent = true
vim.opt.ignorecase = true
vim.cmd.colorscheme('onedark')
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.cmd([[
command! Qa :qa
autocmd VimEnter * :NvimTreeOpen
autocmd VimEnter * :set number
autocmd VimEnter * :set relativenumber
"autocmd BufEnter * :normal zR
"autocmd CursorHold * :lua vim.diagnostic.open_float()
autocmd InsertEnter * :set norelativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
]])
