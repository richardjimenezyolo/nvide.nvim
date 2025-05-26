require('plugins')
require('keymaps')
require('debug_config')


vim.opt.scrolloff = 8
vim.opt.updatetime = 300
vim.cmd("colorscheme rose-pine-moon")
vim.cmd("set number")
vim.cmd([[
	command! Qa :qa
	autocmd VimEnter * :NvimTreeOpen
	autocmd VimEnter * :set number
	autocmd VimEnter * :set relativenumber
	"autocmd BufEnter * :normal zR
	autocmd CursorHold * :lua vim.diagnostic.open_float()
	autocmd InsertEnter * :set norelativenumber
	autocmd InsertEnter * :set number
	autocmd InsertLeave * :set relativenumber
	let g:db_ui_win_position = 'right'

]])

