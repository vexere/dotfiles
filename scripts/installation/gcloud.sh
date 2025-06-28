#!/usr/bin/env bash
# Install Google Cloud SDK on Linux or macOS (Intel & Apple Silicon)

. "$(dirname "${BASH_SOURCE[0]}")/../base/functions.sh"

declare PET_VERSION="0.3.6"
declare DOTFILES="${HOME}/dotfiles"

install_linux() {
  echo "Installing gcloud SDK on Linux..."
  echo "deb http://packages.cloud.google.com/apt cloud-sdk main" \
      | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
  curl -sSL https://packages.cloud.google.com/apt/doc/apt-key.gpg \
      | sudo apt-key add -
  sudo apt-get update
  sudo apt-fast install --no-install-recommends -y google-cloud-sdk
}

install_macos() {
  echo "Installing gcloud SDK on macOS..."
  # Prefer Homebrew if it exists (works on Intel & Apple Silicon)
  if command -v brew >/dev/null 2>&1; then
    brew install --quiet google-cloud-sdk  # formula (no cask needed)
    return
  fi

  # Manual install (no Homebrew)
  local arch="$(uname -m)"
  local suffix="darwin-x86_64"
  [[ "$arch" == "arm64" ]] && suffix="darwin-arm"

  local file="google-cloud-cli-${suffix}.tar.gz"
  local url="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${file}"
  local tmpDir="$(mktemp -d)"
  local destDir="${HOME}/.gcloud"

  echo "Downloading ${file}..."
  curl -L "$url" -o "${tmpDir}/${file}"

  mkdir -p "$destDir"
  tar -xzf "${tmpDir}/${file}" -C "$destDir"

  # Non-interactive install
  "${destDir}/google-cloud-sdk/install.sh" --quiet

  rm -rf "$tmpDir"
  echo "gcloud SDK installed at ${destDir}/google-cloud-sdk"
}

main() {
  if ! _is_service_exist gcloud; then
    case "$OSTYPE" in
      linux-gnu*) install_linux ;;
      darwin*)     install_macos ;;
      *)           echo "Unsupported OS: $OSTYPE" ;;
    esac
  else
    echo "gcloud is already installed."
  fi
}

main
