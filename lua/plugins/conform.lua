return {
  'stevearc/conform.nvim',

  opts = {

    formatters_by_ft = {
      python = { "black" },
      lua = {
        exe = "stylua",
        args = { "--config-path", "/Users/yaohua/.config/nvim/stylua.toml" },
      },
      go = { "goimports" },
      cpp = { "clang_format" }

    },

    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "fallback"
    }
  }

}
