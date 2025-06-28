#!/usr/bin/env bash
# Install or upgrade Visual Studio Code
# ▸ Debian/Ubuntu  (apt / apt-fast)
# ▸ macOS          (Homebrew)

set -euo pipefail

. "$(dirname "${BASH_SOURCE[0]}")/../base/functions.sh"

# ---------- helpers ---------------------------------------------------------
die() { printf "❌  %s\n" "$*" >&2; exit 1; }

pkg() {                     # transparent apt-fast ▸ apt-get wrapper
  if command -v apt-fast >/dev/null 2>&1; then
    sudo apt-fast -y "$@"
  else
    sudo apt-get  -y "$@"
  fi
}

# ---------- installers ------------------------------------------------------
install_linux() {
  echo "→ Installing VS Code on Linux …"

  local keyring=/usr/share/keyrings/microsoft.gpg
  local repo=/etc/apt/sources.list.d/vscode.list
  local arch
  arch="$(dpkg --print-architecture)"          # amd64 / arm64 / …

  # 0. prereqs
  pkg install software-properties-common apt-transport-https curl gnupg >/dev/null

  # 1. GPG key (idempotent)
  if [[ ! -f "$keyring" ]]; then
    curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
      | gpg --dearmor \
      | sudo tee "$keyring" >/dev/null
  fi

  # 2. Repository (idempotent)
  if [[ ! -f "$repo" ]]; then
    echo "deb [arch=${arch} signed-by=${keyring}] https://packages.microsoft.com/repos/vscode stable main" \
      | sudo tee "$repo" >/dev/null
  fi

  # 3. Install / upgrade
  sudo apt-get update -qq
  pkg install code
}

install_macos() {
  echo "→ Installing VS Code on macOS …"
  if command -v brew >/dev/null 2>&1; then
    brew install --cask visual-studio-code   # works on Intel & Apple Silicon
  else
    die "Homebrew not found – install Homebrew first (https://brew.sh)"
  fi
}

# ---------- main ------------------------------------------------------------
main() {
  if _is_service_exist code; then
    echo "✓ VS Code is already available."
    return
  fi

  case "$OSTYPE" in
    linux-gnu*) install_linux ;;
    darwin*)    install_macos ;;
    *)          die "Unsupported OS: $OSTYPE" ;;
  esac
}

main "$@"

