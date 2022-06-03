local pdf = require("pdf")

-- Create user commands
vim.api.nvim_buf_create_user_command(0, "MdCompile", pdf.compile, {})

-- Compile to pdf each time the current buffer is saved to a file
vim.api.nvim_create_autocmd("BufWritePost", { command = "MdCompile", })
