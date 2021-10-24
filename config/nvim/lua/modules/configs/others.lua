local M = {}

M.colorizer = function()
   local present, colorizer = pcall(require, "colorizer")
   if not present then
      return
   end
   colorizer.setup()
   vim.cmd "ColorizerReloadAllBuffers"
end

M.signature = function()
   local present, lspsignature = pcall(require, "lsp_signature")
   if not present then
      return
   end

   lspsignature.setup {
      bind = true,
      doc_lines = 2,
      floating_window = true,
      fix_pos = true,
      hint_enable = true,
      hint_prefix = " ",
      hint_scheme = "String",
      hi_parameter = "Search",
      max_height = 22,
      max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
      handler_opts = {
         border = "single", -- double, single, shadow, none
      },
      zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
      padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
   }
end

M.luasnip = function()
   local present, luasnip = pcall(require, "luasnip")
   if not present then
      return
   end

   luasnip.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
   }

   require("luasnip/loaders/from_vscode").lazy_load()
end

M.autopairs = function()
   local present1, autopairs = pcall(require, "nvim-autopairs")
   local present2, completion = pcall(require, "nvim-autopairs.completion.cmp")
   if not present1 and present2 then
      return
   end

   autopairs.setup {}
   completion.setup {
      map_cr = true, --  map <CR> on insert mode
      map_complete = true, -- it will auto insert `(` after select function or method item
      auto_select = true, -- automatically select the first item
   }
end

return M
