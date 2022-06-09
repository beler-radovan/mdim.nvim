local M = {}

M.config = {
    viewer = "",
    template = "",
    autocompile = false,
}

M.set_viewer = function(viewer)
    M.config.viewer = viewer
end

M.get_viewer = function()
    return M.config.viewer
end

M.set_template = function(template)
    M.config.template = template
end

M.get_template = function()
    return M.config.template
end

M.set_autocompile = function(val)
    if type(val) ~= "boolean" then
        return
    end
    M.config.autocompile = val
end

M.get_autocompile = function()
    return M.config.autocompile
end

return M
