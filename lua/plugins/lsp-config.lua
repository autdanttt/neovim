return {
	{
		"williamboman/mason.nvim",
		--config = function()
		--	require("mason").setup()
		--end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = false,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			-- golang
			lspconfig.gopls.setup({
				capabilities = capabilities,
				autostart = true,
			})
            lspconfig.lemminx.setup({})
			lspconfig.pyright.setup({})
			--java
			lspconfig.jdtls.setup({
				settings = {
					java = {
						configuration = {
							runtimes = {
								{
									name = "JavaSE-17",
									path = os.getenv("JAVA_HOME"),
									default = true,
								},
							},
						},
					},
				},
			})

			-- lsp kepmap setting
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
