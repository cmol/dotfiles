return {
  "m4xshen/smartcolumn.nvim",
  config = function()
    require("smartcolumn").setup({
      custom_colorcolumn = {
        ruby = "90",
      },
    })
  end,
}
