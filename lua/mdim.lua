local M = {}
local config = require("config")
local pdf = require("pdf")

M.init = function()
    if vim.bo.filetype ~= "markdown" then
        return
    end

    require("commands")
    pdf.compile(false)
    pdf.start_preview()
end

M.setup = function(args)
    if type(args) ~= "table" then
        return
    end

    config.set_viewer(args.viewer)
    config.set_template(args.template)
end

return M
