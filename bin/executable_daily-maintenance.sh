#!/bin/bash

export PATH="$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"

echo "=== $(date '+%F %T') start ==="

chezmoi re-add
echo "chezmoi re-add: exit $?"

topgrade --yes --no-retry
echo "topgrade: exit $?"

echo "=== $(date '+%F %T') end ==="
