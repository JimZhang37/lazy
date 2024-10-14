return {
  "lewis6991/gitsigns.nvim",
  -- event = "LazyFile",
  opts = {
    signs = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    preview_config = {
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    on_attach = function(buffer)
      local gs = require('gitsigns')

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end



      map("n", "]h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, "Next Hunk")
      map("n", "[h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, "Prev Hunk")
      map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
      map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
      -- change their
      map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk") -- ghs ->hs
      map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk") -- ghr ->hr
      map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")                   -- ghS -> hS
      map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")             -- ghu ->hu
      map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")                   -- ghR ->hR
      map("n", "<leader>ho", gs.preview_hunk_inline, "Preview Hunk Inline")     -- ghp ->hp
      map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk")  -- ghp ->hp
      map("n", "<leader>hb", "<cmd>Gitsigns blame_line<cr>", "Blame Line")      -- ghb -> hb
      map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      map('n', '<leader>ghb', '<cmd>Gitsigns toggle_current_line_blame<CR>', "Toggle Current Line Blame")
    end,
  },
}
