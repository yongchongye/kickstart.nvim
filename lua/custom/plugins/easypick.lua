return {
  'axkirillov/easypick.nvim',
  -- cond = function()
  --   return not vim.g.vscode
  -- end,
  requires = 'nvim-telescope/telescope.nvim',
  config = function()
    local easypick = require 'easypick'

    -- only required for the example to work
    local get_default_branch = "git rev-parse --symbolic-full-name refs/remotes/origin/HEAD | sed 's!.*/!!'"
    local base_branch = vim.fn.system(get_default_branch) or 'main'

    easypick.setup {
      pickers = {
        -- add your custom pickers here
        -- below you can find some examples of what those can look like

        -- diff current branch with base_branch and show files that changed with respective diffs in preview
        {
          name = 'changed_files',
          command = 'git diff --name-only $(git merge-base HEAD ' .. base_branch .. ' )',
          previewer = easypick.previewers.branch_diff { base_branch = base_branch },
        },

        -- list files that have conflicts with diffs in preview
        {
          name = 'conflicts',
          command = 'git diff --name-only --diff-filter=U --relative',
          previewer = easypick.previewers.file_diff(),
        },
      },
    }
  end,
}
