return {
  'ray-x/go.nvim',
  cond = function()
    return not vim.g.vscode
  end,
  dependencies = { -- optional packages
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('go').setup {
      -- test_runner = 'gotestsum',
      -- run_in_floaterm = true,
      -- trouble = true,
    }

    local format_sync_grp = vim.api.nvim_create_augroup('goimports', {})
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function()
        require('go.format').goimports()
      end,
      group = format_sync_grp,
    })
  end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
