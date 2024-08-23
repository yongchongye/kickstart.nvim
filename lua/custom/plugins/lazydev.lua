-- LSP Plugins
return {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    cond = function()
        return not vim.g.vscode
    end,
    ft = 'lua',
    opts = {
        library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        },
    },
}
