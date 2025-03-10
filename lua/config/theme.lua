return {
  {
    "xero/miasma.nvim",
    lazy = false, -- Load immediately
    priority = 1000, -- Ensure it loads before other plugins
    config = function()
      vim.cmd("colorscheme miasma")
    end
  }
}
