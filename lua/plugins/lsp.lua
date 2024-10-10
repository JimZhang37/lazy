return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "pyright", "gopls", "clangd" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      -- Define opts for inlay hints
      local opts = {
        inlay_hints = {
          enabled = true,
          exclude = { "lua", "python" } -- Add filetypes to exclude if needed
        }
      }

      local on_attach = function(client, buffer)
        if client.supports_method("textDocument/inlayHint") then
          if
              vim.api.nvim_buf_is_valid(buffer)
              and vim.bo[buffer].buftype == ""
              and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
          then
            vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
          end
        end
      end

      lspconfig.lua_ls.setup {}

      lspconfig.clangd.setup({
        cmd = { "clangd", "--fallback-style=webkit" }
      })

      lspconfig.gopls.setup({
        cmd = { "/Users/yaohua/.local/share/nvim/mason/bin/gopls" },
        settings = {
          gopls = {
            gofumpt = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true
            },
          }
        },
        on_attach = on_attach,
      })

      lspconfig.pyright.setup {}

      -- Autocmd for organizing imports and formatting on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          local params = vim.lsp.util.make_range_params()
          params.context = { only = { "source.organizeImports" } }
          local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
          for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
              if r.edit then
                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                vim.lsp.util.apply_workspace_edit(r.edit, enc)
              end
            end
          end
          vim.lsp.buf.format({ async = false })
        end
      })
    end,
  },
}
