vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local argc = vim.fn.argc()
    local argv = vim.v.argv

    -- plain `nvim`
    if argc == 0 then
      require("config.dashboard").open()
      return
    end

    -- `nvim .`
    if argc == 1 and argv[#argv] == "." then
      vim.cmd("silent! rshada!")

      local oldfiles = vim.v.oldfiles
      if oldfiles and #oldfiles > 0 then
        local last = oldfiles[1]
        if vim.fn.filereadable(last) == 1 then
          vim.cmd("edit " .. vim.fn.fnameescape(last))
          vim.cmd("filetype detect")
          vim.cmd("doautocmd BufReadPost")
        end
      end
    end
  end,
})
