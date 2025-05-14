-- Vim nargs options
-- 0: No arguments.
-- 1: Exactly one argument.
-- ?: Zero or one argument.
-- *: Any number of arguments (including none).
-- +: At least one argument.
-- -1: Zero or one argument (like ?, explicitly).
local platformio = require('platformio')

-- Pioinit
vim.api.nvim_create_user_command('Pioinit', function()
  require('platformio.pioinit').pioinit()
end, {})

-- Piodb
vim.api.nvim_create_user_command('Piodb', function()
  require('platformio.Piodb').Piodb()
end, {})

-- Piorun
vim.api.nvim_create_user_command('Piorun', function(opts)
  local args = opts.args
  require('platformio.Piorun').Piorun { args }
end, {
  nargs = '?',
  complete = function(_, _, _)
    return { 'upload', 'uploadfs', 'build', 'clean' } -- Autocompletion options
  end,
})

-- Piomon
vim.api.nvim_create_user_command('Piomon', function(opts)
  local args = opts.args
  require('platformio.Piomon').Piomon { args }
end, {
  nargs = '?',
  complete = function(_, _, _)
    return { '4800', '9600', '57600', '115200' }
  end,
})

-- Piolib
vim.api.nvim_create_user_command('Piolib', function(opts)
  local args = vim.split(opts.args, ' ')
  require('platformio.Piolib').Piolib(args)
end, {
  nargs = '+',
})

-- Piocmd
vim.api.nvim_create_user_command('Piocmd', function(opts)
  local cmd_table = vim.split(opts.args, ' ')
  require('platformio.Piocmd').Piocmd(cmd_table)
end, {
  nargs = '*',
})

-- Piodebug
vim.api.nvim_create_user_command('Piodebug', function()
  require('platformio.Piodebug').Piodebug()
end, {})
