# My Neovim Config 🧑‍💻

> A full-featured, minimal, dark-theme Neovim configuration — great for React / TypeScript / Next.js / full-stack development
> Includes auto-imports, LSP, fuzzy search, Git, DAP debugging, and VS Code–like convenience.

---

## 🚀 Why this setup

- **Modern and fast:** Uses `lazy.nvim` for on-demand loading, so startup stays snappy.
- **TypeScript & JS ready:** Auto-imports, completions, linting, formatting using `typescript-tools.nvim`, `nvim-cmp`, and `none-ls`.
- **IDE — inside Neovim:** Full-stack features — file tree, fuzzy search, outline view, git tools, debugging support, terminal integration.
- **Minimal & Dark:** Uses high-contrast, eye-friendly dark theme (kanagawa) + minimal UI clutter.
- **Cross-machine reproducible:** Easy to clone / symlink / reuse on any Linux/Ubuntu + zsh setup.

---

## 📦 What's Included (Highlights)

| Category | Plugins / Features |
|---------|-------------------|
| **Theme & UI** | `kanagawa.nvim`, `lualine`, file icons |
| **Syntax & Parsing** | `nvim-treesitter` (JS / TS / HTML / CSS / Lua / JSON / more) |
| **File Navigation** | `telescope.nvim`, `neo-tree.nvim`, `harpoon` (quick file nav) |
| **Auto-close / Auto-tagging** | `nvim-autopairs`, `nvim-ts-autotag` (brackets, JSX tags) |
| **Commenting** | `Comment.nvim` (toggle comments) |
| **Git Integration** | `gitsigns.nvim` (inline git info), `lazygit.nvim`, Git-related keymaps |
| **IntelliSense (LSP)** | `mason.nvim`, `mason-lspconfig`, native `vim.lsp`, plus `typescript-tools.nvim` for JS/TS |
| **Autocomplete & Snippets** | `nvim-cmp`, `LuaSnip`, buffer & path completions |
| **Linting & Formatting** | `none-ls.nvim` with Prettier, Stylua, ESLint — auto-format on save |
| **Diagnostics / Error Panel** | `trouble.nvim` for VS Code–style problem list |
| **Code Navigation & Refactoring** | LSP features + `refactoring.nvim`, outline via `aerial.nvim` |
| **Terminal Integration** | `toggleterm.nvim` — terminal inside Neovim |
| **Debugging** | `nvim-dap`, `dap-ui`, `dap-virtual-text` — debug JS/TS / Node / Next.js |
| **Editor Enhancements** | Relative line numbers, mouse + clipboard support, tab-based indentation, smooth coding defaults |

---

## ⚙️ Installation (on a new machine)
```bash
# 1. Clone this repo — for example:
git clone https://github.com/your-username/your-neovim-config.git ~/nvim-config

# 2. (Optional) Use symlink so Neovim loads it automatically:
ln -s ~/nvim-config ~/.config/nvim

# 3. Open Neovim and install plugins:
nvim

# In Neovim:
:Lazy sync
```

> After this, Mason will install LSP servers; Treesitter will compile parsers; everything should be ready.

---

## 🎛 Keybindings & Usage

| Action | Keys / Command |
| --------------------------------------- | ----------------------------------------------------------------------------- |
| **Fuzzy file search** | `<leader>ff` → find files |
| **Live grep (search in project)** | `<leader>fg` |
| **List open buffers** | `<leader>fb` |
| **Help tags search** | `<leader>fh` |
| **Toggle file explorer** | `<leader>e` |
| **Save file** | `<leader>w` |
| **Quit buffer** | `<leader>q` |
| **LazyGit** | `<leader>gg` |
| **Git: preview / blame / stage / diff** | `<leader>gp / gb / gs / gd` etc. |
| **Toggle outline / symbol view** | `<leader>a` |
| **Open integrated terminal** | `<leader>t` |
| **Harpoon — mark file / quick nav** | `<leader>ha`, `<leader>hh`, `<leader>h1/h2/h3` |
| **Diagnostics / Problems panel** | `<leader>xx` |
| **Debug (DAP)** | `<F5>` (continue), `<F10>` (step over), `<F11>` (step in), `<F12>` (step out) |
| **Toggle breakpoint / condition** | `<leader>db` / `<leader>dB` |
| **Toggle DAP UI** | `<leader>du` |
| **Format on save** | automatically formats on `:w` |

*(Leader = **Spacebar**)*

---

## 📝 Recommended Workflow (React / Next.js / TSX Development)

1. Open project directory in Neovim (e.g. `nvim .`)
2. Use `<leader>ff` or Harpoon to open relevant files
3. Write code — auto-completion + suggestions + auto-imports will work as you type
4. Use `<leader>xx` to inspect all lint / type / formatting warnings or errors (Problems view)
5. Save file → formatting + linting auto-runs
6. Use built-in terminal (toggle with `<leader>t`) to run dev server (`npm run dev` etc.)
7. Use DAP (F5) to debug Node / Next.js code
8. Use Git signs / LazyGit keybindings to manage changes

---

## ⭐ Why I Built This

* I wanted a **VS Code–like experience** but with the power + speed of Neovim.
* I work often with **React + TypeScript + Next.js + full-stack** codebases, so auto-imports, lint/format, and debugging inside the editor are essential.
* I wanted configs to be **portable** — usable on any Linux (Ubuntu) machine with minimal setup.
* I prefer **keyboard-driven workflows**, fuzzy search, fast navigation — but still full IDE power under the hood.

If that sounds like something you want too — feel free to use this config, fork it, personalize it, or contribute!

---

## 📂 Repo Structure
```
.
├── init.lua          – main config entrypoint
├── lua/              – plugin configuration + custom logic
│   └── plugins.lua   – plugin list (lazy.nvim)
└── README.md         – this documentation
```

---

## ✅ Before You Use / Known Caveats

* Ensure you are using **Neovim ≥ 0.11** (for native `vim.lsp` API compatibility)
* Ensure you have **Node.js**, **npm/yarn** installed (for JS/TS language-servers + debugging)
* On a fresh clone: first open Neovim and run `:Lazy sync`, then allow Mason to install LSP servers and Treesitter to compile parsers.
* For better clipboard support on Linux, install `xclip` or `wl-clipboard`.

---

## 🧑‍💻 Feedback, Contribution & Customization

* Feel free to **fork** or **copy** this repo — I encourage personalization (theme tweaks, keymaps, extra plugins)
* Open an issue or pull request if you find a bug, want to add a plugin or improvement
* You can extend this setup with your own shell / tmux / other dotfiles — makes for an awesome unified dev environment

---

## 📜 License / Disclaimer

Use at your own risk. This config is provided "as is." I maintain it for **my personal use**, but welcome suggestions and improvements from the community.
---