return {
  "nvim-luxmotion",
  config = function()
    require("whisk").setup({
      cursor = {
        duration = 100,
        easing = "ease-out",
        enabled = true,
      },
      scroll = {
        duration = 100,
        easing = "ease-out",
        enabled = true,
      },
      performance = { enabled = true },
      keymaps = {
        cursor = true,
        scroll = true,
      },
    })
  end,
  }
