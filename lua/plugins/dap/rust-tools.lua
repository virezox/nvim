local dap = require("dap")

dap.adapters.lldb = {
  type = "executable",
  command = "/opt/homebrew/opt/llvm/bin/lldb-vscode", -- adjust as needed, must be absolute path
  name = "lldb",
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local rt = require("rust-tools")
local pkg = require("mason-registry").get_package("codelldb")
local dbg_path = pkg.get_install_path(pkg)
local codelldb_path = dbg_path .. "/extension/adapter/codelldb"
local liblldb_path = dbg_path .. "/extension/lldb/lib/liblldb.dylib"

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<f5>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<f6>", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
})
