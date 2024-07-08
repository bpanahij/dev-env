return {
  "codethread/qmk.nvim",
  config = function()
    ---@type qmk.UserConfig
    local conf = {
      name = "LAYOUT_voyager",
      layout = {
        "x x x x x x _ _ _ x x x x x x",
        "x x x x x x _ _ _ x x x x x x",
        "x x x x x x _ _ _ x x x x x x",
        "x x x x x x _ _ _ x x x x x x",
        "_ _ _ _ _ x x _ x x _ _ _ _ _",
      },
    }
    require("qmk").setup(conf)
  end,
}
