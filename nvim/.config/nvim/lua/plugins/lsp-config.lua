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
        ensure_installed = { "lua_ls", "gopls", "ruby_lsp", "templ" },
        automatic_enable = false,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("lua_ls", { capabilities = capabilities })
      vim.lsp.enable("lua_ls")
      vim.lsp.config("ruby_lsp", { capabilities = capabilities })
      vim.lsp.enable("ruby_lsp")
      vim.lsp.config("templ", { capabilities = capabilities })
      vim.lsp.enable("templ")
      vim.lsp.config("gopls", {
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
      vim.lsp.enable("gopls")

      local builtin = require('telescope.builtin')
      vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
      vim.keymap.set("n", "gc", builtin.lsp_incoming_calls, {})
      vim.keymap.set("n", "go", builtin.lsp_outgoing_calls, {})
      vim.keymap.set("n", "gd", builtin.lsp_type_definitions, {})
      vim.keymap.set("n", "gr", function()
        builtin.lsp_references(
          {
            include_declaration = false, -- Exclude the declaration of the symbol
            show_line = false,           -- Hide the line content (cleaner view)
          }
        )
      end, {})
      vim.keymap.set("n", "gn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "gs", builtin.lsp_document_symbols, {})
      vim.keymap.set("n", "gw", builtin.lsp_dynamic_workspace_symbols, {})
      vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<space>q", builtin.diagnostics, {})
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
