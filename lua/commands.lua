local pdf = require("pdf")

-- Create user commands
-- vim.api.nvim_buf_create_user_command(0, "MdCompile", pdf.compile, {})

-- Compile to pdf each time the current buffer is saved
local group = vim.api.nvim_create_augroup("Mdim", { clear = true, })
vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        pdf.compile(true)
    end,
    group = group,
    buffer = 0
})
