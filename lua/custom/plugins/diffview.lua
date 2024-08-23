return {
  'sindrets/diffview.nvim',
  cond = function()
    return not vim.g.vscode
  end,
}
