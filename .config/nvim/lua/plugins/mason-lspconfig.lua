return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd" },
        ensure_installed = { "jdtls" }
      })
    end,
}
