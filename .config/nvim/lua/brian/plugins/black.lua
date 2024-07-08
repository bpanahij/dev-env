return {
  "psf/black",
  filetypes = { "python" },
  cmd = { "Black" },
  keys = {
    { "<leader>b", "<cmd>Black<cr>", desc = "Run Black code formatter" },
  },
  setup = function()
    local map = require("utils").map

    -- Map the keybinding to run Black code formatter
    map("n", "<leader>b", "<cmd>Black<cr>", { noremap = true, silent = true })
  end,
}
