-- Raise the TypeScript language server (vtsls) memory limit.
-- Equivalent of VS Code's `typescript.tsserver.maxTsServerMemory`.
-- Value is in MB. Bump this to match (or exceed) your VS Code setting if
-- tsserver still aborts with SIGABRT (V8 "heap out of memory") on large repos.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 8192,
              },
            },
          },
        },
      },
    },
  },
}
