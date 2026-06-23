return {
  -- Make folder icons visually distinct from .ts (and other azure/blue) files.
  -- By default mini.icons colors both directories and TypeScript files with
  -- `MiniIconsAzure`, which makes them hard to tell apart. Color folders yellow.
  {
    "nvim-mini/mini.icons",
    opts = {
      default = {
        directory = { glyph = "󰉋", hl = "MiniIconsYellow" },
      },
    },
  },
}
