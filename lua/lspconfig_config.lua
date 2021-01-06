-- C, C++
require'lspconfig'.clangd.setup{}

-- LaTeX
require'lspconfig'.texlab.setup{}

-- Vimscript
require'lspconfig'.vimls.setup{}

-- Cmake
require'lspconfig'.cmake.setup{}

-- Python
require'lspconfig'.pyright.setup{root_dir = function() return vim.fn.getcwd() end}

-- JavaScript, TypeScript
require'lspconfig'.tsserver.setup{root_dir = function() return vim.fn.getcwd() end}

-- Vue
require'lspconfig'.vuels.setup{}

-- Html
require'lspconfig'.html.setup{}

-- Css
require'lspconfig'.cssls.setup{}

-- C#
local pid = vim.fn.getpid()
local omnisharp_bin = "OmniSharp.exe"
require'lspconfig'.omnisharp.setup{
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}

-- Java
-- using nvim-jdtls

-- Json
require'lspconfig'.jsonls.setup{}

-- Lua
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
local sumneko_root_path = 'C:/Program Files/nvim/bin/lua/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
require'lspconfig'.sumneko_lua.setup {
  root_dir = function() return vim.fn.getcwd() end;
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}
