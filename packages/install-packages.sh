#!/bin/bash

set -e
cd "$(dirname "$0")"

function install_arch() {
  readarray -t packages <./arch-packages

  required_packages=()
  for pkg in "${packages[@]}"; do
    if ! pacman -Qi "$pkg" &>/dev/null; then
      echo "${pkg} needs to be installed"
      required_packages+=("$pkg")
    else
      echo "${pkg} already installed"
    fi
  done

  if [[ "${#required_packages[@]}" -gt 0 ]]; then
    pacman -S "${required_packages[@]}"
  fi
}

function install_brew() {
  readarray -t packages <./brew-packages

  required_packages=()
  for pkg in "${packages[@]}"; do
    if ! brew list "$pkg" &>/dev/null; then
      echo "${pkg} needs to be installed"
      required_packages+=("$pkg")
    else
      echo "${pkg} already installed"
    fi
  done

  if [[ "${#required_packages[@]}" -gt 0 ]]; then
    brew install "${required_packages[@]}"
  fi
}

if command -v "pacman" &>/dev/null; then
  echo "Using pacman to install packages"
  install_arch
elif command -v "brew" &>/dev/null; then
  echo "Using homebrew to install packages"
  install_brew
else
  echo "No supported package manager detected, aborting install"
  exit 1
fi
