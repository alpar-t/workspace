#!/bin/bash

REPO_URL="https://github.com/alpar-t/workspace.git"
REPO_DIR="workspace"

# Clone the repo if not present
if [ ! -d "$REPO_DIR" ]; then
  echo "Cloning repo..."
  echo "If you are prompted to install Git, please accept the prompt to install Xcode Command Line Tools."
  git clone --recursive "$REPO_URL" "$REPO_DIR"
fi

cd "$REPO_DIR"

# Check if comtrya is installed
if ! command -v comtrya &> /dev/null; then
  echo "comtrya not found. Installing..." 
  curl -fsSL https://install.comtrya.dev | bash
  export PATH="$HOME/.local/bin:$PATH"
fi

# Run comtrya apply in the comtrya directory
cd comtrya
comtrya apply "$@"
