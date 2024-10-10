return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,              -- Enable incremental selection
          keymaps = {
            init_selection = "<C-space>", -- Start selection
            node_incremental = "<C-space>", -- Increment selection to the next node
            node_decremental = "<C-b>", -- Decrement selection to the previous node
            scope_incremental = "<C-e>", -- Increment selection to the next scope
          },
        },
      })
    end,
  },

}
