local M = {}

M.config = {
    viewer = "",
    template = "",
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

return M
