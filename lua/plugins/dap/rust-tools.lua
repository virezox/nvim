local rt = require("rust-tools")
local pkg = require("mason-registry").get_package("codelldb")
local dbg_path = pkg.get_install_path(pkg)
local codelldb_path = dbg_path .. "/extension/adapter/codelldb"
local liblldb_path = dbg_path .. "/extension/lldb/lib/liblldb.dylib"

rt.setup({
  server = {
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "<f5>", rt.hover_actions.hover_actions, { buffer = bufnr })
      client.resolved_capabilities.document_formatting = false
    end,
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
})
