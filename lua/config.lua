local M = {}

M.config = {
    viewer = "",
    template = "",
}

M.setup = function(args)
    if type(args) ~= "table" then
        return
    end

    for key, _ in pairs(args) do
        if args[key] ~= nil then
            M.config[key] = args[key]
        end
    end
end

M.get_viewer = function()
    return M.config.viewer
end

M.get_template = function()
    return M.config.template
end

return M
