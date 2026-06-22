#!/bin/sh
input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name // .model.id // "unknown"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

if [ -n "$used" ] && [ -n "$remaining" ]; then
  printf "\033[36m%s\033[0m  ctx: \033[33m%.0f%%\033[0m used / \033[32m%.0f%%\033[0m remaining" \
    "$model" "$used" "$remaining"
else
  printf "\033[36m%s\033[0m" "$model"
fi
