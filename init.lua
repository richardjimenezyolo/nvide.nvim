require("plugins")
require("keymaps")
require("config")
require("debugger")

require("mason-lspconfig").setup {
  ensure_installed = { "sumneko_lua", "phpactor" },
}

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

require('lualine').setup()

require('config-local').setup {
  -- Default configuration (optional)
  config_files = { ".vimrc.lua", ".vimrc" }, -- Config file patterns to load (lua supported)
  hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
  autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
  commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
  silent = false, -- Disable plugin messages (Config loaded/ignored)
  lookup_parents = false, -- Lookup config files in parent directories
}
