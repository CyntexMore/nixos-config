#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

echo "🚀 Rebuilding NixOS system..."
sudo nixos-rebuild switch --flake .#nixos

echo "🔑 Fixing permissions for user: $USER"
sudo chown -R $USER:$(id -gn) .

echo "✅ Done!"

