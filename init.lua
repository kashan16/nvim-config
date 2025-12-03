-- ~/.config/nvim/init.lua

-- === BASIC OPTIONS ===
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Load plugin definitions
require("plugins")

-- === TREESITTER CONFIGURATION ===
require("nvim-treesitter.configs").setup({
  ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "lua", "json" },
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
})

-- === TELESCOPE KEYMAPS (fuzzy search) ===
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)

-- === FILE EXPLORER + SAVE/QUIT ===
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- === GIT: lazygit + git signs ===
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>")
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>")
vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>")

-- === AUTOCOMPLETE (nvim-cmp + LuaSnip) ===
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
})

-- === NATIVE LSP SETUP (Neovim ≥ 0.11) ===

-- Optional defaults for all LSP servers
vim.lsp.config("*", {
  flags = {
    debounce_text_changes = 150,
  },
})

-- List of non-TS/JS servers to enable
local servers = {
  "tailwindcss", "html", "cssls", "eslint",
  "jsonls", "lua_ls", "dockerls", "yamlls",
  "bashls", "pyright", "gopls", "sqlls",
}

for _, name in ipairs(servers) do
  vim.lsp.enable(name)
end

-- Custom settings for lua_ls
vim.lsp.config("lua_ls", {
  settings = {
    Lua = { diagnostics = { globals = { "vim" } } }
  }
})
vim.lsp.enable("lua_ls")

-- Note: TS/JS handled by typescript-tools.nvim — no manual TS server setup needed

-- === FORMATTING / LINTING (none-ls) ===
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
  },
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- === OUTLINE (Aerial) ===
vim.keymap.set("n", "<leader>a", ":AerialToggle!<CR>")

-- === TERMINAL (ToggleTerm) ===
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>")

-- === HARPOON (file nav) ===
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>ha", function() harpoon.list():append() end)
vim.keymap.set("n", "<leader>hh", function() harpoon.ui.toggle_quick_menu(harpoon.list()) end)
vim.keymap.set("n", "<leader>h1", function() harpoon.list():select(1) end)
vim.keymap.set("n", "<leader>h2", function() harpoon.list():select(2) end)
vim.keymap.set("n", "<leader>h3", function() harpoon.list():select(3) end)

-- === DIAGNOSTICS PANEL (Trouble.nvim) ===
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle diagnostics list" })

-- === DAP (Debugging) & DAP UI + virtual text ===
local dap = require("dap")
local dapui = require("dapui")
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<leader>du", dapui.toggle)
vim.keymap.set("n", "<leader>dr", dap.restart)

dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "node",
    args = {
      vim.fn.stdpath("config") .. "/vscode-js-debug/out/src/vsDebugServer.js",
      "8123",
    },
  },
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch Node Program",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
dap.configurations.typescript = dap.configurations.javascript
dap.configurations.javascriptreact = dap.configurations.javascript
dap.configurations.typescriptreact = dap.configurations.javascript

dap.configurations.typescriptreact[#dap.configurations.typescriptreact + 1] = {
  type = "pwa-node",
  request = "launch",
  name = "Debug Next.js",
  runtimeExecutable = "npm",
  runtimeArgs = { "run", "dev" },
  cwd = "${workspaceFolder}",
  console = "integratedTerminal",
}
