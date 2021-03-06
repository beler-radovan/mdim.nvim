local M = {}
local utils = require("utils")
local config = require("config")

M.start_preview = function()
    if config.get_viewer() == nil then
        return
    end
    local _, pdf_path = utils.get_path()
    os.execute(config.get_viewer() .. " " .. pdf_path .. " 2>/dev/null &")
end

M.document_compiled = function()
    local dir = io.popen("ls", "r"):read("*l")
    local _, pdf_path = utils.get_path()

    return string.match(dir, pdf_path)
end

M.compile = function(in_background)
    if vim.bo.filetype ~= "markdown" then
        return
    end

    local md_path, pdf_path = utils.get_path()
    local command = "pandoc -f markdown -t pdf "
    local template = config.get_template()
    if template ~= nil then
        command = command .. "--template " .. template .. " "
    end
    command = command .. "--listing "
    command = command .. md_path .. " "
    command = command .. "-o "
    command = command .. pdf_path .. " "
    command = command .. "2>/dev/null "
    -- command = command .. "2>&1 "
    if in_background then
        command = command .. "&"
    end

    os.execute(command)
    -- local output = io.popen(command, "r"):read("*a")
    -- print(output)
end

return M
