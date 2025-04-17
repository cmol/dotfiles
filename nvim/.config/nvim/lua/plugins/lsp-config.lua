return {
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "solargraph", "ruby_lsp", "templ" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
			})
			lspconfig.templ.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				settings = {
					gopls = {
						analyses = {
							nilness = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
						},
						experimentalPostfixCompletions = true,
						gofumpt = true,
						staticcheck = true,
						usePlaceholders = true,
					},
				},
				on_attach = on_attach,
			})
			vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gc", vim.lsp.buf.incoming_calls, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "gn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol, {})
			vim.keymap.set("n", "gw", vim.lsp.buf.workspace_symbol, {})
			vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, {})
			vim.keymap.set("n", "[x", vim.diagnostic.goto_prev, {})
			vim.keymap.set("n", "]x", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "]s", vim.diagnostic.show, {})
			vim.filetype.add({ extension = { templ = "templ" } })

			-- " Replaced LSP implementation with code action plugin...
			-- "
			-- " nnoremap <silent> ga        <cmd>lua vim.lsp.buf.code_action()<CR>
			-- "
			-- nnoremap <silent> ga        <cmd>CodeActionMenu<CR>
			-- " Replaced LSP implementation with trouble plugin...
			-- "
			-- " nnoremap <silent> <space>q  <cmd>lua vim.diagnostic.setloclist()<CR>
			-- "
			-- nnoremap <silent> <space>q  <cmd>Trouble<CR>
		end,
	},
}
