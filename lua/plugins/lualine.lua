return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function macro_recording()
      local recording_register = vim.fn.reg_recording()
      if recording_register == '' then
        return ''
      else
        return 'Recording @' .. recording_register
      end
    end






    local function lsp_status()
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return 'No LSP'
      end
      local names = {}
      for _, client in ipairs(clients) do
        table.insert(names, client.name)
      end
      return table.concat(names, ', ')
    end

    require('lualine').setup {
      options = {
        theme = 'tokyonight',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        -- stylua: ignore
        lualine_z = { 'location', macro_recording, function() return require('auto-session.lib').current_session_name(true) end }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    }
  end
}
