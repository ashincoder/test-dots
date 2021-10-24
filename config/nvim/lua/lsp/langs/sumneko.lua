local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
   return
end

local sumneko_root_path = vim.fn.stdpath "data" .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

local M = {}
M.setup = function(on_attach, capabilities)
   lspconfig.sumneko_lua.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
      settings = {
         Lua = {
            runtime = {
               -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
               version = "LuaJIT",
               -- Setup your lua path
               path = vim.split(package.path, ";"),
            },
            diagnostics = {
               -- Get the language server to recognize the `vim` global
               globals = { "vim" },
            },
            workspace = {
               -- Make the server aware of Neovim runtime files
               library = {
                  [vim.fn.expand "$VIMRUNTIME/lua"] = true,
               },
               maxPreload = 100000,
               preloadFileSize = 1000,
            },
         },
      },
   }
end

return M
