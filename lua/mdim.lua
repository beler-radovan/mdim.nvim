local M = {}
local pdf = require("pdf")
local config = require("config")

M.setup = function(args)
    config.setup(args)
end

M.init = function()
    if vim.bo.filetype ~= "markdown" then
        return
    end

    -- Initialize commands and autocommands
    require("commands")

    pdf.compile(false)
    pdf.start_preview()
end

return M
