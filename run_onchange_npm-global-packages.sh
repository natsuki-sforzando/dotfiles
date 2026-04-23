#!/bin/bash

# set -eufo pipefail

NPM_GLOBAL_PACKAGES=(
  "@playwright/mcp"
  "@playwright/cli"
  "commitizen"
  "cz-emoji"
  "happy"
  "npm-check-updates"
)

if ! command -v mise &> /dev/null; then
  echo "mise is not installed, skipping npm global packages installation."
  exit 0
fi

mise install
mise exec node -- npm install --global "${NPM_GLOBAL_PACKAGES[@]}"
echo "✅ npm global packages installed successfully."
