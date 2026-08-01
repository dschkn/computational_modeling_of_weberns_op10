#!/bin/sh

# Copyright (c) Dmitrii Shchukin 2026
set -eu

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 /absolute/path/WebernCompositionalModel.app /absolute/path/output.zip" >&2
  exit 64
fi

app_path=$1
output_zip=$2

case "$app_path" in
  /*) ;;
  *) echo "The application path must be absolute." >&2; exit 64 ;;
esac

case "$output_zip" in
  /*) ;;
  *) echo "The output path must be absolute." >&2; exit 64 ;;
esac

if [ ! -d "$app_path/Contents" ]; then
  echo "Not a macOS application bundle: $app_path" >&2
  exit 66
fi

if [ -e "$output_zip" ]; then
  echo "Refusing to overwrite existing output: $output_zip" >&2
  exit 73
fi

if ! command -v ditto >/dev/null 2>&1; then
  echo "This packaging script must run on macOS (ditto is unavailable)." >&2
  exit 69
fi

ditto -c -k --sequesterRsrc --keepParent "$app_path" "$output_zip"
shasum -a 256 "$output_zip"

