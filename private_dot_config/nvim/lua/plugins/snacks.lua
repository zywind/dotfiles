return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = { hidden = true }, -- file picker: show dotfiles like .github
        explorer = { hidden = true }, -- file explorer (<leader>e): show dotfiles
        -- add `ignored = true` to either to also show .gitignore'd files
      },
    },
  },
}
