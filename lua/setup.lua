local M = {}
local config = require("config")
local pdf = require("pdf")

M.init = function()
    if vim.bo.filetype ~= "markdown" then
        return
    end

    -- Initialize commands and autocommands
    require("commands")

    pdf.compile(false)
    pdf.start_preview()
end

local actions = {
    ["init"] = M.init
}

local set_keymaps = function(keymaps)
    if keymaps == nil or type(keymaps) ~= "table" then
        return
    end
    local map = vim.keymap.set
    local opts = { silent = true, remap = false }
    for keymap, action in pairs(keymaps) do
        map("n", keymap, actions[action], opts)
    end
end

M.setup = function(args)
    if type(args) ~= "table" then
        return
    end

    config.set_viewer(args.viewer)
    config.set_template(args.template)
    set_keymaps(args.keymap)
end

return M
