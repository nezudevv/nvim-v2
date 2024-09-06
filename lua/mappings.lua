require "nvchad.mappings"

-- Define a Lua function to open Git Fugitive in an existing or new tab
_G.openFugitiveTab = function()
  -- Check if there is a tab containing a buffer with Fugitive filetype
  local fugitive_tab = -1
  vim.cmd 'tabdo let bufnr = bufnr("%") | if bufname(bufnr) =~# "^fugitive://" | let fugitive_tab = tabpagenr() | endif'
  if fugitive_tab ~= -1 then
    -- If a Fugitive tab is found, switch to it
    vim.cmd(tostring(fugitive_tab) .. "tabnext")
  else
    -- If no Fugitive tab is found, open a new tab with Git Fugitive
    vim.cmd "tab G"
  end
end

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- move line up/down
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- oil
map("n", "-", "<CMD>:Oil --float<CR>", { desc = "Open current directory" })

-- git do not replace ':' with '<CMD>'. It won't work that way.
map("n", "<leader>gs", ":lua openFugitiveTab()<CR>", { desc = "Fugitive git status" })

-- git blame
map("n", "<leader>gb", "<CMD>GitBlameToggle<CR>", { desc = "Git blame toggle" })

-- redo last change remap
map("n", "U", "<CMD>redo<CR>", { desc = "Redo last change" })

-- diagnostic
map("n", "<leader>df", function() vim.diagnostic.open_float { border = "rounded" } end, { desc = "LSP diagnostic float" })

-- obsidian
    -- ["<leader>cn"] = {
    --   "<CMD>lua if vim.opt.conceallevel:get() == 0 then vim.opt.conceallevel = 2 else vim.opt.conceallevel = 0 end<CR>",
    --   "Toggle Markdown Concealment",
    -- },
    -- ["<leader>cj"] = {
    --   "<CMD> ObsidianToggleCheckbox <CR>",
    --   "Toggle Markdown Checklist",
    -- },
