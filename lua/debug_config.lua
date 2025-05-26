local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/home/rick/.config/nvim/debugers/vscode-php-debug/out/phpDebug.js' }
}

