local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- lspconfig.ltex.setup({
--   filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "NeogitCommitMessage" }
-- })


require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
