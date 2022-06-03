local M = {}
local utils = require("utils")
local config = require("config")

M.start_preview = function()
    if config.viewer == "" then
        return
    end
    local _, pdf_path = utils.get_path()
    os.execute("evince" .. " " .. pdf_path .. " 2>/dev/null &")
end

M.compile = function()
    if vim.bo.filetype ~= "markdown" then
        return
    end

    local md_path, pdf_path = utils.get_path()
    local command = "pandoc -f markdown -t pdf "
    if config.get_template() ~= nil then
        command = command .. "--template " .. config.get_template() .. " "
    end
    command = command .. "--listing "
    command = command .. md_path .. " "
    command = command .. "-o "
    command = command .. pdf_path .. " "
    command = command .. "2>/dev/null &"

    os.execute(command)
end

return M
