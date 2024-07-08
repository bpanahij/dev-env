vim.g.mapleader = " "

-- Define a helper function to simplify key mappings
local keymap = function(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        for k, v in pairs(opts) do
            options[k] = v
        end
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Key mappings
keymap("i", "jk", "<ESC>")

keymap("n", "<leader>nh", ":nohl<CR>")

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>") -- increment
keymap("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>") -- close current split window

keymap("n", "<leader>to", "<cmd>tabnew<CR>") -- open new tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab
keymap("n", "<leader>tn", "<cmd>tabn<CR>") -- go to next tab
keymap("n", "<leader>tp", "<cmd>tabp<CR>") -- go to previous tab
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>") -- move current buffer to new tab

