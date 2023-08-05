local lsp_status = require 'lsp-status'

lsp_status.config {
  indicator_hint = '',
  indicator_info = '',
  indicator_errors = '',
  indicator_warnings = '',
  indicator_ok = '',
  status_symbol = '',
  diagnostics = false,
}

lsp_status.register_progress()

local servers = {
  clangd = {},
  gopls = {},
  pyright = {},
  emmet_ls = {},
  docker_compose_language_service = {},
  dockerls = {},
  rust_analyzer = {},
  prismals = {},
  tailwindcss = {},
  eslint = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  require('keymaps').lsp()
  lsp_status.on_attach(client)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local handler = lsp_status.extensions[server_name]
    if handler ~= nil then
      handler = handler.setup()
    end
    require('lspconfig')[server_name].setup {
      handlers = handler,
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
