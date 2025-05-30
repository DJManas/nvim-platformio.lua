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
  require('platformio.piodb').piodb()
end, {})

-- Piorun
vim.api.nvim_create_user_command('Piorun', function(opts)
  local args = opts.args
  require('platformio.piorun').piorun { args }
end, {
  nargs = '?',
  complete = function(_, _, _)
    return { 'upload', 'uploadfs', 'build', 'clean' } -- Autocompletion options
  end,
})

-- Piomon
vim.api.nvim_create_user_command('Piomon', function(opts)
  local args = opts.args
  require('platformio.piomon').piomon { args }
end, {
  nargs = '?',
  complete = function(_, _, _)
    return { '4800', '9600', '57600', '115200' }
  end,
})

-- Piolib
vim.api.nvim_create_user_command('Piolib', function(opts)
  local args = vim.split(opts.args, ' ')
  require('platformio.piolib').piolib(args)
end, {
  nargs = '+',
})

-- Piocmd
vim.api.nvim_create_user_command('Piocmd', function(opts)
  local cmd_table = vim.split(opts.args, ' ')
  require('platformio.piocmd').piocmd(cmd_table)
end, {
  nargs = '*',
})

-- Piodebug
vim.api.nvim_create_user_command('Piodebug', function()
  require('platformio.piodebug').piodebug()
end, {})
