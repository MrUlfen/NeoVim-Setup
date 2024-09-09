vim.cmd [[
silent! call plug#begin('C:/Users/simen/AppData/Local/nvim-data/site/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'RRethy/nvim-base16'
Plug 'catppuccin/nvim'
Plug 'preservim/tagbar', {'on': 'TagbarToggle'}
Plug 'dkarter/bullets.vim'
Plug 'glepnir/dashboard-nvim'
Plug 'mbbill/undotree'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/nvim-cmp'
Plug 'laytan/cloak.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

Plug 'neovim/nvim-lspconfig'                 " LSP Configurations
Plug 'hrsh7th/cmp-nvim-lsp'                  " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'                    " Buffer completions
Plug 'hrsh7th/cmp-path'                      " Path completions
Plug 'L3MON4D3/LuaSnip'                      " Snippet engine
Plug 'saadparwaiz1/cmp_luasnip'			     " Snippet completions

Plug 'goolord/alpha-nvim'
silent! call plug#end()
]]

-- Setup alpha-nvim after it's installed
require('alpha').setup(require'alpha.themes.dashboard'.config)

-- Customizing the Alpha dashboard (optional)
local dashboard = require'alpha.themes.dashboard'

-- Header section (Ascii art)
dashboard.section.header.val = {
    "Welcome to Neovim",
    "Your customized start screen",
    -- Add more lines or ascii art here
}

-- Buttons section (Custom shortcuts)
dashboard.section.buttons.val = {
    dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
    dashboard.button( "p", "  Find file" , ":Telescope find_files<CR>"),
    dashboard.button( "r", "  Recent files" , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  Settings" , ":e $MYVIMRC<CR>"),
}

-- Footer section (optional)
dashboard.section.footer.val = "Have a great day coding!"

-- Setup alpha with the customized dashboard
require'alpha'.setup(dashboard.config)

-- end of new inerface

--cloak plugin
require('cloak').setup({
  enabled = true,
  cloak_character = '*',
  -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
  highlight_group = 'Comment',
  -- Applies the length of the replacement characters for all matched
  -- patterns, defaults to the length of the matched pattern.
  cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
  -- Whether it should try every pattern to find the best fit or stop after the first.
  try_all_patterns = true,
  -- Set to true to cloak Telescope preview buffers. (Required feature not in 0.1.x)
  cloak_telescope = true,
  -- Re-enable cloak when a matched buffer leaves the window.
  cloak_on_leave = false,
  patterns = {
    {
      -- Match any file starting with '.env'.
      -- This can be a table to match multiple file patterns.
      file_pattern = '.env*',
      -- Match an equals sign and any character after it.
      -- This can also be a table of patterns to cloak,
      -- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
      cloak_pattern = '=.+',
      -- A function, table or string to generate the replacement.
      -- The actual replacement will contain the 'cloak_character'
      -- where it doesn't cover the original text.
      -- If left empty the legacy behavior of keeping the first character is retained.
      replace = nil,
    },
  },
})
--cloak plugin





local lspconfig = require'lspconfig'

lspconfig.lua_ls.setup {
  cmd = { "C:\\Program Files\\lua-language-server-3.10.5-win32-x64\\bin\\lua-language-server.exe" },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',  -- Neovim uses LuaJIT
      },
      diagnostics = {
        globals = { 'vim' },  -- Recognize the `vim` global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),  -- Make server aware of Neovim runtime files
      },
      telemetry = {
        enable = false,
      },
    },
  },
}









-- Set up nvim-cmp for autocompletion
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- LuaSnip for snippets
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm completion
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Set up Lua Language Server
local lspconfig = require'lspconfig'

lspconfig.lua_ls.setup {
  cmd = { "C:\\Program Files\\lua-language-server-3.10.5-win32-x64\\bin\\lua-language-server.exe" },  -- Replace with your actual path
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',  -- Neovim uses LuaJIT
      },
      diagnostics = {
        globals = { 'vim' },  -- Recognize the `vim` global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),  -- Make server aware of Neovim runtime files
      },
      telemetry = {
        enable = false,
      },
    },
  },
}




-- Set up the keybinding for Tagbar toggle (F9 in this example)
vim.api.nvim_set_keymap('n', '<F9>', ':TagbarToggle<CR>', { noremap = true, silent = true })


-- Set colorscheme
vim.cmd('colorscheme base16-onedark')

-- Load the colorscheme
require("catppuccin").setup({
    flavour = "macchiato", -- or "latte", "macchiato", "frappe"
})

vim.cmd("colorscheme catppuccin")



-- telescope keymap
vim.api.nvim_set_keymap('n', '<Space>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })



-- Bind Ctrl+P to promote the current bullet
vim.api.nvim_set_keymap('n', '<C-P>', ':BulletPromote<CR>', { noremap = true, silent = true })

-- Bind Ctrl+D to demote the current bullet
vim.api.nvim_set_keymap('n', '<C-D>', ':BulletDemote<CR>', { noremap = true, silent = true })

-- Bind Ctrl+Alt+P to promote bullets in visual mode
vim.api.nvim_set_keymap('v', '<C-A-P>', ':BulletPromoteVisual<CR>', { noremap = true, silent = true })

-- Bind Ctrl+Alt+D to demote bullets in visual mode
vim.api.nvim_set_keymap('v', '<C-A-D>', ':BulletDemoteVisual<CR>', { noremap = true, silent = true })





-- Map F2 to toggle NERDTree
vim.api.nvim_set_keymap('n', '<F2>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })



-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse support
vim.opt.mouse = "a"

-- Indentation settings
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true



-- NERDTree Configuration

vim.cmd [[
  let g:NERDTreeDirArrowExpandable = "+"
  let g:NERDTreeDirArrowCollapsible = "-"
]]


