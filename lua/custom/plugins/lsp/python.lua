local shared = require("custom.plugins.lsp")

local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()

      -- Avoid attaching multiple times
      for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
        if client.name == "pylsp" then
          return
        end
      end

      vim.lsp.start({
        name = "pylsp",
        cmd = { "pylsp" },
        root_dir = shared.find_root({'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git'}),
        on_attach = shared.on_attach,
        settings = {}
      })
    end,
    desc =  "Start Python LSP",
  })
end

return M
        
