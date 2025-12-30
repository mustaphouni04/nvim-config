local M = {}

function M.open()
  local starter = require("mini.starter")

  starter.setup({
    evaluate_single = true,
    items = {
      starter.sections.recent_files(10, true),
      starter.sections.builtin_actions(),
    },
    footer = "welcome back",
  })

  vim.schedule(function()
    MiniStarter.open()
  end)
end

return M
