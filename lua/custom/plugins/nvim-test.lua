return {
  'klen/nvim-test',
  cond = function()
    return not vim.g.vscode
  end,
  config = function()
    require('nvim-test').setup {}
    require('nvim-test.runners.go-test'):setup {
      command = 'gotestsum', -- a command to run the test runner
      args = { '--', '-v', '-shuffle=on', '-race' }, -- default arguments
    }
  end,
}
