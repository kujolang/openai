#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; KUJO_BIN="${KUJO_BIN:-$(command -v kujo)}"; KERNEL="${KENNEL_SCRIPT:-$ROOT/../kennel/kennel.kujo}"; REF="${OPENAI_REF:-v0.1.0}"; CLEAN="$(mktemp -d "${TMPDIR:-/tmp}/kujo-openai-installed.XXXXXX")"; trap 'rm -rf "$CLEAN"' EXIT; cd "$CLEAN"
"$KUJO_BIN" run "$KERNEL" --interpreter -- init --name openai-installed --project-dir "$CLEAN"
"$KUJO_BIN" run "$KERNEL" --interpreter -- add github:kujolang/openai@"$REF" --alias openai --project-dir "$CLEAN"
"$KUJO_BIN" run "$KERNEL" --interpreter -- install --project-dir "$CLEAN"
"$KUJO_BIN" run "$KERNEL" --interpreter -- install --project-dir "$CLEAN"
"$KUJO_BIN" run "$KERNEL" --interpreter -- validate --project-dir "$CLEAN"
(cd "$CLEAN" && env -u KUJO_MODULE_PATH "$KUJO_BIN" test-run "$CLEAN/kennel_packages/openai/tests/installed_consumer_smoke.kujo")
echo "Installed-package Kennel smoke: PASS"
