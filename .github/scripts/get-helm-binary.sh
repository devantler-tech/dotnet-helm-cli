#!/bin/bash
set -e

get() {
  local url=$1
  local binary=$2
  local target_dir=$3
  local target_name=$4
  local archiveType=$5

  echo "Downloading $target_name from $url"
  if [ "$archiveType" = "tar" ]; then
    curl -LJ "$url" | tar xvz -C "$target_dir" "$binary"
    mv "$target_dir/$binary" "${target_dir}/$target_name"
  elif [ "$archiveType" = "zip" ]; then
    curl -LJ "$url" -o "$target_dir/$target_name.zip"
    unzip -o "$target_dir/$target_name.zip" -d "$target_dir"
    mv "$target_dir/$binary" "${target_dir}/$target_name"
    rm "$target_dir/$target_name.zip"
  elif [ "$archiveType" = false ]; then
    curl -LJ "$url" -o "$target_dir/$target_name"
  fi
  chmod +x "$target_dir/$target_name"
}

latest=$(curl -s https://api.github.com/repos/helm/helm/releases/latest | jq -r .tag_name)
#get "https://get.helm.sh/helm-$latest-darwin-amd64.tar.gz" "darwin-amd64/helm" "src/Devantler.HelmCLI/runtimes/osx-x64/native" "helm-osx-x64" "tar"
#get "https://get.helm.sh/helm-$latest-darwin-arm64.tar.gz" "darwin-arm64/helm" "src/Devantler.HelmCLI/runtimes/osx-arm64/native" "helm-osx-arm64" "tar"
#get "https://get.helm.sh/helm-$latest-linux-amd64.tar.gz" "linux-amd64/helm" "src/Devantler.HelmCLI/runtimes/linux-x64/native" "helm-linux-x64" "tar"
#get "https://get.helm.sh/helm-$latest-linux-arm64.tar.gz" "linux-arm64/helm" "src/Devantler.HelmCLI/runtimes/linux-arm64/native" "helm-linux-arm64" "tar"
#get "https://get.helm.sh/helm-$latest-windows-amd64.zip" "windows-amd64/helm.exe" "src/Devantler.HelmCLI/runtimes/win-x64/native" "helm-win-x64.exe" "zip"
#get "https://get.helm.sh/helm-$latest-windows-arm64.zip" "windows-arm64/helm.exe" "src/Devantler.HelmCLI/runtimes/win-arm64/native" "helm-win-arm64.exe" "zip"
rm -rf src/Devantler.HelmCLI/runtimes/*/native/darwin-*
rm -rf src/Devantler.HelmCLI/runtimes/*/native/linux-*
rm -rf src/Devantler.HelmCLI/runtimes/*/native/windows-*
