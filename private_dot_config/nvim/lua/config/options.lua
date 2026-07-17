-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local clipboard_provider = vim.fn["provider#clipboard#Executable"]()

if clipboard_provider == "" or clipboard_provider == "OSC 52" then
  -- Use the terminal's OSC 52 support for clipboard access in remote sessions.
  vim.g.clipboard = "osc52"
end

vim.opt.clipboard = "unnamedplus"
