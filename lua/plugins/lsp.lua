return {

  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')
    --local cmp_nvim_lsp = require('cmp_nvim_lsp')

    --local capabilities1 = vim.lsp.protocol.make_client_capabilities()
    --local capabilities2 = cmp_nvim_lsp.default_capabilities()
    --      write_table_to_file(capabilities1, "capabilities1.lua")
    --      write_table_to_file(capabilities2, "capabilities2.lua")
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

    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },

          hint = {
            enable = true,
            setType = false,
            paramType = true,

          }

        }
      },
      on_attach = on_attach,
    }

    lspconfig.clangd.setup({
      cmd = { "clangd", "--fallback-style=webkit" },
      on_attach = on_attach,
      settings = {
        clangd = {
          inlayHints = {
            enable = true,
            parameterNames = true,
            typeHints = true,
            deducedType = true,
          },
        },
      },
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
    --TODO: pyright supports inlayhints?
    lspconfig.pyright.setup {
      settings = {
        python = {
          analysis = {
            inlayHints = {
              variableTypes = { enabled = true },
              functionReturnTypes = { enabled = true },
              parameterNames = { enabled = true },
            },
          },
        },
      },

      on_attach = on_attach,
    }

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
}
