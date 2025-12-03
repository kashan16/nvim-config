# My Neovim Config 🧑‍💻

> A full-featured, cyberpunk-themed Neovim configuration — optimized for React / TypeScript / Next.js / full-stack web development
> Includes blazing-fast auto-imports, LSP, fuzzy search with FZF, Git integration, DAP debugging, and VS Code–like convenience.

---

## 🚀 Why this setup

- **Modern and blazing fast:** Uses `lazy.nvim` with smart lazy-loading, so startup stays instant even with 30+ plugins.
- **TypeScript & JS powerhouse:** Lightning-fast auto-imports, completions, linting, and formatting using `typescript-tools.nvim`, `nvim-cmp`, and `none-ls`.
- **Full IDE experience:** Complete full-stack toolkit — file tree, fuzzy search with FZF, outline view, git tools, debugging support, integrated terminal.
- **Cyberpunk aesthetics:** Eye-catching TokyoNight theme with colorful syntax highlighting and modern UI elements.
- **Cross-machine reproducible:** Clone once, use everywhere — works seamlessly on any Linux/macOS setup.

---

## 📦 What's Included (Highlights)

| Category | Plugins / Features |
|---------|-------------------|
| **Theme & UI** | `tokyonight.nvim` (cyberpunk storm), `lualine`, `nvim-web-devicons` |
| **Syntax & Parsing** | `nvim-treesitter` (JS/TS/TSX/HTML/CSS/Lua/JSON/Python/Go/SQL/YAML/more) |
| **File Navigation** | `telescope.nvim` with `telescope-fzf-native` (fastest fuzzy finder), `neo-tree.nvim`, `harpoon` v2 |
| **Auto-close / Auto-tagging** | `nvim-autopairs`, `nvim-ts-autotag` (smart brackets, JSX/HTML tags) |
| **Commenting** | `Comment.nvim` (context-aware toggling) |
| **Git Integration** | `gitsigns.nvim` (inline git hunks), `lazygit.nvim` (full Git UI) |
| **IntelliSense (LSP)** | `mason.nvim`, `mason-lspconfig`, `nvim-lspconfig`, `typescript-tools.nvim` (optimized for TS/JS) |
| **Autocomplete & Snippets** | `nvim-cmp` with `lspkind` (VSCode icons), `LuaSnip`, `friendly-snippets` |
| **Linting & Formatting** | `none-ls.nvim` with Prettier, Stylua, ESLint, Black — auto-format on save |
| **Diagnostics / Error Panel** | `trouble.nvim` for VS Code–style problems panel |
| **Code Navigation** | LSP-powered go-to-definition, references, hover, rename, code actions |
| **Code Outline** | `aerial.nvim` — hierarchical symbol view |
| **Terminal Integration** | `toggleterm.nvim` — floating terminal with curved borders |
| **Debugging** | `nvim-dap`, `nvim-dap-ui`, `nvim-dap-virtual-text` — full DAP support for JS/TS/Node/Next.js |
| **Editor Enhancements** | `nvim-colorizer` (live CSS color preview), `nvim-surround` (quick text wrapping), `indent-blankline`, `vim-visual-multi` (multiple cursors) |
| **Web Dev Extras** | Emmet LSP, Tailwind CSS IntelliSense, HTML/CSS LSP |

---

## ⚙️ Installation (on a new machine)

```bash
# 1. Clone this repo
git clone https://github.com/kashan16/nvim-config.git ~/nvim-config

# 2. Symlink to Neovim config directory
ln -s ~/nvim-config ~/.config/nvim

# 3. Open Neovim and let lazy.nvim install plugins
nvim

# In Neovim, plugins will auto-install, or run:
:Lazy sync

# 4. Install language servers (Mason will prompt, or run):
:Mason
```

> After this, Mason will install LSP servers; Treesitter will compile parsers; everything should be ready in under a minute.

