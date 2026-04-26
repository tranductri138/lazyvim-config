#!/bin/bash
set -e

echo "🚀 LazyVim Full Setup with uv"
echo "=============================="

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Functions
print_step() {
    echo -e "${BLUE}▶ $1${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Check OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
    if command -v apt &> /dev/null; then
        PKG_MANAGER="apt"
    elif command -v yum &> /dev/null; then
        PKG_MANAGER="yum"
    elif command -v pacman &> /dev/null; then
        PKG_MANAGER="pacman"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
    PKG_MANAGER="brew"
else
    print_error "OS not supported: $OSTYPE"
    exit 1
fi

print_step "Detected OS: $OS"

# Check Neovim version
check_neovim() {
    if command -v nvim &> /dev/null; then
        NVIM_VERSION=$(nvim --version | head -1 | grep -oP '\d+\.\d+' | head -1)
        MAJOR=$(echo $NVIM_VERSION | cut -d. -f1)
        MINOR=$(echo $NVIM_VERSION | cut -d. -f2)
        
        if [ "$MAJOR" -gt 0 ] && [ "$MINOR" -ge 9 ]; then
            print_success "Neovim $NVIM_VERSION found (>= 0.9)"
            return 0
        else
            print_warning "Neovim $NVIM_VERSION found (< 0.9), need upgrade"
            return 1
        fi
    else
        print_warning "Neovim not found"
        return 1
    fi
}

# Install dependencies
install_dependencies() {
    print_step "Installing dependencies..."
    
    if [ "$OS" == "linux" ]; then
        if [ "$PKG_MANAGER" == "apt" ]; then
            sudo apt update
            sudo apt install -y git curl wget unzip ripgrep fd-find nodejs npm build-essential
        elif [ "$PKG_MANAGER" == "yum" ]; then
            sudo yum install -y git curl wget unzip ripgrep fd nodejs npm gcc make
        elif [ "$PKG_MANAGER" == "pacman" ]; then
            sudo pacman -S --noconfirm git curl wget unzip ripgrep fd nodejs npm base-devel
        fi
    elif [ "$OS" == "macos" ]; then
        if ! command -v brew &> /dev/null; then
            print_step "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install git curl wget unzip ripgrep fd node
    fi
    
    print_success "Dependencies installed"
}

# Install/Upgrade Neovim
install_neovim() {
    print_step "Installing Neovim..."
    
    if [ "$OS" == "linux" ]; then
        if [ "$PKG_MANAGER" == "apt" ]; then
            # Try PPA first
            sudo add-apt-repository -y ppa:neovim-ppa/unstable
            sudo apt update
            sudo apt install -y neovim
        else
            # Install from binary
            curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
            sudo rm -rf /opt/nvim
            sudo tar -C /opt -xzf nvim-linux64.tar.gz
            sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
            rm nvim-linux64.tar.gz
        fi
    elif [ "$OS" == "macos" ]; then
        brew install neovim
    fi
    
    print_success "Neovim installed: $(nvim --version | head -1)"
}

# Install uv
install_uv() {
    print_step "Installing uv..."
    
    if command -v uv &> /dev/null; then
        print_success "uv already installed: $(uv --version)"
        return 0
    fi
    
    curl -LsSf https://astral.sh/uv/install.sh | sh
    
    # Add to PATH for current session
    export PATH="$HOME/.cargo/bin:$PATH"
    
    print_success "uv installed: $(uv --version)"
}

# Install Python via uv
install_python_uv() {
    print_step "Installing Python via uv..."
    
    # Install Python 3.12
    uv python install 3.12
    
    # Create global environment for tools
    uv venv "$HOME/.local/share/nvim-python"
    
    # Install debugpy and other tools
    uv pip install --python "$HOME/.local/share/nvim-python/bin/python" debugpy ruff black
    
    print_success "Python tools installed via uv"
}

# Install Nerd Font
install_font() {
    print_step "Installing JetBrainsMono Nerd Font..."
    
    FONT_DIR="$HOME/.local/share/fonts"
    mkdir -p "$FONT_DIR"
    
    cd "$FONT_DIR"
    
    if [ ! -f "JetBrainsMonoNerdFont-Regular.ttf" ]; then
        wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
        unzip -o JetBrainsMono.zip
        rm JetBrainsMono.zip
        fc-cache -fv
        print_success "Font installed"
    else
        print_success "Font already installed"
    fi
    
    cd - > /dev/null
}

# Backup existing config
backup_config() {
    print_step "Backing up existing config..."
    
    BACKUP_DIR="$HOME/.config/nvim-backup-$(date +%Y%m%d-%H%M%S)"
    
    if [ -d "$HOME/.config/nvim" ]; then
        mv "$HOME/.config/nvim" "$BACKUP_DIR"
        print_success "Backed up to $BACKUP_DIR"
    fi
    
    # Clean old state
    rm -rf "$HOME/.local/share/nvim"
    rm -rf "$HOME/.local/state/nvim"
    rm -rf "$HOME/.cache/nvim"
}

# Install LazyVim
install_lazyvim() {
    print_step "Installing LazyVim..."
    
    git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
    rm -rf "$HOME/.config/nvim/.git"
    
    print_success "LazyVim installed"
}

# Copy config files
copy_config() {
    print_step "Copying config files..."
    
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    REPO_ROOT="$(dirname "$SCRIPT_DIR")"
    
    # Copy all lua files
    cp -r "$REPO_ROOT/lua" "$HOME/.config/nvim/"
    
    print_success "Config files copied"
}

# Setup Kimi API
setup_kimi() {
    print_step "Setting up Kimi API..."
    
    if [ -z "$KIMI_API_KEY" ]; then
        print_warning "KIMI_API_KEY not set"
        echo ""
        echo "Please get your API key from: https://platform.moonshot.cn"
        echo "Then run: export KIMI_API_KEY='your-key-here'"
        echo ""
        read -p "Enter your KIMI_API_KEY (or press Enter to skip): " kimi_key
        
        if [ ! -z "$kimi_key" ]; then
            echo "export KIMI_API_KEY='$kimi_key'" >> "$HOME/.bashrc"
            export KIMI_API_KEY="$kimi_key"
            print_success "KIMI_API_KEY added to ~/.bashrc"
        fi
    else
        print_success "KIMI_API_KEY already set"
    fi
}

# Main installation
main() {
    echo ""
    echo "This script will install:"
    echo "  • Neovim (>= 0.9)"
    echo "  • uv (Python package manager)"
    echo "  • Python 3.12 + debug tools"
    echo "  • JetBrainsMono Nerd Font"
    echo "  • LazyVim + custom config (AI, Debug, Tmux)"
    echo ""
    read -p "Continue? (y/N): " confirm
    
    if [[ ! $confirm =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
    
    # Run all steps
    install_dependencies
    
    if ! check_neovim; then
        install_neovim
    fi
    
    install_uv
    install_python_uv
    install_font
    backup_config
    install_lazyvim
    copy_config
    setup_kimi
    
    echo ""
    echo -e "${GREEN}=============================="
    echo -e "✓ Installation Complete!"
    echo -e "==============================${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Set terminal font to 'JetBrainsMono Nerd Font'"
    echo "  2. Restart your terminal"
    echo "  3. Run: nvim"
    echo "  4. Wait for plugins to install (1-2 minutes)"
    echo "  5. Restart nvim"
    echo ""
    echo "Key features:"
    echo "  • Space+e     : File explorer"
    echo "  • Space+ff    : Find files"
    echo "  • Space+aa    : AI Ask (Kimi)"
    echo "  • F5          : Debug"
    echo "  • Ctrl+h/j/k/l: Navigate windows"
    echo ""
}

main "$@"
