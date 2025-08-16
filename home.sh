#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

echo "🏠 Applying Home Manager configuration for david..."
home-manager switch --flake .#david

echo "✅ Done!"
