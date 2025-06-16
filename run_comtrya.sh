#!/bin/bash

set -e

REPO_URL="https://github.com/alpar-t/workspace.git"
REPO_DIR=".workspace"

# Clone the repo if not present
if [ ! -d "$REPO_DIR" ]; then
  echo "Cloning repo..."
  echo "If you are prompted to install Git, please accept the prompt to install Xcode Command Line Tools."
  git clone --recursive "$REPO_URL" "$REPO_DIR"
fi

cd "$REPO_DIR"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add Homebrew to PATH for immediate use (Apple Silicon default)
  if [ -d "/opt/homebrew/bin" ]; then
    eval "$('/opt/homebrew/bin/brew' shellenv)"
  elif [ -d "/usr/local/bin" ]; then
    eval "$('/usr/local/bin/brew' shellenv)"
  fi
fi

# Check if comtrya is installed
if ! [ -f $REPO_DIR/comtrya-aarch64-apple-darwin ] then
  echo "comtrya not found. Installing..." 
  curl -fsSL https://get.comtrya.dev | bash
  export PATH="$HOME/.local/bin:$PATH"
fi

# Run comtrya apply in the comtrya directory
$REPO_DIR/comtrya-aarch64-apple-darwin apply comtrya/osx.yaml
