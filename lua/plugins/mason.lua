return {
  {
    "williamboman/mason.nvim",
    --TODO: why Mason can't show language selection?



    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    --[[     opts_extend = { "ensure_installed" }, ]]

    opts = {
      -- ensure_installed = {
      --   "stylua",
      --   "shfmt",
      -- },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
      keymaps = {
        apply_language_filter = "<C-1>",
      }
    }
  },

  {
    "williamboman/mason-lspconfig.nvim",
    -- opts = {},
    config = function() end
  },






}
