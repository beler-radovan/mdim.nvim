local M = {}

M.get_path = function()
    local md_path = vim.fn.expand("%")
    local pdf_path = string.gsub(md_path, ".md$", ".pdf")

    return md_path, pdf_path
end

return M
