# 🚀 LazyVim Full Config

LazyVim configuration with AI (Kimi), Debug, and Tmux integration. Optimized for **Node.js, React, Python** development.

## ✨ Features

- 🤖 **AI Integration**: Kimi API via Avante.nvim (Cursor-like experience)
- 🐛 **Debug**: Full DAP support for Node.js, React, Python
- 🖥️ **Tmux**: Seamless navigation between Vim splits and Tmux panes
- 🎨 **Theme**: Catppuccin Mocha with beautiful icons
- ⚡ **Fast**: Lazy-loaded plugins, optimized startup
- 🔧 **LSP**: Full language server support

## 📦 Prerequisites

- Git
- Node.js & npm
- `uv` (Python package manager) - **recommended**
- Nerd Font (JetBrainsMono)

## 🚀 Quick Install

### One-liner (with uv)

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/lazyvim-config/main/scripts/install.sh | bash
```

### Manual Install

```bash
# 1. Clone this repo
git clone https://github.com/YOUR_USERNAME/lazyvim-config.git ~/lazyvim-config
cd ~/lazyvim-config

# 2. Run install script
chmod +x scripts/install.sh
./scripts/install.sh
```

### Using uv for Python (Recommended)

```bash
# Install uv if not already
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install Python tools
uv python install 3.12
uv venv ~/.local/share/nvim-python
uv pip install --python ~/.local/share/nvim-python/bin/python debugpy ruff black
```

## 🔑 Setup Kimi API

Get API key: https://platform.moonshot.cn

```bash
# Add to ~/.bashrc or ~/.zshrc
export KIMI_API_KEY="your-api-key-here"
```

## 🎮 Keymaps

| Key | Function |
|-----|----------|
| `Space e` | File explorer |
| `Space ff` | Find files |
| `Space fg` | Grep in project |
| `Space aa` | AI Ask (Kimi) |
| `Space ae` | AI Edit |
| `F5` | Debug Continue |
| `F10` | Debug Step Over |
| `F11` | Debug Step Into |
| `Space db` | Toggle Breakpoint |
| `Space du` | Toggle Debug UI |
| `Ctrl+h/j/k/l` | Navigate windows/tmux |
| `Alt+j/k` | Move lines |

## 📁 Structure

```
.
├── lua/
│   ├── config/
│   │   ├── keymaps.lua      # Custom keymaps
│   │   ├── options.lua      # Vim options
│   │   └── autocmds.lua     # Auto commands
│   └── plugins/
│       ├── colorscheme.lua  # Catppuccin theme
│       ├── avante.lua       # AI (Kimi)
│       ├── dap.lua          # Debug
│       ├── tmux.lua         # Tmux navigator
│       ├── extras.lua       # Additional plugins
│       └── lsp.lua          # LSP config
├── scripts/
│   ├── install.sh           # Install script
│   └── update.sh            # Update config
└── README.md
```

## 🔄 Update Config

```bash
cd ~/lazyvim-config
git pull
./scripts/update.sh
```

## 🛠️ Customization

Edit files in `~/.config/nvim/lua/`:

- `config/keymaps.lua` - Add your keymaps
- `config/options.lua` - Change vim options
- `plugins/*.lua` - Add/modify plugins

## 🐛 Troubleshooting

### Font not displaying

Install JetBrainsMono Nerd Font and set it in your terminal.

### LSP not working

```vim
:Mason
```

Install required language servers.

### Debug not working

```bash
# Reinstall debugpy
uv pip install --python ~/.local/share/nvim-python/bin/python debugpy
```

## 📄 License

MIT
