#!/bin/bash

# Pumpkin AI - Ubuntu Setup Script
# This script automates the installation process for Ubuntu/Linux

set -e  # Exit on any error

echo "🎃 Pumpkin AI - Ubuntu Setup Script"
echo "===================================="
echo ""

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
   echo "❌ Please do not run this script as root"
   exit 1
fi

# Update package list
echo "📦 Updating package list..."
sudo apt update

# Install system dependencies
echo ""
echo "📦 Installing system dependencies..."
sudo apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    libopencv-dev \
    python3-opencv \
    v4l-utils \
    libv4l-dev \
    build-essential \
    pkg-config

# Create virtual environment
echo ""
echo "🐍 Creating virtual environment..."
if [ -d "venv" ]; then
    echo "⚠ Virtual environment already exists. Removing old one..."
    rm -rf venv
fi
python3 -m venv venv

# Activate virtual environment
echo ""
echo "🔌 Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo ""
echo "⬆️  Upgrading pip..."
pip install --upgrade pip

# Install Python dependencies
echo ""
echo "📚 Installing Python dependencies..."
pip install -r requirements.txt

# Set up camera permissions (optional - user can do this manually)
echo ""
echo "📷 Camera permissions..."
echo "If you have issues with camera access, you may need to:"
echo "  sudo usermod -a -G video $USER"
echo "  (Then log out and log back in)"
echo ""

# Success message
echo "✅ Setup complete!"
echo ""
echo "To start the application:"
echo "  1. Activate the virtual environment:"
echo "     source venv/bin/activate"
echo ""
echo "  2. Run the server:"
echo "     python3 web_server.py"
echo ""
echo "  3. Open your browser and go to:"
echo "     http://localhost:5000"
echo ""
echo "📖 For more information, see README.md"
echo "🤖 For AI setup, see OLLAMA_SETUP.md"
echo ""
echo "Happy Halloween! 🎃👻"