**Requirements:**
- Neovim ≥ 0.9.0
- Node.js & npm (for TypeScript/JavaScript LSPs)
- Git
- A Nerd Font (for icons) — recommended: [JetBrainsMono Nerd Font](https://www.nerdfonts.com/)
- `ripgrep` (for Telescope live grep): `sudo apt install ripgrep` or `brew install ripgrep`
- Optional: `xclip` or `wl-clipboard` for better clipboard support on Linux

---

## 🎛 Keybindings & Usage

*(Leader = **Spacebar**)*

### File Navigation & Search
| Action | Keybinding |
|--------|-----------|
| Find files (fuzzy) | `<leader>ff` |
| Live grep (search in project) | `<leader>fg` |
| Find word under cursor | `<leader>fw` |
| List open buffers | `<leader>fb` |
| Recent files | `<leader>fr` |
| Help tags search | `<leader>fh` |

### File Explorer & Navigation
| Action | Keybinding |
|--------|-----------|
| Toggle Neo-tree | `<leader>e` |
| Focus Neo-tree | `<leader>o` |
| Next buffer | `Shift + l` |
| Previous buffer | `Shift + h` |
| Close buffer | `<leader>bd` |

### Window Management
| Action | Keybinding |
|--------|-----------|
| Navigate windows | `Ctrl + h/j/k/l` |
| Resize vertically | `Ctrl + Up/Down` |
| Resize horizontally | `Ctrl + Left/Right` |

### Git
| Action | Keybinding |
|--------|-----------|
| LazyGit (full UI) | `<leader>gg` |

### LSP & Code Actions
| Action | Keybinding |
|--------|-----------|
| Go to definition | `gd` |
| Go to declaration | `gD` |
| Find references | `gr` |
| Go to implementation | `gi` |
| Hover documentation | `K` |
| Rename symbol | `<leader>rn` |
| Code actions | `<leader>ca` |
| Format buffer | `<leader>f` |

### Diagnostics & Problems
| Action | Keybinding |
|--------|-----------|
| Toggle diagnostics panel | `<leader>xx` |
| Document diagnostics | `<leader>xd` |
| Location list | `<leader>xl` |
| Quickfix list | `<leader>xq` |

### Terminal
| Action | Keybinding |
|--------|-----------|
| Toggle terminal | `<leader>tt` |
| Exit terminal mode | `Esc` (in terminal) |

### Code Outline
| Action | Keybinding |
|--------|-----------|
| Toggle outline view | `<leader>a` |

### Harpoon (Quick File Navigation)
| Action | Keybinding |
|--------|-----------|
| Add file to harpoon | `<leader>ha` |
| Toggle harpoon menu | `<leader>hh` |
| Jump to file 1-4 | `<leader>1/2/3/4` |

### Debugging (DAP)
| Action | Keybinding |
|--------|-----------|
| Toggle breakpoint | `<leader>db` |
| Continue/Start debug | `<leader>dc` |
| Step into | `<leader>di` |
| Step over | `<leader>do` |
| Step out | `<leader>dO` |
| Open REPL | `<leader>dr` |
| Toggle DAP UI | `<leader>du` |

### Editing Enhancements
| Action | Keybinding |
|--------|-----------|
| Clear search highlight | `Esc` |
| Move line up (visual) | `K` |
| Move line down (visual) | `J` |
| Stay in indent mode | `< / >` (in visual) |
| Center after scroll | `Ctrl + d/u` |

---

## 📝 Recommended Workflow (React / Next.js / TypeScript Development)

1. **Open project:** `nvim .` in your project directory
2. **Find files fast:** Use `<leader>ff` or live grep with `<leader>fg`
3. **Code with intelligence:** Auto-imports, completions, and type hints work as you type
4. **Navigate effortlessly:** Use `gd` to jump to definitions, `gr` for references
5. **Check problems:** Press `<leader>xx` to see all errors/warnings in Trouble panel
6. **Auto-format:** Files format automatically on save (Prettier/ESLint)
7. **Use terminal:** Toggle terminal with `<leader>tt`, run `npm run dev`
8. **Debug:** Set breakpoints with `<leader>db`, start debugging with `<leader>dc`
9. **Git workflow:** Use `<leader>gg` for LazyGit's beautiful UI
10. **Quick navigation:** Mark important files with Harpoon (`<leader>ha`), jump instantly with `<leader>1-4`

---

## ⭐ Why I Built This

* I wanted a **VS Code–like experience** with Neovim's speed and extensibility
* Working with **React + TypeScript + Next.js + Tailwind** requires fast auto-imports and intelligent completions
* I needed **portable configs** that work across different machines with minimal setup
* I prefer **keyboard-driven workflows** with fuzzy search and fast navigation, but still want full IDE features
* The **cyberpunk aesthetic** makes coding more enjoyable and reduces eye strain during long sessions

If this resonates with you — feel free to use, fork, or contribute to this config!

---

## 📂 Repo Structure
```
.
├── init.lua          – main configuration entrypoint (settings, LSP, keymaps, autocommands)
├── lua/
│   └── plugins.lua   – plugin specifications (lazy.nvim)
└── README.md         – this documentation
```

---

## ✅ Key Features & Optimizations

- **Lazy Loading:** Plugins load only when needed, keeping startup time under 50ms
- **Smart Auto-Import:** TypeScript Tools configured for optimal import resolution
- **FZF Integration:** Native C implementation for blazing-fast fuzzy finding
- **Auto-Format on Save:** Prettier, ESLint, and language-specific formatters run automatically
- **Live CSS Colors:** See color previews inline with nvim-colorizer
- **Multiple Cursors:** VSCode-like multi-cursor editing with vim-visual-multi
- **Auto-Close Tree:** Neo-tree automatically closes when it's the last buffer
- **Trailing Whitespace:** Automatically removed on save
- **Highlight on Yank:** Visual feedback when copying text
- **Diagnostics UI:** Beautiful diagnostic signs with icons and floating windows

---

## 🎨 Theme Alternatives

While TokyoNight (storm) is the default, you can easily switch themes by editing `plugins.lua`:

**Other cyberpunk options:**
- `EdenEast/nightfox.nvim` — use "cyberdream" variant
- `catppuccin/nvim` — use "mocha" flavor
- `folke/tokyonight.nvim` — try "night" or "moon" styles

Just replace the theme plugin section and update the colorscheme command!

---

## 🐛 Troubleshooting

**Plugins not loading?**
```vim
:Lazy sync
:checkhealth lazy
```

**LSP not working?**
```vim
:Mason
:LspInfo
:checkhealth lsp
```

**Treesitter errors?**
```vim
:TSUpdate
:checkhealth nvim-treesitter
```

**Icons not showing?**
- Install a Nerd Font and configure your terminal to use it

---

## 🧑‍💻 Feedback, Contribution & Customization

* **Fork freely** — this config is meant to be personalized
* **Open issues/PRs** for bugs, improvements, or plugin suggestions
* **Extend it** — combine with your shell configs, tmux, and other dotfiles for a complete dev environment
* **Share** — if you build something cool on top of this, let me know!

---

## 📜 License

MIT License — use at your own risk. This config is maintained for **personal use** but welcomes community contributions.

---

**Happy coding! 🚀**