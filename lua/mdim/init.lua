local M = {}

M._config = {
    viewer = "",
    template = "",
}

M.setup = function(args)
    if type(args) ~= "table" then
        return
    end

    M._config.viewer = args.viewer
    M._config.template = args.tempate
end

local get_path = function()
    local md_path = vim.fn.expand("%")
    local pdf_path = string.gsub(md_path, ".md$", ".pdf")

    return md_path, pdf_path
end

local start_preview = function()
    if M._config.viewer == "" then
        return
    end
    local _, pdf_path = get_path()
    os.execute(M._config.viewer .. " " .. pdf_path .. " 2>/dev/null &")
end

local compile = function()
    if vim.bo.filetype ~= "markdown" then
        return
    end
    local md_path, pdf_path = get_path()
    os.execute("pandoc -f markdown -t pdf " .. md_path .. " -o " .. pdf_path .. " 2>/dev/null &")
end

local set_autocommands = function()
    vim.api.nvim_buf_create_user_command(0, "MdCompile", compile, {})
end

M.init = function()
    if vim.bo.filetype ~= "markdown" then
        return
    end
    set_autocommands()
    start_preview()
end

return M
