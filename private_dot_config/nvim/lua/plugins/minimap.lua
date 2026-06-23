-- VSCode-style minimap on the right, showing the whole file's shape with the
-- current viewport highlighted. Requires the `code-minimap` binary on PATH
-- (installed via Homebrew in the chezmoi setup script).
return {
  "wfxr/minimap.vim",
  event = "VeryLazy",
  keys = {
    { "<leader>um", "<cmd>MinimapToggle<cr>", desc = "Toggle minimap" },
  },
  init = function()
    vim.g.minimap_width = 10
    vim.g.minimap_auto_start = 1
    vim.g.minimap_auto_start_win_enter = 1
    vim.g.minimap_highlight_range = 1 -- highlight the current viewport
    vim.g.minimap_highlight_search = 1 -- show search matches
    vim.g.minimap_git_colors = 1 -- color git changes
  end,
}
