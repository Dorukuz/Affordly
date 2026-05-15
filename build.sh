#!/usr/bin/env bash
# Coolify / Nixpacks static build: publish site into dist/ (copied to nginx html).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="${ROOT}/dist"

rm -rf "${OUT}"
mkdir -p "${OUT}/assets"

cp "${ROOT}/index.html" \
   "${ROOT}/privacy.html" \
   "${ROOT}/support.html" \
   "${ROOT}/terms.html" \
   "${OUT}/"

cp -R "${ROOT}/assets/." "${OUT}/assets/"

# Optional: keep for hosts that read _redirects (nginx uses nginx.conf instead).
if [[ -f "${ROOT}/_redirects" ]]; then
  cp "${ROOT}/_redirects" "${OUT}/"
fi

echo "Built static site → ${OUT}"
