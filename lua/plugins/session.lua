return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { '<leader>qr', '<cmd>SessionSearch<CR>',         desc = 'Session search' },
    { '<leader>qs', '<cmd>SessionSave<CR>',           desc = 'Save session' },
    { '<leader>qa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
  },

  opts = {

    auto_save = true,

    bypass_save_filetypes = { 'alpha', 'dashboard' },
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    --TODO: change cwd inside nvim, seems not change angthing
    cwd_change_handling = true,


  }
}
