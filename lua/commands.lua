local config = require("config")
local pdf = require("pdf")

local commands = {
    ["compile"] = function()
        pdf.compile(true)
    end,
}

local exec = function(opts)
    local command = commands[opts.args]
    if command == nil then
        print("Mdim: Invalid command")
        return
    end
    command()
end

-- User commands
vim.api.nvim_buf_create_user_command(0, "Mdim", exec, { nargs = 1 })

-- Autocommands
local group = vim.api.nvim_create_augroup("Mdim", { clear = true, })

-- Compile to pdf every time the current buffer is saved
if config.get_autocompile() == true then
    vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
            pdf.compile(true)
        end,
        group = group,
        buffer = 0
    })
end
