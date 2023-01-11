require("plugins")
require("debugger")
require("keymaps")
require("config")

-- empty setup using defaults
require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    side = "left",
    width = 30,
  },
})

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-Space>", -- set to `false` to disable one of the mappings
      node_incremental = "<C-Space>"
      -- scope_incremental = "grc",
      -- node_decremental = "grm",
    },
  },

  disable = function(lang, buf)
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return true
    end
  end,

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

-- NOTE: This line set the backgroud transparent
-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

local neogit = require('neogit')
neogit.setup {}

require('vgit').setup()


require("bufferline").setup {
  options = {
    hover = {
      enabled = true,
      delay = 100,
      reveal = { 'close' }
    },
    numbers = 'buffer_id',
    color_icons = true,
    diagnostics = "nvim_lsp",
    separator_style = 'padded_slant',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end
  }
}

require "fidget".setup {}

require('onedark').setup {
  style = 'deep'
}
require('onedark').load()

vim.cmd([[
command! Qa :qa
autocmd VimEnter * :NvimTreeOpen
autocmd BufEnter * :normal zR
autocmd CursorHold * :lua vim.diagnostic.open_float()
autocmd InsertEnter * :set norelativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = '' 
let g:airline_symbols.linenr = '☰'   
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.dirty = '⚡'
]])
