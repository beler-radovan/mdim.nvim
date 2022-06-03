local M = {}
local utils = require("utils")
local config = require("config")

M.start_preview = function()
    if config.viewer == "" then
        return
    end
    print(config.viewer)
    local _, pdf_path = utils.get_path()
    os.execute("evince" .. " " .. pdf_path .. " 2>/dev/null &")
end

M.compile = function()
    if vim.bo.filetype ~= "markdown" then
        return
    end
    local md_path, pdf_path = utils.get_path()
    os.execute("pandoc -f markdown -t pdf " .. md_path .. " -o " .. pdf_path .. " 2>/dev/null &")
end

return M
