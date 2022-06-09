local pdf = require("pdf")

local commands = {
    ["compile"] = function()
        pdf.compile(true)
    end,
}

local exec = function(opts)
    local command = commands[opts.args]
    if command == nil then
        return
    end
    command()
end

-- User commands and autocommands
vim.api.nvim_buf_create_user_command(0, "Mdim", exec, { nargs = 1 })

local group = vim.api.nvim_create_augroup("Mdim", { clear = true, })

-- Compile to pdf every time the current buffer is saved
vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        pdf.compile(true)
    end,
    group = group,
    buffer = 0
})
