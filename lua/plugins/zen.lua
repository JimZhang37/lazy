return {
  {
    "folke/zen-mode.nvim",
    dependencies = {

      "folke/twilight.nvim",
    },
    keys = {
      {
        "<leader>z",
        "<CMD>ZenMode<CR>",
        desc = "Zen Mode",
      },
    },
    opts = {
      plugins = {
        kitty = {
          enable = true,
        },
      },
      window = {
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      on_open = function()
        vim.o.laststatus = 0
      end,
      on_close = function()
        vim.o.laststatus = 2
      end,
    },
  },
  {
    "folke/twilight.nvim",
    lazy = true,
    opts = {},
  },
}
