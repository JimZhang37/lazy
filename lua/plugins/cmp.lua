return {
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets"
    },
    config = function()
      local ls = require("luasnip")
      vim.keymap.set({ "i" }, "<Tab>", function() ls.expand() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<Tab>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<S-Tab>", function() ls.jump(-1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-E>", function() if ls.choice_active() then ls.change_choice(1) end end,
        { silent = true })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp-signature-help" },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load() -- add path to my own snippets; .lazy_load({ paths = { "./my-cool-snippets" } })
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          -- ["<C-f>"] = cmp.mapping.scroll_docs(4), -- because mason can't use language selection
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
          })
        }),
        -- sources = cmp.config.sources({
        sources = {
          -- TODO: what is group_index. copilot man
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "nvim_lsp_signature_help" },
          { name = "buffer" },
          { name = "path" },

        },
        completion = { completeopt = "menu,menuone,noinsert, noselect" },
        preselect = { cmp.PreselectMode.Item }, -- the default is the first in the list
        { { name = "buffer" } }
      })
      -- autopairs
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      -- `/` cmdline setup.
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      -- `/` cmdline setup.
      cmp.setup.cmdline('?', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      -- `:` cmdline setup.
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' }
            }
          }
        })
      })
    end
  }
}
