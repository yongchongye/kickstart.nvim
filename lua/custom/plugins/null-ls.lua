return
{
    'jay-babu/mason-null-ls.nvim',
    cond = function()
        return not vim.g.vscode
    end,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'williamboman/mason.nvim',
        'nvimtools/none-ls.nvim',
    },
    config = function()
        require('mason').setup()
        require('mason-null-ls').setup {
            ensure_installed = {},
            automatic_installation = false,
        }
    end,
}
