-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "radium",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- Add non-LSP tools like formatters or linters here
-- not sure where else we can put these
M.mason = {
  pkgs = {
    "eslint_d",
    "prettier",
    "stylua", -- Lua formatter
  },
}

-- M.plugins = {
--   -- Add your lspconfig configuration
--   {
--     "neovim/nvim-lspconfig",
--     config = function()
--       local lspconfig = require "lspconfig"
--
--       -- Set up language servers here
--       lspconfig.lua_ls.setup {}
--       lspconfig.html.setup {}
--       lspconfig.cssls.setup {}
--       lspconfig.tsserver.setup {}
--       lspconfig.tailwindcss.setup {}
--       lspconfig.svelte.setup {}
--       lspconfig.eslint.setup {}
--     end,
--   },
-- }

return M
