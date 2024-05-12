local job = require('plenary.job')

local M = {}

M.config = {
  auto_sync = false,
  nb_dir = os.getenv("HOME") .. "/.nb/home/",
}

M.sync = function()
  job:new({
    command = "nb",
    args = { "sync" },
    on_stderr = function(_, err)
      vim.notify("Error syncing nb.sh: " .. err, vim.log.levels.ERROR)
    end,
    on_exit = function(_, return_val)
      if return_val == 0 then
        M.notify("Sync complete")
      else
        M.notify("Sync error: exit code " .. return_val)
      end
    end
  }):start()
end

M.notify = function(message)
  vim.schedule(function()
    vim.notify(message, vim.log.levels.INFO)
  end)
end

return M
