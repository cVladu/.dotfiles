return {
  "anuvyklack/hydra.nvim",
  config = function()
    local hydra = require("hydra")
    local hint = [[
    _-_: decrease window height, _+_: increase window height
    _<_: decrease window width, _>_: increase window width
    _h_: left, _j_: down, _k_: up, _l_: right
    ]]
    hydra({
      name = "Window Movement",
      hint = hint,
      mode = "n",
      body = "<C-w>",
      heads = {
        { '-', '<C-w>-', },
        { '+', '<C-w>+', },
        { '<', '<C-w><', },
        { '>', '<C-w>>', },
        { 'h', '<C-w>hzz', },
        { 'j', '<C-w>jzz', },
        { 'k', '<C-w>kzz', },
        { 'l', '<C-w>lzz', },
      },
      config = {
        hint = {
          type = "window",
          position = "bottom-right",
          offset = 0,
          border = "double",
          show_name = true
        }
      }
    })
  end
}
