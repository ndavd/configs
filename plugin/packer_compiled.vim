" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "C:\\Users\\NUNODA~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\NUNODA~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\NUNODA~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\NUNODA~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\NUNODA~1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\auto-pairs"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cheat.sh-vim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\completion-nvim"
  },
  dracula = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\dracula"
  },
  edge = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\edge"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gruvbox-material"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\hop.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\markdown-preview.nvim"
  },
  ["neodark.vim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neodark.vim"
  },
  ["neosnippet-snippets"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neosnippet-snippets"
  },
  ["neosnippet.vim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neosnippet.vim"
  },
  nerdcommenter = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nerdcommenter"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-luapad"
  },
  ["nvim-scrollview"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-scrollview"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
  },
  playground = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim"
  },
  sonokai = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\sonokai"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\sql.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-frecency.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-fzy-native.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim"
  },
  ["vim-anyfold"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-anyfold"
  },
  ["vim-code-dark"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-code-dark"
  },
  ["vim-dirvish"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dirvish"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive"
  },
  ["vim-rfc"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-rfc"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-signify"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-sleuth"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-smoothie"
  },
  ["vim-solarized8"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-solarized8"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip-integ"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "C:\\Users\\NunoDavid\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vista.vim"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
