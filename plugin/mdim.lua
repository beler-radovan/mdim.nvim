local mdim = require("mdim")

-- Command used to initialize Mdim, other commands are created after
-- initialization
vim.api.nvim_buf_create_user_command(0, "MdimInit", mdim.init, {})
