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

-- piorun
vim.api.nvim_create_user_command('piorun', function(opts)
  local args = opts.args
  require('platformio.piorun').piorun { args }
end, {
  nargs = '?',
  complete = function(_, _, _)
    return { 'upload', 'uploadfs', 'build', 'clean' } -- Autocompletion options
  end,
})

-- piomon
vim.api.nvim_create_user_command('piomon', function(opts)
  local args = opts.args
  require('platformio.piomon').piomon { args }
end, {
  nargs = '?',
  complete = function(_, _, _)
    return { '4800', '9600', '57600', '115200' }
  end,
})

-- piolib
vim.api.nvim_create_user_command('piolib', function(opts)
  local args = vim.split(opts.args, ' ')
  require('platformio.piolib').piolib(args)
end, {
  nargs = '+',
})

-- piocmd
vim.api.nvim_create_user_command('piocmd', function(opts)
  local cmd_table = vim.split(opts.args, ' ')
  require('platformio.piocmd').piocmd(cmd_table)
end, {
  nargs = '*',
})

-- piodebug
vim.api.nvim_create_user_command('piodebug', function()
  require('platformio.piodebug').piodebug()
end, {})
