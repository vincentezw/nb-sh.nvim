Nb= require("nb")

vim.api.nvim_create_user_command('NbNew',
  Nb.newNote,
  {desc = "Create new nb.sh note"}
)

vim.api.nvim_create_user_command('NbNotes',
  function()
    vim.cmd('terminal nb browse')
  end,
 {desc = "Create new nb.sh note"}
)

-- local keymap = vim.keymap
-- keymap.set("n", "<leader>nn", "<cmd>NbNew<CR>", { desc = "New note" })
