local M = {}

local nb = require("nb._")

M.newNote = function()
  local path = os.getenv("HOME") .. nb.conf.nb_dir
  local datetime = os.date('%Y-%m-%d_%H-%M-%S')
  local file = path .. datetime .. '.md'
  vim.cmd('edit ' .. file)

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = file,
    callback = function()
      vim.notify("Syncing with nb...", vim.log.levels.INFO)
      nb.sync()
    end,
    once = true
  })
end

return M
