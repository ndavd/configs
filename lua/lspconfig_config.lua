--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- C, C++
require'lspconfig'.clangd.setup{
  capabilities = capabilities,
}

-- LaTeX
require'lspconfig'.texlab.setup{
  settings = {
    latex = {
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-pvc" },
        forwardSearchAfter=true,
        onSave = true,
      },
      forwardSearch = {
        executable = "SumatraPDF.exe",
        args = {
          "-reuse-instance",
          "%p",
          "-forward-search",
          "%f",
          "%l",
        },
        onSave=true,
      },
    }
  }
}

-- For Rust
require'lspconfig'.rust_analyzer.setup{
  capabilities = capabilities,
}

-- Vimscript
require'lspconfig'.vimls.setup{
  capabilities = capabilities,
}

-- Cmake
require'lspconfig'.cmake.setup{
  capabilities = capabilities,
}

-- Python
require'lspconfig'.pyright.setup{
  root_dir = function() return vim.fn.getcwd() end,
  capabilities = capabilities,
}

-- JavaScript, TypeScript
require'lspconfig'.tsserver.setup{
  root_dir = function() return vim.fn.getcwd() end,
  capabilities = capabilities,
}

-- Vue
require'lspconfig'.vuels.setup{
  capabilities = capabilities,
}

-- bash
require'lspconfig'.bashls.setup{
  cmd = { "bash-language-server.cmd", "start" },
}

-- Html
require'lspconfig'.html.setup {
  capabilities = capabilities,
  cmd = { "html-languageserver.cmd", "--stdio" },
}

-- Css
require'lspconfig'.cssls.setup{
  capabilities = capabilities,
  cmd = { "css-languageserver.cmd", "--stdio" },
}

-- Json
require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}

-- C#
local pid = vim.fn.getpid()
local omnisharp_bin = "OmniSharp.exe"
require'lspconfig'.omnisharp.setup{
  capabilities = capabilities,
  cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
}

-- Java
-- using nvim-jdtls

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
local sumneko_root_path = 'C:/sumneko_lua/lua-language-server'
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
