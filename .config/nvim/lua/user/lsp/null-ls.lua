local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- For esier usage
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions


null_ls.setup({
	debug = false,
	sources = {
    -- General formatting
    formatting.trim_newlines,
    formatting.trim_whitespace,

    -- Spelling and writing style
    -- diagnostics.cspell,

    diagnostics.proselint.with({
        extra_filetypes = { "NeogitCommitMessage" },
    }),
    code_actions.proselint.with({
        extra_filetypes = { "NeogitCommitMessage" },
    }),

    -- Lua
    formatting.stylua,

    -- Javascript (js, jsx, vue)
		formatting.prettier,
    diagnostics.eslint_d,

    -- PHP
    -- TODO: php_cs_fixer
    -- TODO: phpstan https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#about-97

    -- Stylelint (css, scss, less)
    formatting.stylelint,
    diagnostics.stylelint,
	},
})
