Nb = require("nb")

vim.api.nvim_create_user_command('NbNew',
  Nb.newNote,
  {desc = "Create new nb note"}
)

vim.api.nvim_create_user_command('NbBrowse',
  function()
    vim.cmd('terminal nb browse')
  end,
 {desc = "Create new nb note"}
)

return {
  setup = Nb.setup
}
