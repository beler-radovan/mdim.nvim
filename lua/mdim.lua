local M = {}
local pdf = require("pdf")
local config = require("config")

M.setup = function(args)
    if type(args) ~= "table" then
        return
    end

    config.viewer = args.viewer
    config.template = args.tempate
end

local create_autocommands = function()
    vim.api.nvim_buf_create_user_command(0, "MdCompile", pdf.compile, {})
    vim.api.nvim_create_autocmd("BufWritePost", { command = "MdCompile", })
end

M.init = function()
    if vim.bo.filetype ~= "markdown" then
        return
    end
    create_autocommands()
    pdf.start_preview()
end

return M
