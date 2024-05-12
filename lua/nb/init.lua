local M = {}

local nb = require("nb._")

M.newNote = function()
  local path = nb.config.nb_dir
  local datetime = os.date('%Y-%m-%d_%H-%M-%S')
  local file = path .. datetime .. '.md'
  vim.cmd('edit ' .. file)

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = file,
    callback = function()
      if not nb.config.auto_sync then
        return
      end

      nb.notify("Note saved. Syncing nb...")
      nb.sync()
    end,
  })
end

M.setup = function(user_config)
  if not user_config then
    return
  end

  nb.config.auto_sync = user_config.auto_sync or true
  nb.config.nb_dir = user_config.nb_dir or os.getenv("HOME") .. "/.nb/home/"
end

return M
