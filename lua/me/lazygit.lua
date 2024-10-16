local M = setmetatable({}, {
  __call = function(m, ...)
    return m.open(...)
  end,
})

-- Opens lazygit
function M.open(opts)
  opts = vim.tbl_deep_extend("force", {}, {
    esc_esc = false,
    ctrl_hjkl = false,
  }, opts or {})

  local cmd = { "lazygit" }
  vim.list_extend(cmd, opts.args or {})

  return require("me.terminal").open(cmd, opts)
end

return M

